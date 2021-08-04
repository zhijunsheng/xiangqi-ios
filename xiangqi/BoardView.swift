//
//  BoardView.swift
//  xiangqi
//
//  Created by jichengye on 2021/7/28.
//  Copyright © 2021 GoldThumb Inc. All rights reserved.


import UIKit

class BoardView: UIView {

    var cellH: CGFloat = 48
    var gridX: CGFloat = 172
    var gridY: CGFloat = 210
    
    override func draw(_ rect: CGRect) {
        
        print(bounds.width)
        print(bounds.height)
        
        gridX = (728 - 48 * 8) / 2
        gridY = (852 - 48 * 9) / 2
        
        let line = UIBezierPath()
        
        for i in 0 ..< 9 {
            line.move(to: CGPoint(x: gridX + cellH * CGFloat(i), y: gridY))
            line.addLine(to: CGPoint(x: gridX + cellH * CGFloat(i), y: gridY + cellH * 4))
            
            line.move(to: CGPoint(x: gridX + cellH * CGFloat(i), y: gridY + cellH * 5))
            line.addLine(to: CGPoint(x: gridX + cellH * CGFloat(i), y: gridY + cellH * 9))
        }
        
        for i in 0 ..< 5 {
            line.move(to: CGPoint(x: gridX, y: gridY + CGFloat(i) * cellH))
            line.addLine(to: CGPoint(x: gridX + cellH * 8, y: gridY + CGFloat(i) * cellH))
            
            line.move(to: CGPoint(x: gridX, y: gridY + cellH * 5 + CGFloat(i) * cellH))
            line.addLine(to: CGPoint(x: gridX + cellH * 8, y: gridY + cellH * 5 + CGFloat(i) * cellH))
        }
        
        for i in 0 ..< 2 {
            line.move(to: CGPoint(x: gridX + cellH * 3, y: gridY + cellH * CGFloat(i * 7)))
            line.addLine(to: CGPoint(x: gridX + cellH * 5, y: gridY + cellH * CGFloat(i * 7 + 2)))
            
            line.move(to: CGPoint(x: gridX + cellH * 5, y: gridY + cellH * CGFloat(i * 7)))
            line.addLine(to: CGPoint(x: gridX + cellH * 3, y: gridY + cellH * CGFloat(i * 7 + 2)))
        }
        
        line.stroke()
    }
}
