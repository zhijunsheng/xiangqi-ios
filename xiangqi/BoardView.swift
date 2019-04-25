//
//  BoardView.swift
//  xiangqi
//
//  Created by 刀剑神域 SAO project on 2019-04-22.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {
    
    let cols: Int = 9
    let rows: Int = 10
    
    let originX: CGFloat = 30
    let originY: CGFloat = 30
    
    let cellHeight: CGFloat = 25
    let cellWidth: CGFloat = 25
    
    override func draw(_ rect: CGRect) {
        drawGrid()

    }
    
    func drawGrid() {
        
        let path = UIBezierPath()
    
        // Horozontal lines

        for i in 0..<rows {
            path.move(to: CGPoint(x: originX, y: originY + cellHeight * CGFloat(i)))
            path.addLine(to: CGPoint(x: originX + CGFloat(cols - 1) * cellWidth, y: originY + cellHeight * CGFloat(i)))
        }
        
        // Vertical lines
        
        for i in 0..<cols {
            path.move(to: CGPoint(x: originX + cellWidth * CGFloat(i), y: originY))
            path.addLine(to: CGPoint(x: originX + cellWidth * CGFloat(i), y: originY + cellHeight * 4))

            path.move(to: CGPoint(x: originX + cellWidth * CGFloat(i), y: originY + cellHeight * 5))
            path.addLine(to: CGPoint(x: originX + cellWidth * CGFloat(i), y: originY + cellHeight * CGFloat(rows - 1)))
        }

        for i in 0..<2 {
            path.move(to: CGPoint(x: originX + cellWidth * (CGFloat(i) * 8), y: originY + cellHeight * 4))
            path.addLine(to: CGPoint(x: originX + cellWidth * (CGFloat(i) * 8), y: originY + cellHeight * 5))
        }
        
        // (3,0) - (5,2)
        path.move(to: CGPoint(x: originX + cellWidth * 3, y: originY))
        path.addLine(to: CGPoint(x: originX + cellWidth * 5, y: originY + cellHeight * 2))
        
        
        
        path.stroke()
        
    }
    
    //Board
    //Pieces of two players
    //Function and movement of every piece
    //How to check
}
