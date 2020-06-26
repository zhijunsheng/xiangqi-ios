//
//  ContentView.swift
//  CChess
//
//  Created by Zhijun Sheng on 2020-06-23.
//  Copyright © 2020 Gold Thumb Inc. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        BoardView(piece: testData.first!)
        
    }
}

struct BoardView: View {
    let piece: CChessPiece
    
    @State private var movingPieceLocation = CGPoint(x: 200, y: 300)
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                BoardGrid(bounds: geo.frame(in: .local))
                .stroke(Color.black)
                
                Image(self.piece.imageName)
                    .resizable()
                    .frame(width: cellSide(bounds: geo.frame(in: .local)), height: cellSide(bounds: geo.frame(in: .local)))
                    .position(piecePosition(bounds: geo.frame(in: .local), col: self.piece.col, row: self.piece.row))
                
                Image("rb")
                    .position(self.movingPieceLocation)
                    .gesture(DragGesture().onChanged({ value in
                        self.movingPieceLocation = value.location
                    }))
            }
        }
    }
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
        ContentView()
    }
}
