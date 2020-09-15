//
//  BoardView.swift
//  xiangqi
//
//  Created by Corey Gao on 2020-09-07.
//  Copyright © 2020 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {
    let originX: CGFloat = 30 + 60
    let originY: CGFloat = 35 + 20
    let cellWidth: CGFloat = 60 + 7
    let cellHeight: CGFloat = 50 + 13
    
    override func draw(_ rect: CGRect) {
        let pencil = UIBezierPath()
        
        for i in 0..<10 {
            pencil.move(to: CGPoint(x: originX , y: CGFloat(i) * cellHeight + originY))
            pencil.addLine(to: CGPoint(x: 8 * cellWidth + originX, y: CGFloat(i) * cellHeight + originY))
        }
        
        pencil.move(to: CGPoint(x: originX, y: originY))
        pencil.addLine(to: CGPoint(x: originX, y:  5 * cellHeight + originY))
    
        // vertical
        
        for i in 0..<9 {
            pencil.move(to: CGPoint(x: CGFloat(i) * cellWidth + originX , y: originY))
            pencil.addLine(to: CGPoint(x: CGFloat(i) * cellWidth + originX, y: 4 * cellHeight + originY))
        }
        
        for i in 0..<9 {
            pencil.move(to: CGPoint(x: CGFloat(i) * cellWidth + originX , y: 5 * cellHeight + originY))
            pencil.addLine(to: CGPoint(x: CGFloat(i) * cellWidth + originX, y: 9 * cellHeight + originY))
        }
        
        for i in 0..<2 {
            pencil.move(to: CGPoint(x: 8 * CGFloat(i) * cellWidth + originX, y: 4 * cellHeight + originY))
            pencil.addLine(to: CGPoint(x: 8 * CGFloat(i) * cellWidth + originX, y: 5 * cellHeight + originY))
        }
        
        pencil.move(to: CGPoint(x: 3 * cellWidth + originX, y: originY))
        pencil.addLine(to: CGPoint(x: 5 * cellWidth + originX, y: originY + cellHeight * 2))
        
        pencil.move(to: CGPoint(x: 5 * cellWidth + originX, y: originY ))
        pencil.addLine(to: CGPoint(x: 3 * cellWidth + originX, y: originY + cellHeight * 2))
        
        
        
        pencil.move(to: CGPoint(x: 3 * cellWidth + originX, y: originY + cellHeight * 7))
        pencil.addLine(to: CGPoint(x: 5 * cellWidth + originX, y: originY + cellHeight * 9))
        
        
        pencil.move(to: CGPoint(x: 5 * cellWidth + originX, y: originY + cellHeight * 7))
        pencil.addLine(to: CGPoint(x: 3 * cellWidth + originX, y: originY + cellHeight * 9))
        
        
        
        pencil.stroke()
      
    }


}

