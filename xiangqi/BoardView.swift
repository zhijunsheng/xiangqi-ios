
//  BoardView.swift
//  xiangqi
//
//  Created by Felix Lo on 2020-05-22.
//  Copyright © 2020 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {

    let size: CGFloat = 75
    let anchorY: CGFloat = 50
    let anchorX: CGFloat = 50
    
    var shadowPieces: Set<CChessPiece> = Set<CChessPiece>()
    
    override func draw(_ rect: CGRect) {
        drawGrid()
        drawPieces()
//        drawChessPieceB()
//        drawChessPieceR()
    }
    
    func drawPieces() {
        for piece in shadowPieces {
            let pieceImage = UIImage(named: piece.imageName)
            pieceImage?.draw(in: CGRect(x: CGFloat(piece.col) * size + anchorX - size/2, y: CGFloat(piece.row) * size + anchorY - size/2, width: size, height: size))
        }
    }
    
    func drawChessPieceB() {
        let pieceImage = UIImage(named: "bb")
        pieceImage?.draw(in: CGRect(x: size * 4.2, y: size/4.2, width: size, height: size))
        
        let pieceImage2 = UIImage(named: "bs")
        pieceImage2?.draw(in: CGRect(x: size * 5.2, y: size/4.2, width: size, height: size))
        
        let pieceImage3 = UIImage(named: "bs")
        pieceImage3?.draw(in: CGRect(x: size * 3.2, y: size/4.2, width: size, height: size))
        
        let pieceImage4 = UIImage(named: "bx")
        pieceImage4?.draw(in: CGRect(x: size * 2.2, y: size/4.2, width: size, height: size))
        
        let pieceImage5 = UIImage(named: "bx")
        pieceImage5?.draw(in: CGRect(x: size * 6.2, y: size/4.2, width: size, height: size))
        
        let pieceImage6 = UIImage(named: "bm")
        pieceImage6?.draw(in: CGRect(x: size * 7.2, y: size/4.2, width: size, height: size))
        
        let pieceImage7 = UIImage(named: "bm")
        pieceImage7?.draw(in: CGRect(x: size * 1.2, y: size/4.2, width: size, height: size))
        
        let pieceImage8 = UIImage(named: "bj")
        pieceImage8?.draw(in: CGRect(x: size * 0.2, y: size/4.2, width: size, height: size))
        
        let pieceImage9 = UIImage(named: "bj")
        pieceImage9?.draw(in: CGRect(x: size * 8.2, y: size/4.2, width: size, height: size))
        
        let pieceImage10 = UIImage(named: "bz")
        pieceImage10?.draw(in: CGRect(x: size * 0.2, y: size * 3.2, width: size, height: size))
        
        let pieceImage11 = UIImage(named: "bz")
        pieceImage11?.draw(in: CGRect(x: size * 2.2, y: size * 3.2, width: size, height: size))
        
        let pieceImage12 = UIImage(named: "bz")
        pieceImage12?.draw(in: CGRect(x: size * 4.2, y: size * 3.2, width: size, height: size))
        
        let pieceImage13 = UIImage(named: "bz")
        pieceImage13?.draw(in: CGRect(x: size * 6.2, y: size * 3.2, width: size, height: size))
        
        let pieceImage14 = UIImage(named: "bz")
        pieceImage14?.draw(in: CGRect(x: size * 8.2, y: size * 3.2, width: size, height: size))
        
        let pieceImage15 = UIImage(named: "bp")
        pieceImage15?.draw(in: CGRect(x: size * 1.2, y: size * 2.2, width: size, height: size))
        
        let pieceImage16 = UIImage(named: "bp")
        pieceImage16?.draw(in: CGRect(x: size * 7.2, y: size * 2.2, width: size, height: size))
    }
    
    func drawChessPieceR() {
        let pieceImage = UIImage(named: "rb")
        pieceImage?.draw(in: CGRect(x: size * 4.2, y: size * 9.2, width: size, height: size))
        
        let pieceImage2 = UIImage(named: "rs")
        pieceImage2?.draw(in: CGRect(x: size * 5.2, y: size * 9.2, width: size, height: size))
        
        let pieceImage3 = UIImage(named: "rs")
        pieceImage3?.draw(in: CGRect(x: size * 3.2, y: size * 9.2, width: size, height: size))
        
        let pieceImage4 = UIImage(named: "rx")
        pieceImage4?.draw(in: CGRect(x: size * 2.2, y: size * 9.2, width: size, height: size))
        
        let pieceImage5 = UIImage(named: "rx")
        pieceImage5?.draw(in: CGRect(x: size * 6.2, y: size * 9.2, width: size, height: size))
        
        let pieceImage6 = UIImage(named: "rm")
        pieceImage6?.draw(in: CGRect(x: size * 7.2, y: size * 9.2, width: size, height: size))
        
        let pieceImage7 = UIImage(named: "rm")
        pieceImage7?.draw(in: CGRect(x: size * 1.2, y: size * 9.2, width: size, height: size))
        
        let pieceImage8 = UIImage(named: "rj")
        pieceImage8?.draw(in: CGRect(x: size * 0.2, y: size * 9.2, width: size, height: size))
        
        let pieceImage9 = UIImage(named: "rj")
        pieceImage9?.draw(in: CGRect(x: size * 8.2, y: size * 9.2, width: size, height: size))
        
        let pieceImage10 = UIImage(named: "rz")
        pieceImage10?.draw(in: CGRect(x: size * 0.2, y: size * 6.2, width: size, height: size))
        
        let pieceImage11 = UIImage(named: "rz")
        pieceImage11?.draw(in: CGRect(x: size * 2.2, y: size * 6.2, width: size, height: size))
        
        let pieceImage12 = UIImage(named: "rz")
        pieceImage12?.draw(in: CGRect(x: size * 4.2, y: size * 6.2, width: size, height: size))
        
        let pieceImage13 = UIImage(named: "rz")
        pieceImage13?.draw(in: CGRect(x: size * 6.2, y: size * 6.2, width: size, height: size))
        
        let pieceImage14 = UIImage(named: "rz")
        pieceImage14?.draw(in: CGRect(x: size * 8.2, y: size * 6.2, width: size, height: size))
        
        let pieceImage15 = UIImage(named: "rp")
        pieceImage15?.draw(in: CGRect(x: size * 1.2, y: size * 7.2, width: size, height: size))
        
        let pieceImage16 = UIImage(named: "rp")
        pieceImage16?.draw(in: CGRect(x: size * 7.2, y: size * 7.2, width: size, height: size))
    }
    
    
    func drawGrid() {
        let path = UIBezierPath()
        for i in 0 ..< 9 {
            path.move(to: CGPoint(x: CGFloat(i) * size + anchorX, y: anchorY))
            path.addLine(to: CGPoint(x: CGFloat(i) * size + anchorX, y: size * 4 + anchorY))
        }
        
        for i in 0 ..< 9 {
            path.move(to: CGPoint(x: CGFloat(i) * size + anchorX, y: anchorY + size * 5))
            path.addLine(to: CGPoint(x: CGFloat(i) * size + anchorX, y: size * 9 + anchorY))
        }
        
        for i in 0 ..< 10 {
            path.move(to: CGPoint(x: anchorX, y: CGFloat(i) * size + anchorY))
            path.addLine(to: CGPoint(x: size * 8 + anchorX, y: CGFloat(i) * size + anchorY))
        }
        path.move(to: CGPoint(x: anchorX, y: anchorY + size * 4))
        path.addLine(to: CGPoint(x: anchorX, y: size * 5 + anchorY))
        path.move(to: CGPoint(x: anchorX + size * 8, y: anchorY + size * 4))
        path.addLine(to: CGPoint(x: anchorX + size * 8, y: size * 5 + anchorY))
        path.move(to: CGPoint(x: anchorX + size * 3, y: anchorY))
        path.addLine(to: CGPoint(x: anchorX + size * 5, y: anchorY + size * 2))
        path.move(to: CGPoint(x: anchorX + size * 5, y: anchorY))
        path.addLine(to: CGPoint(x: anchorX + size * 3, y: size * 2 + anchorY))
        path.move(to: CGPoint(x: anchorX + size * 3, y: anchorY + size * 9))
        path.addLine(to: CGPoint(x: anchorX + size * 5, y: size * 7 + anchorY))
        path.move(to: CGPoint(x: anchorX + size * 5, y: anchorY + size * 9))
        path.addLine(to: CGPoint(x: anchorX + size * 3, y: size * 7 + anchorY))
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        path.stroke()
        
        for i in 0 ..< 2{
            drawStar(col: 1 + 6 * i, row: 2)
            drawStar(col: 1 + 6 * i, row: 7)
            drawHalfStarRight(col: 8, row: 3 + 3 * i)
            drawHalfStarLeft(col: 0, row: 3 + 3 * i)
        }
        
        for i in 0 ..< 3{
            drawStar(col: 2 + 2 * i, row: 3)
            drawStar(col: 2 + 2 * i, row: 6)
        }
    }
    
    func drawHalfStarLeft(col: Int, row: Int) {
        let x: CGFloat = anchorX + size * CGFloat(col)
        let y: CGFloat = anchorY + size * CGFloat(row)
        
        let starRatio: CGFloat = 3
        let starPoint: CGFloat = 15
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: x + size/starRatio, y: y + size/starPoint))
        path.addLine(to: CGPoint(x: x + size/starPoint, y: y + size/starPoint))
        path.addLine(to: CGPoint(x: x + size/starPoint, y: y + size/starRatio))
        path.move(to: CGPoint(x: x + size/starRatio, y: y - size/starPoint))
        path.addLine(to: CGPoint(x: x + size/starPoint, y: y - size/starPoint))
        path.addLine(to: CGPoint(x: x + size/starPoint, y: y - size/starRatio))
        path.stroke()
    }
    
    func drawHalfStarRight(col: Int, row: Int) {
        let x: CGFloat = anchorX + size * CGFloat(col)
        let y: CGFloat = anchorY + size * CGFloat(row)
        let path = UIBezierPath()
        let starRatio: CGFloat = 3
        let starPoint: CGFloat = 15
        path.move(to: CGPoint(x: x - size/starRatio, y: y + size/starPoint))
        path.addLine(to: CGPoint(x: x - size/starPoint, y: y + size/starPoint))
        path.addLine(to: CGPoint(x: x - size/starPoint, y: y + size/starRatio))
        path.move(to: CGPoint(x: x - size/starRatio, y: y - size/starPoint))
        path.addLine(to: CGPoint(x: x - size/starPoint, y: y - size/starPoint))
        path.addLine(to: CGPoint(x: x - size/starPoint, y: y - size/starRatio))
        path.stroke()
    }
    
    func drawStar(col: Int, row: Int) {
        drawHalfStarLeft(col: col, row: row)
        drawHalfStarRight(col: col, row: row)
    }
}
