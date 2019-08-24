//
//  BoardView.swift
//  xiangqi
//
//  Created by Peter Shi on 2018-11-30.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {
    
    var board = Board()
//    var viewController = ViewController()
    var viewController: XiangqiDelegate? = nil
    var originX: CGFloat = 0.0
    var originY: CGFloat = 0.0
    var side: CGFloat = 40.0
    var space: CGFloat = 4.0
    var line: CGFloat = 12.0
    var thing: CGPoint? = nil
    var isRedTurn: Bool = true
    var keyPieceValueImageView: [Piece: UIImageView] = [:]
    var boardViewX: CGFloat = 0.0
    var boardViewY: CGFloat = 0.0
    var pieces: Set<Piece> = Set<Piece>()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        thing = touch.location(in: self)
        boardViewX = frame.origin.x
        boardViewY = frame.origin.y
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let loc = touch.location(in: self)
        guard let realThing = thing else {
            return
        }
        
        let startX = Int((realThing.x - originX) / side)
        let startY = Int((realThing.y - originY) / side)
        let endX = Int((loc.x - originX) / side)
        let endY = Int((loc.y - originY) / side)
        
        viewController?.move(startX: startX, startY: startY, endX: endX, endY: endY)
        
//        let potentialTarget: Piece? = board.pieceAt(col: endX, row: endY)
//
//        guard let actualActivePiece = board.pieceAt(col: Int(realThing.x), row: Int(realThing.y)) else {
//            return
//        }
//
//        if actualActivePiece.isRed == self.viewController.isRedTurn && board.canMoveTo(piece: actualActivePiece, destCol: endX, destRow: endY) {
//            print("access granted")
//            board.movePiece(startCol: actualActivePiece.col, startRow: actualActivePiece.row, destCol: endX, destRow: endY)
//        }
//
//        if let pieceImageView = self.viewController.keyPieceValueImageView[actualActivePiece] {
//            let pointAtColRow = CGPoint(x: boardViewX + originX + CGFloat(endX) * side, y: boardViewY + originY + CGFloat(endY) * side)
//            self.viewController.isRedTurn = !isRedTurn
//            pieceImageView.center = pointAtColRow
//            let newKey = Piece(col: startX, row: startY, imageName: actualActivePiece.imageName, rank: actualActivePiece.rank, isRed: actualActivePiece.isRed)
//            self.viewController.keyPieceValueImageView[newKey] = pieceImageView
//
//            if let potentialTarget = potentialTarget, let viewToRemove = self.viewController.keyPieceValueImageView[potentialTarget] {
//                viewToRemove.removeFromSuperview()
//
//                self.viewController.keyPieceValueImageView.removeValue(forKey: potentialTarget)
//
//                if potentialTarget.rank == "b" {
//                    let alert = UIAlertController(title: "GAME OVER!!!", message: "Would you like to restart?", preferredStyle: .alert)
//                    let yesAction = UIAlertAction(title: "Yes", style: .default, handler: { (action) in
//
//                        let pieceImages = self.viewController.keyPieceValueImageView.values
//                        for img in pieceImages {
//                            img.removeFromSuperview()
//                        }
//                        self.viewController.keyPieceValueImageView.removeAll()
//                        self.viewController.board.pieces.removeAll()
//                        self.viewController.isRedTurn = true
//                    })
//                    alert.addAction(yesAction)
//                    alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
//
//                    viewController.present(alert, animated: true)
//                }
//            }
//            setNeedsDisplay()
//        }
//        viewController.activePiece = nil
    }
    
    override func draw(_ rect: CGRect) {
        
        side = bounds.width / 9
        space = side / 10
        line = side / 3.75
        originX = (bounds.width - side * 8) / 2
        originY = (bounds.height - side * 9) / 2
        
        let pen = UIBezierPath()
        // horizontal
        for i in 0..<Board.rows {
            pen.move(to: CGPoint(x: originX, y: originY + side * CGFloat(i)))
            pen.addLine(to: CGPoint(x: originX + side * CGFloat(Board.cols - 1), y: originY + side * CGFloat(i)))
        }
        
        // vertical
        for i in 0..<Board.cols {
            if i == 0 || i == 8 {
                pen.move(to: CGPoint(x: originX + side * CGFloat(i), y: originY))
                pen.addLine(to: CGPoint(x: originX + side * CGFloat(i), y: originY + side * CGFloat(Board.cols)))
            }
            pen.move(to: CGPoint(x: originX + side * CGFloat(i), y: originY))
            pen.addLine(to: CGPoint(x: originX + side * CGFloat(i), y: originY + side * 4))
            
            pen.move(to: CGPoint(x: originX + side * CGFloat(i), y: originY + side * 5))
            pen.addLine(to: CGPoint(x: originX + side * CGFloat(i), y: originY + side * 9))
        }

//       ////\\\\
//      /////\\\\\
//     //////\\\\\\
//      ||||  ||||
//      |||| o||||
        
        // diagonal
        pen.move(to: CGPoint(x: originX + side * 3, y: originY + side * 0))
        pen.addLine(to: CGPoint(x: originX + side * 5, y: originY + side * 2))
        
        pen.move(to: CGPoint(x: originX + side * 5, y: originY + side * 0))
        pen.addLine(to: CGPoint(x: originX + side * 3, y: originY + side * 2))
        
        pen.move(to: CGPoint(x: originX + side * 3, y: originY + side * 7))
        pen.addLine(to: CGPoint(x: originX + side * 5, y: originY + side * 9))
        
        pen.move(to: CGPoint(x: originX + side * 5, y: originY + side * 7))
        pen.addLine(to: CGPoint(x: originX + side * 3, y: originY + side * 9))
        
        UIColor.black.setStroke()
        pen.lineWidth = 2
        
        pen.stroke()
        
        for i in 0..<8 {
            if i % 2 == 0 {
                drawStar(row: 3, col: i, drawingUtensil: pen)
                drawStar(row: 6, col: i, drawingUtensil: pen)
            }
        }
        
        for i in 2..<9 {
            if i % 2 == 0 {
                drawStar(row: 3, col: i, drawingUtensil: pen)
                drawStar(row: 6, col: i, drawingUtensil: pen)
            }
        }
        
        
        //💣
        for i in 0...9 {
            if i == 1 || i == 7 {
                drawStar(row: 2, col: i, drawingUtensil: pen)
            }
        }
        

        for i in 0...9 {
            if i == 1 || i == 7 {
                drawStar(row: 7, col: i, drawingUtensil: pen)
            }
        }
        
        UIColor.black.setStroke()
        pen.lineWidth = 1.25
        
        pen.stroke()
        
        for piece in pieces {
            let pieceImg = UIImage(named: piece.imageName)
            pieceImg?.draw(in: CGRect(x: CGFloat(piece.col) * side + originX - side / 2, y: CGFloat(piece.row) * side + originY - side / 2, width: side, height: side))
        }
    }
    
    func drawStar(row: Int, col: Int, drawingUtensil: UIBezierPath) {
        if col == 0 {
            leftRight(row: row, col: col, drawingUtensil: drawingUtensil, isLeft: false)
        } else if col == 8 {
            leftRight(row: row, col: col, drawingUtensil: drawingUtensil, isLeft: true)
        } else {
            leftRight(row: row, col: col, drawingUtensil: drawingUtensil, isLeft: true)
            leftRight(row: row, col: col, drawingUtensil: drawingUtensil, isLeft: false)
        }
    }
    
    func leftRight(row: Int, col: Int, drawingUtensil: UIBezierPath, isLeft: Bool) {
        var sign: CGFloat = 1
        if isLeft {
            sign = -1
        }
        drawingUtensil.move(to: CGPoint(x: originX + side * CGFloat(col) + sign * space, y: (originY - line) + side *  CGFloat(row)))
        drawingUtensil.addLine(to: CGPoint(x: originX + side * CGFloat(col) + sign * space, y: (originY - space) + side *  CGFloat(row)))
        drawingUtensil.addLine(to: CGPoint(x: originX + side * CGFloat(col) + sign * line, y: (originY - space) + side *  CGFloat(row)))
        
        drawingUtensil.move(to: CGPoint(x: originX + side * CGFloat(col) + sign * space, y: (originY + line) + side *  CGFloat(row)))
        drawingUtensil.addLine(to: CGPoint(x: originX + side * CGFloat(col) + sign * space, y: (originY + space) + side *  CGFloat(row)))
        drawingUtensil.addLine(to: CGPoint(x: originX + side * CGFloat(col) + sign * line, y: (originY + space) + side *  CGFloat(row)))
    }
}
