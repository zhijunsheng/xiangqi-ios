//
//  BoardView.swift
//  xiangqi
//
//  Created by Peter Shi on 2018-11-30.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {
    
    let originX: CGFloat = 7.0
    let originY: CGFloat = 7.0
    let side: CGFloat = 40.0
    let space: CGFloat = 4.0
    let line: CGFloat = 12.0
    
    override func draw(_ rect: CGRect) {
        
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
//      |  |  |  |
//      |  | o|  |
        
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
