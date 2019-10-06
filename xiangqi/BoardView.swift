//
//  BoardView.swift
//  xiangqi
//
//  Created by Andy Yan on 2019-09-30.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {
    
    let originX: CGFloat = 100
    let originY: CGFloat = 50
    let cellSide: CGFloat = 62.5
    
    
    override func draw(_ rect: CGRect) {
        
        let pencil = UIBezierPath()
        
        //      Horizantal Lines 1
        
        pencil.move(to: CGPoint (x: originX, y: originY))
        pencil.addLine(to: CGPoint (x: 600, y: originY))

        pencil.move(to: CGPoint (x: originX, y: originY + cellSide))
        pencil.addLine(to: CGPoint (x: 600, y: originY + cellSide))
        
        pencil.move(to: CGPoint (x: originX, y: originY + cellSide * 2))
        pencil.addLine(to: CGPoint (x: 600, y: originY + cellSide * 2))
        
        pencil.move(to: CGPoint (x: originX, y: originY + cellSide * 3))
        pencil.addLine(to: CGPoint (x: 600, y: originY + cellSide * 3))
        
        pencil.move(to: CGPoint (x: originX, y: originY + cellSide * 4))
        pencil.addLine(to: CGPoint (x: 600, y: originY + cellSide * 4))
        
        pencil.move(to: CGPoint (x: originX, y: originY + cellSide * 5))
        pencil.addLine(to: CGPoint (x: 600, y: originY + cellSide * 5))
        
        pencil.move(to: CGPoint (x: originX, y: originY + cellSide * 6))
        pencil.addLine(to: CGPoint (x: 600, y: originY + cellSide * 6))
        
        pencil.move(to: CGPoint (x: originX, y: originY + cellSide * 7))
        pencil.addLine(to: CGPoint (x: 600, y: originY + cellSide * 7))
        
        pencil.move(to: CGPoint (x: originX, y: originY + cellSide * 8))
        pencil.addLine(to: CGPoint (x: 600, y: originY + cellSide * 8))
        
        pencil.move(to: CGPoint (x: originX, y: originY + cellSide * 9))
        pencil.addLine(to: CGPoint (x: 600, y: originY + cellSide * 9))
        
        //  Upper Vertical Lines
        
        pencil.move(to: CGPoint (x: originX, y: originY))
        pencil.addLine(to: CGPoint (x: originX, y: originY + cellSide * 9))
        
        pencil.move(to: CGPoint (x: originX + cellSide, y: originY))
        pencil.addLine(to: CGPoint (x: originX + cellSide, y: originY + cellSide * 4))

        pencil.move(to: CGPoint (x: originX + cellSide * 2, y: originY))
        pencil.addLine(to: CGPoint (x: originX + cellSide * 2, y: originY + cellSide * 4))

        pencil.move(to: CGPoint (x: originX + cellSide * 3, y: originY))
        pencil.addLine(to: CGPoint (x: originX + cellSide * 3, y: originY + cellSide * 4))
        
        pencil.move(to: CGPoint (x: originX + cellSide * 4, y: originY))
        pencil.addLine(to: CGPoint (x: originX + cellSide * 4, y: originY + cellSide * 4))
        
        pencil.move(to: CGPoint (x: originX + cellSide * 5, y: originY))
        pencil.addLine(to: CGPoint (x: originX + cellSide * 5, y: originY + cellSide * 4))
        
        pencil.move(to: CGPoint (x: originX + cellSide * 6, y: originY))
        pencil.addLine(to: CGPoint (x: originX + cellSide * 6, y: originY + cellSide * 4))
        
        pencil.move(to: CGPoint (x: originX + cellSide * 7, y: originY))
        pencil.addLine(to: CGPoint (x: originX + cellSide * 7, y: originY + cellSide * 4))
        
        pencil.move(to: CGPoint (x: 600, y: originY))
        pencil.addLine(to: CGPoint (x: 600, y: originY + cellSide * 9))
        
        // Lower Vertical Lines
        
        pencil.move(to: CGPoint (x: originX + cellSide , y: originY + cellSide * 5))
        pencil.addLine(to: CGPoint (x: originX + cellSide, y: originY + cellSide * 9))
        
        pencil.move(to: CGPoint (x: originX + cellSide * 2 , y: originY + cellSide * 5))
        pencil.addLine(to: CGPoint (x: originX + cellSide * 2, y: originY + cellSide * 9))
        
        pencil.move(to: CGPoint (x: originX + cellSide * 3 , y: originY + cellSide * 5))
        pencil.addLine(to: CGPoint (x: originX + cellSide * 3, y: originY + cellSide * 9))
        
        pencil.move(to: CGPoint (x: originX + cellSide * 4 , y: originY + cellSide * 5))
        pencil.addLine(to: CGPoint (x: originX + cellSide * 4, y: originY + cellSide * 9))
        
        pencil.move(to: CGPoint (x: originX + cellSide * 5 , y: originY + cellSide * 5))
        pencil.addLine(to: CGPoint (x: originX + cellSide * 5, y: originY + cellSide * 9))
        
        pencil.move(to: CGPoint (x: originX + cellSide * 6 , y: originY + cellSide * 5))
        pencil.addLine(to: CGPoint (x: originX + cellSide * 6, y: originY + cellSide * 9))
        
        pencil.move(to: CGPoint (x: originX + cellSide * 7, y: originY + cellSide * 5))
        pencil.addLine(to: CGPoint (x: originX + cellSide * 7, y: originY + cellSide * 9))
        
        //Upper Cross Line
        
        pencil.move(to: CGPoint (x: originX + cellSide * 3, y: originY))
        pencil.addLine(to: CGPoint (x: originX + cellSide * 5, y: originY + cellSide * 2))
        
        pencil.move(to: CGPoint (x: originX + cellSide * 5, y: originY))
        pencil.addLine(to: CGPoint (x: originX + cellSide * 3, y: originY + cellSide * 2))
        
        pencil.move(to: CGPoint (x: originX + cellSide * 3, y: originY + cellSide * 7))
        pencil.addLine(to: CGPoint (x: originX + cellSide * 5, y: originY + cellSide * 9))
        
        pencil.move(to: CGPoint (x: originX + cellSide * 5,  y: originY + cellSide * 7))
        pencil.addLine(to: CGPoint (x: originX + cellSide * 3, y: originY + cellSide * 9))
        
        pencil.stroke()
        
        
        
    }
    
    
    
    
 

}
