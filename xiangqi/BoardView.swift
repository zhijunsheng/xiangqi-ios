//
//  BoardView.swift
//  xiangqi
//
//  Created by Peter Shi on 2018-11-30.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {
    
    let originX: CGFloat = 6.0
    let originY: CGFloat = 6.0
    let side: CGFloat = 30.0
    
    override func draw(_ rect: CGRect) {
        
        let pen = UIBezierPath()
        // horizontal
        for i in 0..<10 {
            pen.move(to: CGPoint(x: originX, y: originY + side * CGFloat(i)))
            pen.addLine(to: CGPoint(x: originX + side * 8, y: originY + side * CGFloat(i)))
        }
        
        // vertical
        for i in 0..<9 {
            if i == 0 || i == 8 {
                pen.move(to: CGPoint(x: originX + side * CGFloat(i), y: originY))
                pen.addLine(to: CGPoint(x: originX + side * CGFloat(i), y: originY + side * 9))
            }
            pen.move(to: CGPoint(x: originX + side * CGFloat(i), y: originY))
            pen.addLine(to: CGPoint(x: originX + side * CGFloat(i), y: originY + side * 4))
            
            pen.move(to: CGPoint(x: originX + side * CGFloat(i), y: originY + side * 5))
            pen.addLine(to: CGPoint(x: originX + side * CGFloat(i), y: originY + side * 9))
        }

        // diagonal
        pen.move(to: CGPoint(x: originX + side * 3, y: originY + side * 0))
        pen.addLine(to: CGPoint(x: originX + side * 5, y: originY + side * 2))
        
        pen.move(to: CGPoint(x: originX + side * 5, y: originY + side * 0))
        pen.addLine(to: CGPoint(x: originX + side * 3, y: originY + side * 2))
        
        pen.move(to: CGPoint(x: originX + side * 3, y: originY + side * 7))
        pen.addLine(to: CGPoint(x: originX + side * 5, y: originY + side * 9))
        
        pen.move(to: CGPoint(x: originX + side * 5, y: originY + side * 7))
        pen.addLine(to: CGPoint(x: originX + side * 3, y: originY + side * 9))
        
        
        
        for i in 0..<8 {
            if i % 2 == 0 {
                pen.move(to: CGPoint(x: originX + side * CGFloat(i) + 12, y: (originY - 3) + side * 3))
                pen.addLine(to: CGPoint(x: originX + side * CGFloat(i) + 3, y: (originY - 3) + side * 3))
                pen.addLine(to: CGPoint(x: originX + side * CGFloat(i) + 3, y: (originY - 12) + side * 3))
                
                pen.move(to: CGPoint(x: originX + side * CGFloat(i) + 12, y: (originY + 3) + side * 3))
                pen.addLine(to: CGPoint(x: originX + side * CGFloat(i) + 3, y: (originY + 3) + side * 3))
                pen.addLine(to: CGPoint(x: originX + side * CGFloat(i) + 3, y: (originY + 12) + side * 3))
                
                
                pen.move(to: CGPoint(x: originX + side * CGFloat(i) + 12, y: (originY - 3) + side * 6))
                pen.addLine(to: CGPoint(x: originX + side * CGFloat(i) + 3, y: (originY - 3) + side * 6))
                pen.addLine(to: CGPoint(x: originX + side * CGFloat(i) + 3, y: (originY - 12) + side * 6))
                
                pen.move(to: CGPoint(x: originX + side * CGFloat(i) + 12, y: (originY + 3) + side * 6))
                pen.addLine(to: CGPoint(x: originX + side * CGFloat(i) + 3, y: (originY + 3) + side * 6))
                pen.addLine(to: CGPoint(x: originX + side * CGFloat(i) + 3, y: (originY + 12) + side * 6))
            }
        }
        
        for i in 2..<9 {
            if i % 2 == 0 {
                pen.move(to: CGPoint(x: originX + side * CGFloat(i) - 3, y: (originY - 12) + side * 3))
                pen.addLine(to: CGPoint(x: originX + side * CGFloat(i) - 3, y: (originY - 3) + side * 3))
                pen.addLine(to: CGPoint(x: originX + side * CGFloat(i) - 12, y: (originY - 3) + side * 3))
                
                pen.move(to: CGPoint(x: originX + side * CGFloat(i) - 3, y: (originY + 12) + side * 3))
                pen.addLine(to: CGPoint(x: originX + side * CGFloat(i) - 3, y: (originY + 3) + side * 3))
                pen.addLine(to: CGPoint(x: originX + side * CGFloat(i) - 12, y: (originY + 3) + side * 3))
                
                pen.move(to: CGPoint(x: originX + side * CGFloat(i) - 3, y: (originY - 12) + side * 6))
                pen.addLine(to: CGPoint(x: originX + side * CGFloat(i) - 3, y: (originY - 3) + side * 6))
                pen.addLine(to: CGPoint(x: originX + side * CGFloat(i) - 12, y: (originY - 3) + side * 6))
                
                pen.move(to: CGPoint(x: originX + side * CGFloat(i) - 3, y: (originY + 12) + side * 6))
                pen.addLine(to: CGPoint(x: originX + side * CGFloat(i) - 3, y: (originY + 3) + side * 6))
                pen.addLine(to: CGPoint(x: originX + side * CGFloat(i) - 12, y: (originY + 3) + side * 6))
                
            }
        }
        
        
        //💣
        for i in 0...9 {
            if i == 1 || i == 7 {
                pen.move(to: CGPoint(x: originX + side * CGFloat(i) + 12, y: (originY - 3) + side * 2))
                pen.addLine(to: CGPoint(x: originX + side * CGFloat(i) + 3, y: (originY - 3) + side * 2))
                pen.addLine(to: CGPoint(x: originX + side * CGFloat(i) + 3, y: (originY - 12) + side * 2))
                
                pen.move(to: CGPoint(x: originX + side * CGFloat(i) + 12, y: (originY + 3) + side * 2))
                pen.addLine(to: CGPoint(x: originX + side * CGFloat(i) + 3, y: (originY + 3) + side * 2))
                pen.addLine(to: CGPoint(x: originX + side * CGFloat(i) + 3, y: (originY + 12) + side * 2))
                
                pen.move(to: CGPoint(x: originX + side * CGFloat(i) - 3, y: (originY - 12) + side * 2))
                pen.addLine(to: CGPoint(x: originX + side * CGFloat(i) - 3, y: (originY - 3) + side * 2))
                pen.addLine(to: CGPoint(x: originX + side * CGFloat(i) - 12, y: (originY - 3) + side * 2))
                
                pen.move(to: CGPoint(x: originX + side * CGFloat(i) - 3, y: (originY + 12) + side * 2))
                pen.addLine(to: CGPoint(x: originX + side * CGFloat(i) - 3, y: (originY + 3) + side * 2))
                pen.addLine(to: CGPoint(x: originX + side * CGFloat(i) - 12, y: (originY + 3) + side * 2))
            }
        }
        

        for i in 0...9 {
            if i == 1 || i == 7 {
                pen.move(to: CGPoint(x: originX + side * CGFloat(i) + 12, y: (originY - 3) + side * 7))
                pen.addLine(to: CGPoint(x: originX + side * CGFloat(i) + 3, y: (originY - 3) + side * 7))
                pen.addLine(to: CGPoint(x: originX + side * CGFloat(i) + 3, y: (originY - 12) + side * 7))
                
                pen.move(to: CGPoint(x: originX + side * CGFloat(i) + 12, y: (originY + 3) + side * 7))
                pen.addLine(to: CGPoint(x: originX + side * CGFloat(i) + 3, y: (originY + 3) + side * 7))
                pen.addLine(to: CGPoint(x: originX + side * CGFloat(i) + 3, y: (originY + 12) + side * 7))
                
                pen.move(to: CGPoint(x: originX + side * CGFloat(i) - 3, y: (originY - 12) + side * 7))
                pen.addLine(to: CGPoint(x: originX + side * CGFloat(i) - 3, y: (originY - 3) + side * 7))
                pen.addLine(to: CGPoint(x: originX + side * CGFloat(i) - 12, y: (originY - 3) + side * 7))
                
                pen.move(to: CGPoint(x: originX + side * CGFloat(i) - 3, y: (originY + 12) + side * 7))
                pen.addLine(to: CGPoint(x: originX + side * CGFloat(i) - 3, y: (originY + 3) + side * 7))
                pen.addLine(to: CGPoint(x: originX + side * CGFloat(i) - 12, y: (originY + 3) + side * 7))
            }
        }
        
        UIColor.black.setStroke()
        pen.lineWidth = 2
        
        pen.stroke()
    }
}
