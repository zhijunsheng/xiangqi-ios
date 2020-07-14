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

    private let boardRatio: CGFloat = 1.1
    private var pieceRatio: CGFloat = 1.0
    private var movingPieceRatio: CGFloat = 1.3
    var originX: CGFloat = -10
    var originY: CGFloat = -10
    var cellSide: CGFloat = -10
    
    var shadowPieces: Set<CChessPiece> = []
    var cchessDelegate: CChessDelegate? = nil
    
    var fromCol: Int? = nil
    var fromRow: Int? = nil
    
    var movingImage: UIImage? = nil
    var movingPieceX: CGFloat = -1
    var movingPieceY: CGFloat = -1
    
    var blackAtTop = true
    
    var imageByName: [String: UIImage] = [:]
    var sharingDevice = false {
        didSet {
            imageByName.removeAll()
        }
    }

    override func draw(_ rect: CGRect) {
        if UIDevice.current.userInterfaceIdiom == .phone {
            pieceRatio = 1.0
            movingPieceRatio = 1.4
        } else {
            pieceRatio = 0.9
            movingPieceRatio = 1.2
        }
        
        cellSide = bounds.width * boardRatio / 10
        originX = (bounds.width - 8 * cellSide) / 2
        originY = (bounds.height - 9 * cellSide) / 2
        
        drawBoard()
        drawPieces()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let first = touches.first!
        let fingerLocation = first.location(in: self)
        fromCol = p2p(Int((fingerLocation.x - originX) / cellSide))
        fromRow = p2p(Int((fingerLocation.y - originY) / cellSide))
        
        if let fromCol = fromCol, let fromRow = fromRow, let movingPiece = cchessDelegate?.pieceAt(col: fromCol, row: fromRow) {
            movingImage = image(named: movingPiece.imageName)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let first = touches.first!
        let fingerLocation = first.location(in: self)
        movingPieceX = fingerLocation.x
        movingPieceY = fingerLocation.y
        setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let first = touches.first!
        let fingerLocation = first.location(in: self)
        
        let toCol: Int = p2p(Int((fingerLocation.x - originX) / cellSide))
        let toRow: Int = p2p(Int((fingerLocation.y - originY) / cellSide))
        
        if let fromCol = fromCol, let fromRow = fromRow, fromCol != toCol || fromRow != toRow {
            cchessDelegate?.play(with: Move(fC: fromCol, fR: fromRow, tC: toCol, tR: toRow))
        }
        movingImage = nil
        fromCol = nil
        fromRow = nil
        setNeedsDisplay()
    }
    
    private func drawBoard() {
        path(in: bounds).stroke()
    }
    
//    private func drawPieces() {
//        for piece in shadowPieces {
//            let img = UIImage(named: piece.imageName)
//            let imgLoc = piecePosition(bounds: bounds, piece: piece)
//
//            img?.draw(in: CGRect(x: imgLoc.x, y: imgLoc.y, width: cellWidth, height: cellHeight))
//        }
//    }
    
    private func drawPieces() {
        for piece in shadowPieces where fromCol != piece.col || fromRow != piece.row {
            let normalRect = CGRect(x: originX + CGFloat(p2p(piece.col)) * cellSide - cellSide/2, y: originY + CGFloat(p2p(piece.row)) * cellSide - cellSide/2, width: cellSide, height: cellSide)
            let imgRect = imageRect(normalRect: normalRect, ratio: pieceRatio)
            image(named: piece.imageName)?.draw(in: imgRect)
        }
        
        if let movingImage = movingImage {
            movingImage.draw(in: imageRect(center: CGPoint(x: movingPieceX, y: movingPieceY), normalSize: CGSize(width: cellSide, height: cellSide), ratio: movingPieceRatio))
            #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1).setStroke()
            let circle = UIBezierPath(arcCenter: CGPoint(x: movingPieceX, y: movingPieceY), radius: 1.5 * cellSide, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
            circle.lineWidth = 3
            circle.stroke()
        }
    }
    
    private func imageRect(normalRect: CGRect, ratio: CGFloat) -> CGRect {
        let center = CGPoint(x: normalRect.midX, y: normalRect.midY)
        let normalSize = CGSize(width: normalRect.width, height: normalRect.height)
        return imageRect(center: center, normalSize: normalSize, ratio: ratio)
    }
    
    private func imageRect(center: CGPoint, normalSize: CGSize, ratio: CGFloat) -> CGRect {
        let w = ratio * normalSize.width
        let h = ratio * normalSize.height
        return CGRect(x: center.x - w/2, y: center.y - h/2, width: w, height: h)
    }
    
    private func p2p(_ coordinate: Int) -> Int { // p2p: peer 2 peer
        return blackAtTop ? coordinate : 7 - coordinate
    }
    
    private func image(named name: String) -> UIImage? {
        if let stored = imageByName[name] {
            return stored
        }
        
        let img = UIImage(named: name)
//        if sharingDevice || UIDevice.current.userInterfaceIdiom == .phone {
//            img = flatPieceImage(pieceName: name, blackFlipped: sharingDevice)
//        } else {
//            img = UIImage(named: name)
//
//        }
        imageByName[name] = img
        return img
    }

    private func path(in rect: CGRect) -> UIBezierPath {
        let path = UIBezierPath()
        let origX = originX
        let origY = originY
        let cellWidth = cellSide
        let cellHeight = cellSide

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
//            return movingPieceLocation!
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
