//
//  ContentView.swift
//  CChess
//
//  Created by Zhijun Sheng on 2020-06-23.
//  Copyright © 2020 Gold Thumb Inc. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var game = CChessGame()
    
    @State private var movingPieceLocation = CGPoint(x: 200, y: 300)
    @State private var movingPiece: CChessPiece?
    
    var body: some View {
        VStack {
            ZStack {
                GeometryReader { geo in
                    BoardGrid(bounds: geo.frame(in: .local))
                    .stroke(Color.pink)
                    
                    ForEach(Array(self.game.pieces), id: \.self) { piece in
                        Image(piece.imageName)
                            .resizable()
                            .frame(width: cellSide(bounds: geo.frame(in: .local)), height: cellSide(bounds: geo.frame(in: .local)))
                            .zIndex(piece == self.movingPiece ? 1 : 0)
                            .position(piece == self.movingPiece ? self.movingPieceLocation : piecePosition(bounds: geo.frame(in: .local), col: piece.col, row: piece.row))
                            .gesture(DragGesture().onChanged({ value in
                                self.movingPieceLocation = value.location
                                if self.movingPiece == nil {
                                    let (fromCol, fromRow) = xyToColRow(bounds: geo.frame(in: .local), x: value.location.x, y: value.location.y)
                                    self.movingPiece = self.game.pieceAt(col: fromCol, row: fromRow)
                                }
                            }).onEnded({ value in
                                let toPoint: CGPoint = value.location
                                if let movingPiece = self.movingPiece {
                                    let (toCol, toRow) = xyToColRow(bounds: geo.frame(in: .local), x: toPoint.x, y: toPoint.y)
                                    self.movePiece(fromCol: movingPiece.col, fromRow: movingPiece.row, toCol: toCol, toRow: toRow)
                                }
                                
                                self.movingPiece = nil
                            }))
                    }
                }
            }
            
            Text("Red")
            
            Button(action: {
                
            }) {
                Text("Reset")
            }
        }
    }
    
    private func movePiece(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) {
        game.movePiece(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
    }
}

private func xyToColRow(bounds: CGRect, x: CGFloat, y: CGFloat) -> (Int, Int) {
    let col: Int = Int((x - originX(bounds: bounds)) / cellSide(bounds: bounds) + 0.5)
    let row: Int = Int((y - originY(bounds: bounds)) / cellSide(bounds: bounds) + 0.5)
    return (col, row)
}

private func piecePosition(bounds: CGRect, col: Int, row: Int) -> CGPoint {
    let x = originX(bounds: bounds) + CGFloat(col) * cellSide(bounds: bounds)
    let y = originY(bounds: bounds) + CGFloat(row) * cellSide(bounds: bounds)
    return CGPoint(x: x, y: y)
}

private func originX(bounds: CGRect) -> CGFloat {
    let cols: Int = 9
    return (bounds.size.width - CGFloat(cols - 1) * cellSide(bounds: bounds)) / 2
}

private func originY(bounds: CGRect) -> CGFloat {
    let rows: Int = 10
    return (bounds.size.height - CGFloat(rows - 1) * cellSide(bounds: bounds)) / 2
}

private func cellSide(bounds: CGRect) -> CGFloat {
    let rows: Int = 10
    return min(bounds.size.width, bounds.size.height) / CGFloat(rows + 1)
}

struct BoardGrid: Shape {
    let bounds: CGRect
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let cols: Int = 9
        let rows: Int = 10
        let origX: CGFloat = originX(bounds: bounds)
        let origY: CGFloat = originY(bounds: bounds)
        let cellWidth: CGFloat = cellSide(bounds: bounds)
        let cellHeight: CGFloat = cellSide(bounds: bounds)

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
        ContentView(game: CChessGame())
    }
}
