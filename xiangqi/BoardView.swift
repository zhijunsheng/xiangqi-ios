//
//  BoardView.swift
//  xiangqi
//
//  Created by Lambert Lin on 2019/9/21.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {
    
    let cols: Int = 9
    let rows: Int = 5
 
    let originX: CGFloat = 20
    let originY: CGFloat = 20
    let cellSide: CGFloat = 37
   
    override func draw(_ rect: CGRect) {
        let pencil = UIBezierPath()
        for i in 0..<10 {
            pencil.move(to: CGPoint(x: originX, y: originY + cellSide * CGFloat(i)))
            pencil.addLine(to: CGPoint(x: originX + (CGFloat(cols) - 1) * cellSide, y: originY + cellSide * CGFloat(i)))
            
            pencil.move(to: CGPoint(x: originX + cellSide * (CGFloat(i)-2), y: originY ))
            pencil.addLine(to: CGPoint(x:  originX + cellSide * (CGFloat(i)-2) , y: originY + (CGFloat(rows)-1) * cellSide))
            
            pencil.move(to: CGPoint(x: originX + cellSide * (CGFloat(i)-2), y: originY + cellSide * 5))
            pencil.addLine(to: CGPoint(x:  originX + cellSide * (CGFloat(i)-2), y: originY + (CGFloat(rows)+4) * cellSide))
        }

        pencil.move(to: CGPoint(x: originX, y: originY ))
        pencil.addLine(to: CGPoint(x:  originX  , y: originY + (CGFloat(rows) - 1) * cellSide))
        
        pencil.move(to: CGPoint(x: originX + cellSide * 8, y: originY ))
        pencil.addLine(to: CGPoint(x:  originX + cellSide * 8 , y: originY + (CGFloat(rows) + 4) * cellSide))
        
        pencil.move(to: CGPoint(x: originX, y: originY ))
        pencil.addLine(to: CGPoint(x:  originX  , y: originY + (CGFloat(rows) + 4) * cellSide))
        
        pencil.move(to: CGPoint(x: originX + cellSide * 3, y:originY))
        pencil.addLine(to: CGPoint(x: originX + cellSide * 5, y: originY + cellSide * 2))
        
        pencil.move(to: CGPoint(x: originX + cellSide * 5, y: originY))
        pencil.addLine(to: CGPoint(x: originX + cellSide * 3, y: originY + cellSide * 2))
        
        pencil.move(to: CGPoint(x:originX + cellSide * 3 , y: originY + cellSide * 7))
        pencil.addLine(to: CGPoint(x:originX + cellSide * 5 , y: originY + cellSide * 9))
        
        pencil.move(to: CGPoint(x: originX + cellSide * 5, y:originY + cellSide * 7))
        pencil.addLine(to: CGPoint(x: originX + cellSide * 3, y: originY + cellSide * 9))
       
        pencil.stroke()
    }
}
