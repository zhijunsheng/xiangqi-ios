//
//  BoardView.swift
//  xiangqi
//
//  Created by Grace Huang on 9/29/19.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {
    
    var originX:CGFloat = 25
    var originY:CGFloat = 25
    var cellSide:CGFloat = 258/8
    var percent:CGFloat = 0.8
    
    override func draw(_ rect: CGRect) {
        drawGrid()
//        drawPieces()
    }
    
    func drawPiece(col:Int, row:Int, imageName:String) {
        let pieceImage = UIImage(named: imageName)
        pieceImage?.draw(in: CGRect(x: cellSide * (CGFloat(col) - 0.5) + originX, y: cellSide * (CGFloat(row) - 0.5) + originY, width: cellSide, height: cellSide))
    }
 
    func drawGrid() {
        cellSide = (bounds.width * percent)/8
        originX = bounds.width * (1 - percent) / 2
        originY = bounds.height * (1 - percent) / 2
        
        let pen = UIBezierPath()
        // horizantal
        for i in 0..<9 {
            pen.move(to: CGPoint(x: cellSide * CGFloat(i) + originX, y: originY))
            pen.addLine(to: CGPoint(x: cellSide * CGFloat(i) + originX, y: cellSide * 4 + originY))

            pen.move(to: CGPoint(x: cellSide * CGFloat(i) + originX, y: cellSide * 5 + originY))
            pen.addLine(to: CGPoint(x: cellSide * CGFloat(i) + originX, y: cellSide * 9 + originY))
        }
       
        for i in 0..<10 {
            pen.move(to: CGPoint(x: originX, y: cellSide * CGFloat(i) + originY))
            pen.addLine(to: CGPoint(x: cellSide * 8 + originX, y: cellSide * CGFloat(i) + originY))
        }
        
        for i in 0..<2 {
            pen.move(to: CGPoint(x: cellSide * 3 + originX, y: originY + cellSide * CGFloat(i * 7)))
            pen.addLine(to: CGPoint(x: cellSide * 5 + originX, y: originY + cellSide * CGFloat(i * 7 + 2)))
            
            pen.move(to: CGPoint(x: cellSide * 5 + originX, y: originY + cellSide * CGFloat(i * 7)))
            pen.addLine(to: CGPoint(x: cellSide * 3 + originX, y: originY + cellSide * CGFloat(i * 7 + 2)))
        }
        
        star(x: 1, y: 2, half: false, isLeft: false)
        star(x: 7, y: 2, half: false, isLeft: false)
        star(x: 1, y: 7, half: false, isLeft: false)
        star(x: 7, y: 7, half: false, isLeft: false)
        pen.stroke()
    }
    
    func drawPieces() {
        drawPiece(col: 4, row: 0, imageName: "rb")
        drawPiece(col: 4, row: 9, imageName: "bb")

        for i in 0..<2 {
            drawPiece(col: 3 + (i * 2), row: 0, imageName: "rs")
            drawPiece(col: 3 + (i * 2), row: 9, imageName: "bs")
            drawPiece(col: 2 + (i * 4), row: 0, imageName: "rx")
            drawPiece(col: 2 + (i * 4), row: 9, imageName: "bx")
            drawPiece(col: 1 + (i * 6), row: 0, imageName: "rm")
            drawPiece(col: 1 + (i * 6), row: 9, imageName: "bm")
            drawPiece(col: i * 8, row: 0, imageName: "rj")
            drawPiece(col: i * 8, row: 9, imageName: "bj")
            drawPiece(col: 1 + (i * 6), row: 2, imageName: "rp")
            drawPiece(col: 1 + (i * 6), row: 7, imageName: "bp")
        }
        
        for i in 0..<5 {
            drawPiece(col: i * 2, row: 3, imageName: "rz")
            drawPiece(col: i * 2, row: 6, imageName: "bz")
        }
    }
    
    func star(x: CGFloat, y: CGFloat, half: Bool, isLeft: Bool) {
        let pen = UIBezierPath()
        let gap = cellSide / 6
        let length = cellSide / 3
        if half && isLeft  {
            pen.move(to: CGPoint(x: cellSide * x + originX + gap, y: cellSide * y + originY - length))
            pen.addLine(to: CGPoint(x: cellSide * x + originX + gap, y: cellSide * y + originY - gap))
            pen.addLine(to: CGPoint(x: cellSide * x + originX + length, y: cellSide * y + originY - gap))
            
            pen.move(to: CGPoint(x: cellSide * x + originX + gap, y: cellSide * y + originY + length))
            pen.addLine(to: CGPoint(x: cellSide * x + originX + gap, y: cellSide * y + originY + gap))
            pen.addLine(to: CGPoint(x: cellSide * x + originX + length, y: cellSide * y + originY + gap))
        } else if half && !isLeft {
            
        }
        
        pen.move(to: CGPoint(x: cellSide * x + originX + gap, y: cellSide * y + originY - length))
        pen.addLine(to: CGPoint(x: cellSide * x + originX + gap, y: cellSide * y + originY - gap))
        pen.addLine(to: CGPoint(x: cellSide * x + originX + length, y: cellSide * y + originY - gap))
        
        pen.move(to: CGPoint(x: cellSide * x + originX + gap, y: cellSide * y + originY + length))
        pen.addLine(to: CGPoint(x: cellSide * x + originX + gap, y: cellSide * y + originY + gap))
        pen.addLine(to: CGPoint(x: cellSide * x + originX + length, y: cellSide * y + originY + gap))
        
        pen.move(to: CGPoint(x: cellSide * x + originX - gap, y: cellSide * y + originY - length))
        pen.addLine(to: CGPoint(x: cellSide * x + originX - gap, y: cellSide * y + originY - gap))
        pen.addLine(to: CGPoint(x: cellSide * x + originX - length, y: cellSide * y + originY - gap))
        
        pen.move(to: CGPoint(x: cellSide * x + originX - gap, y: cellSide * y + originY + length))
        pen.addLine(to: CGPoint(x: cellSide * x + originX - gap, y: cellSide * y + originY + gap))
        pen.addLine(to: CGPoint(x: cellSide * x + originX - length, y: cellSide * y + originY + gap))
        
        pen.stroke()
    }
    
    
    
}
