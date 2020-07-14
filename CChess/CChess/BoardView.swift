//
//  BoardView.swift
//  CChess
//
//  Created by Zhijun Sheng on 2020-07-14.
//

import UIKit

class BoardView: UIView {
    let cols: Int = 9
    let rows: Int = 10
    var origX: CGFloat = -1
    var origY: CGFloat = -1
    var cellWidth: CGFloat = -1
    var cellHeight: CGFloat = 1
    
    private var blackAtTop = true
    private var movingPieceLocation: CGPoint?
//    private var movingPiece: CChessPiece?

    override func draw(_ rect: CGRect) {
        origX = originX(bounds: bounds)
        origY = originY(bounds: bounds)
        cellWidth = cellSide(bounds: bounds)
        cellHeight = cellSide(bounds: bounds)
        
        path(in: bounds).stroke()
    }

    private func path(in rect: CGRect) -> UIBezierPath {
        let path = UIBezierPath()

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
    
//    private func movePiece(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) {
//        guard game.canMovePiece(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow) else {
//            return
//        }
//        game.movePiece(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
//        nearbyService.send(msg: "\(fromCol):\(fromRow):\(toCol):\(toRow)")
//    }
//
//    private func piecePosition(bounds: CGRect, piece: CChessPiece) -> CGPoint {
//        if piece == movingPiece {
//            return movingPieceLocation
//        } else {
//            let x = originX(bounds: bounds) + CGFloat(p2pX(piece.col)) * cellSide(bounds: bounds)
//            let y = originY(bounds: bounds) + CGFloat(p2pY(piece.row)) * cellSide(bounds: bounds)
//            return CGPoint(x: x, y: y)
//        }
//    }
    
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
