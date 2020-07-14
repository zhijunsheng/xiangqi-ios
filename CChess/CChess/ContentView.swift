//
//  ContentView.swift
//  CChess
//
//  Created by Zhijun Sheng on 2020-06-23.
//  Copyright © 2020 Gold Thumb Inc. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let cols: Int = 9
    let rows: Int = 10
    let nearbyService = NearbyService(serviceType: "gt-cchess")
    
    @ObservedObject var game = CChess()
    
    @State private var blackAtTop = true
    @State private var movingPieceLocation = CGPoint(x: 200, y: 300)
    @State private var movingPiece: CChessPiece?
    
    @State private var showingConnectedAlert = false
    @State private var showingDisconnectedAlert = false
    @State private var peer = "Peer"
    
    var body: some View {
        VStack {
            ZStack {
                GeometryReader { geo in
                    BoardGrid(bounds: geo.frame(in: .local), cols: self.cols, rows: self.rows, origX: self.originX(bounds: geo.frame(in: .local)), origY: self.originY(bounds: geo.frame(in: .local)), cellWidth: self.cellSide(bounds: geo.frame(in: .local)), cellHeight: self.cellSide(bounds: geo.frame(in: .local)))
                    .stroke(Color.pink)
                    
                    ForEach(Array(self.game.pieces), id: \.self) { piece in
                        Image(piece.imageName)
                            .resizable()
                            .frame(width: self.cellSide(bounds: geo.frame(in: .local)), height: self.cellSide(bounds: geo.frame(in: .local)))
                            .zIndex(piece == self.movingPiece ? 1 : 0)
                            .position(self.piecePosition(bounds: geo.frame(in: .local), piece: piece))
                            .gesture(DragGesture().onChanged({ value in
                                self.movingPieceLocation = value.location
                                if self.movingPiece == nil {
                                    let (fromCol, fromRow) = self.xyToColRow(bounds: geo.frame(in: .local), x: value.location.x, y: value.location.y)
                                    self.movingPiece = self.game.pieceAt(col: fromCol, row: fromRow)
                                }
                            }).onEnded({ value in
                                let toPoint: CGPoint = value.location
                                if let movingPiece = self.movingPiece {
                                    let (toCol, toRow) = self.xyToColRow(bounds: geo.frame(in: .local), x: toPoint.x, y: toPoint.y)
                                    self.movePiece(fromCol: movingPiece.col, fromRow: movingPiece.row, toCol: toCol, toRow: toRow)
                                    self.game.playSound()
                                }
                                
                                self.movingPiece = nil
                            }))
                    }
                }
            }
            
            Text(game.redsTurn ? "Red" : "Black")
                .font(.largeTitle)
            
            Button(action: {
                self.game.reset()
                self.blackAtTop = true
            }) {
                Text("Reset")
                    .font(.largeTitle)
            }
        }
        .onAppear {
            self.nearbyService.nearbyServiceDelegate = self
        }
        .alert(isPresented: $showingDisconnectedAlert) {
            Alert(title: Text("\(peer) disconnected"), message: Text("It may be reconnected in a few seconds."), dismissButton: .default(Text("Got it.")))
        }
        .alert(isPresented: $showingConnectedAlert) { /* firstMoveMade ? "" : */
            Alert(title: Text("\(peer) connected"), message: Text("Whoever moves first becomes white player. For handicap, drag pieces out of board before making the first move."), dismissButton: .default(Text("Got it.")))
        }
    }
    
    private func movePiece(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) {
        guard game.canMovePiece(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow) else {
            return
        }
        game.movePiece(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        nearbyService.send(msg: "\(fromCol):\(fromRow):\(toCol):\(toRow)")
    }
    
    private func piecePosition(bounds: CGRect, piece: CChessPiece) -> CGPoint {
        if piece == movingPiece {
            return movingPieceLocation
        } else {
            let x = originX(bounds: bounds) + CGFloat(p2pX(piece.col)) * cellSide(bounds: bounds)
            let y = originY(bounds: bounds) + CGFloat(p2pY(piece.row)) * cellSide(bounds: bounds)
            return CGPoint(x: x, y: y)
        }
    }
    
    private func xyToColRow(bounds: CGRect, x: CGFloat, y: CGFloat) -> (Int, Int) {
        let col: Int = Int((x - originX(bounds: bounds)) / cellSide(bounds: bounds) + 0.5)
        let row: Int = Int((y - originY(bounds: bounds)) / cellSide(bounds: bounds) + 0.5)
        return (p2pX(col), p2pY(row))
    }

    private func originX(bounds: CGRect) -> CGFloat {
        return (bounds.size.width - CGFloat(cols - 1) * cellSide(bounds: bounds)) / 2
    }

    private func originY(bounds: CGRect) -> CGFloat {
        return (bounds.size.height - CGFloat(rows - 1) * cellSide(bounds: bounds)) / 2
    }

    private func cellSide(bounds: CGRect) -> CGFloat {
        return min(bounds.size.width, bounds.size.height) / CGFloat(rows)
    }
    
    func p2pX(_ col: Int) -> Int { // p2p: peer to peer
        return blackAtTop ? col : cols - 1 - col
    }
    
    func p2pY(_ row: Int) -> Int {
        return blackAtTop ? row : rows - 1 - row
    }
}

extension ContentView: NearbyServiceDelegate {
    func connectedWith(peer: String) {
        self.peer = peer
        showingConnectedAlert = true
    }
    
    func disconnectedFrom(peer: String) {
        self.peer = peer
        showingDisconnectedAlert = true
    }
    
    func didSendInvitation() {
        blackAtTop.toggle()
    }
    
    func didReceive(msg: String) { // fromCol:fromRow:toCol:toRow
        let moveSubstringArray = msg.components(separatedBy: ":")
        if let fromCol = Int(moveSubstringArray[0]), let fromRow = Int(moveSubstringArray[1]), let toCol = Int(moveSubstringArray[2]), let toRow = Int(moveSubstringArray[3]) {
            game.movePiece(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        }
    }
}

struct BoardGrid: Shape {
    let bounds: CGRect
    let cols: Int
    let rows: Int
    let origX: CGFloat
    let origY: CGFloat
    let cellWidth: CGFloat
    let cellHeight: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()

        for row in 0..<rows {
            path.move(to: CGPoint(x: origX, y: origY + CGFloat(row) * cellHeight ))
            path.addLine(to: CGPoint(x: origX + CGFloat(cols - 1) * cellWidth, y: origY + CGFloat(row) * cellHeight))
        }

        for col in 0..<cols {
            path.move(to: CGPoint(x: origX + CGFloat(col) * cellWidth, y: origY))
            path.addLine(to: CGPoint(x: origX + CGFloat(col) * cellWidth, y: origY + 4 * cellHeight))

            path.move(to: CGPoint(x: origX + CGFloat(col) * cellWidth, y: origY + 5 * cellHeight))
            path.addLine(to: CGPoint(x: origX + CGFloat(col) * cellWidth, y: origY + 9 * cellHeight))
        }

        for i in 0..<2 {
            path.move(to: CGPoint(x: origX + 3 * cellWidth, y: origY + CGFloat(i) * 7 * cellHeight))
            path.addLine(to: CGPoint(x: origX + 5 * cellWidth, y: origY + CGFloat(2 + i * 7) * cellHeight))
            path.move(to: CGPoint(x: origX + 5 * cellWidth, y: origY + CGFloat(i) * 7 * cellHeight))
            path.addLine(to: CGPoint(x: origX + 3 * cellWidth, y: origY + CGFloat(2 + i * 7) * cellHeight))

            path.move(to: CGPoint(x: origX + CGFloat(i) * 8 * cellWidth, y: origY + 4 * cellHeight))
            path.addLine(to: CGPoint(x: origX + CGFloat(i) * 8 * cellWidth, y: origY + 5 * cellHeight))
        }
        return path
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(game: CChess())
    }
}
