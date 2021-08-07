//
//  BoardView.swift
//  xiangqi
//
//  Created by jichengye on 2021/7/28.
//  Copyright © 2021 GoldThumb Inc. All rights reserved.


import UIKit

class BoardView: UIView {

    var cellH: CGFloat = 36
    var gridX: CGFloat = 172
    var gridY: CGFloat = 210
    
    override func draw(_ rect: CGRect) {
   
//        let img = UIImage(named: "abc")
//        img?.draw(at: CGPoint(x: 1, y: 1))
//        img?.draw(in: CGRect(x: 15, y: 170, width: 300, height: 200))
      
        
        let bb = UIImage(named: "bb")
        bb?.draw(in: CGRect(x: 15, y: 170, width: 200, height: 200))
        
        print(bounds.width)
        print(bounds.height)
        
        cellH = (bounds.width / 9 + bounds.height / 10) / 2
        gridX = (bounds.width - cellH * 8) / 2
        gridY = (bounds.height - cellH * 9) / 2
        
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
