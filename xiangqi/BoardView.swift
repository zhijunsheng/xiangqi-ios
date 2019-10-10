//
//  BoardView.swift
//  xiangqi
//
//  Created by Grace Huang on 9/29/19.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {
    
    let originX:CGFloat = 25
    let originY:CGFloat = 25
    let cellSide:CGFloat = 258/8
    override func draw(_ rect: CGRect) {
      
        let pen = UIBezierPath()
        pen.move(to: CGPoint(x: originX, y: originY))
        pen.addLine(to: CGPoint(x: cellSide * 8 + originX, y: originY))
        pen.addLine(to: CGPoint(x: cellSide * 8 + originX, y: cellSide * 9 + originY))
        pen.addLine(to: CGPoint(x: originX, y: cellSide * 9 + originY))
        pen.close()

        for i in 0..<7 {
            pen.move(to: CGPoint(x: cellSide * CGFloat(i + 1) + originX, y: originY))
            pen.addLine(to: CGPoint(x: cellSide * CGFloat(i + 1) + originX, y: cellSide * 4 + originY))

            pen.move(to: CGPoint(x: cellSide * CGFloat(i + 1) + originX, y: cellSide * 5 + originY))
            pen.addLine(to: CGPoint(x: cellSide * CGFloat(i + 1) + originX, y: cellSide * 9 + originY))

        }
        pen.move(to: CGPoint(x: originX, y: cellSide * 4 + originY))
        pen.addLine(to: CGPoint(x: cellSide * 8 + originX, y: cellSide * 4 + originY))
        pen.move(to: CGPoint(x: originX, y: cellSide * 5 + originY))
        pen.addLine(to: CGPoint(x: cellSide * 8 + originX, y: cellSide * 5 + originY))

        for i in 0..<9 {
            pen.move(to: CGPoint(x: originX, y: cellSide * CGFloat(i) + originY))
            pen.addLine(to: CGPoint(x: cellSide * 8 + originX, y: cellSide * CGFloat(i) + originY))
        }
        
        for i in 0..<2 {
            pen.move(to: CGPoint(x: cellSide * 3 + originX, y: originY + cellSide * CGFloat(i * 7)))
            pen.addLine(to: CGPoint(x: cellSide * 5 + originX, y: originY + cellSide * CGFloat(i * 7 + 2)))
            
            pen.move(to: CGPoint(x: cellSide * 5 + originX, y: originY + cellSide * CGFloat(i * 7)))
            pen.addLine(to: CGPoint(x: cellSide * 3 + originX, y: originY + cellSide * CGFloat(i * 7 + 2)))
        }
        pen.stroke()
        
        drawPiece(col: 4, row: 0, imageName: "rb")
        drawPiece(col: 3, row: 0, imageName: "rs")
        drawPiece(col: 5, row: 0, imageName: "rs")
        drawPiece(col: 2, row: 0, imageName: "rx")
        drawPiece(col: 6, row: 0, imageName: "rx")
        drawPiece(col: 1, row: 0, imageName: "rm")
        drawPiece(col: 7, row: 0, imageName: "rm")
        drawPiece(col: 0, row: 0, imageName: "rj")
        drawPiece(col: 8, row: 0, imageName: "rj")
        drawPiece(col: 1, row: 2, imageName: "rp")
        drawPiece(col: 7, row: 2, imageName: "rp")
        drawPiece(col: 0, row: 3, imageName: "rz")
        drawPiece(col: 2, row: 3, imageName: "rz")
        drawPiece(col: 4, row: 3, imageName: "rz")
        drawPiece(col: 6, row: 3, imageName: "rz")
        drawPiece(col: 8, row: 3, imageName: "rz")
        
        drawPiece(col: 4, row: 9, imageName: "bb")
        drawPiece(col: 3, row: 9, imageName: "bs")
        drawPiece(col: 5, row: 9, imageName: "bs")
        drawPiece(col: 2, row: 9, imageName: "bx")
        drawPiece(col: 6, row: 9, imageName: "bx")
        drawPiece(col: 1, row: 9, imageName: "bm")
        drawPiece(col: 7, row: 9, imageName: "bm")
        drawPiece(col: 0, row: 9, imageName: "bj")
        drawPiece(col: 8, row: 9, imageName: "bj")
        drawPiece(col: 1, row: 7, imageName: "bp")
        drawPiece(col: 7, row: 7, imageName: "bp")
        drawPiece(col: 0, row: 6, imageName: "bz")
        drawPiece(col: 2, row: 6, imageName: "bz")
        drawPiece(col: 4, row: 6, imageName: "bz")
        drawPiece(col: 6, row: 6, imageName: "bz")
        drawPiece(col: 8, row: 6, imageName: "bz")
        
        
    }
    
    func drawPiece(col:Int, row:Int, imageName:String) {
        let pieceImage = UIImage(named: imageName)
        pieceImage?.draw(in: CGRect(x: cellSide * (CGFloat(col) - 0.5) + originX, y: cellSide * CGFloat(row) + originY - 15, width: 35, height: 35))
    }
 
}
