//
//  BoardView.swift
//  xiangqi
//
//  Created by Angie Yan on 2019-09-28.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {
    var originX: CGFloat = 120
    var originY: CGFloat = 100
    let cellSide: CGFloat = 70
    
    
    override func draw(_ rect: CGRect) {
        
        originX = (bounds.width - 8 * cellSide) / 2
        originY = (bounds.height - 9 * cellSide) / 2
        
        let pencil = UIBezierPath()
        
        // Horizontal Lines
        
        pencil.move(to: CGPoint(x: originX, y: originY))
        pencil.addLine(to: CGPoint(x: originX + 8 * cellSide, y: originY))
        
        pencil.move(to: CGPoint(x: originX, y: originY + cellSide))
        pencil.addLine(to: CGPoint(x: originX + 8 * cellSide, y: originY + cellSide))
        
        pencil.move(to: CGPoint(x: originX, y: originY + 2 * cellSide))
        pencil.addLine(to: CGPoint(x: originX + 8 * cellSide, y: originY + 2 * cellSide))
        
        pencil.move(to: CGPoint(x: originX, y: originY + 3 * cellSide))
        pencil.addLine(to: CGPoint(x: originX + 8 * cellSide, y: originY + 3 * cellSide))
        
        pencil.move(to: CGPoint(x: originX, y: originY + 4 * cellSide))
        pencil.addLine(to: CGPoint(x: originX + 8 * cellSide, y: originY + 4 * cellSide))
        
        
        
        pencil.move(to: CGPoint(x: originX, y: originY + 5 * cellSide))
        pencil.addLine(to: CGPoint(x: originX + 8 * cellSide, y: originY + 5 * cellSide))
        
        pencil.move(to: CGPoint(x: originX, y: originY + 6 * cellSide))
        pencil.addLine(to: CGPoint(x: originX + 8 * cellSide, y: originY + 6 * cellSide))
        
        pencil.move(to: CGPoint(x: originX, y: originY + 7 * cellSide))
        pencil.addLine(to: CGPoint(x: originX + 8 * cellSide, y: originY + 7 * cellSide))
        
        pencil.move(to: CGPoint(x: originX, y: originY + 8 * cellSide))
        pencil.addLine(to: CGPoint(x: originX + 8 * cellSide, y: originY + 8 * cellSide))
        
        pencil.move(to: CGPoint(x: originX, y: originY + 9 * cellSide))
        pencil.addLine(to: CGPoint(x: originX + 8 * cellSide, y: originY + 9 * cellSide))
 
        // Vertical Lines - Upper half
        
        pencil.move(to: CGPoint(x: originX, y: originY))
        pencil.addLine(to: CGPoint(x: originX, y: originY + 9 * cellSide))
        
        pencil.move(to: CGPoint(x: originX + cellSide, y: originY))
        pencil.addLine(to: CGPoint(x: originX + cellSide, y: originY + 4 * cellSide))
        
        pencil.move(to: CGPoint(x: originX + 2 * cellSide, y: originY))
        pencil.addLine(to: CGPoint(x: originX + 2 * cellSide, y: originY + 4 * cellSide))
        
        pencil.move(to: CGPoint(x: originX + 3 * cellSide, y: originY))
        pencil.addLine(to: CGPoint(x: originX + 3 * cellSide, y: originY + 4 * cellSide))
        
        pencil.move(to: CGPoint(x: originX + 4 * cellSide, y: originY))
        pencil.addLine(to: CGPoint(x: originX + 4 * cellSide, y: originY + 4 * cellSide))
        
        pencil.move(to: CGPoint(x: originX + 5 * cellSide, y: originY))
        pencil.addLine(to: CGPoint(x: originX + 5 * cellSide, y: originY + 4 * cellSide))
        
        pencil.move(to: CGPoint(x: originX + 6 * cellSide, y: originY))
        pencil.addLine(to: CGPoint(x: originX + 6 * cellSide, y: originY + 4 * cellSide))
        
        pencil.move(to: CGPoint(x: originX + 7 * cellSide, y: originY))
        pencil.addLine(to: CGPoint(x: originX + 7 * cellSide, y: originY + 4 * cellSide))
        
        pencil.move(to: CGPoint(x: originX + 8 * cellSide, y: originY))
        pencil.addLine(to: CGPoint(x: originX + 8 * cellSide, y: originY + 9 * cellSide))
        
        // Lower half
        
        pencil.move(to: CGPoint(x: originX + cellSide, y: originY + 5 * cellSide))
        pencil.addLine(to: CGPoint(x: originX + cellSide, y: originY + 9 * cellSide))
        
        pencil.move(to: CGPoint(x: originX + 2 * cellSide, y: originY + 5 * cellSide))
        pencil.addLine(to: CGPoint(x: originX + 2 * cellSide, y: originY + 9 * cellSide))
        
        pencil.move(to: CGPoint(x: originX + 3 * cellSide, y: originY + 5 * cellSide))
        pencil.addLine(to: CGPoint(x: originX + 3 * cellSide, y: originY + 9 * cellSide))
        
        pencil.move(to: CGPoint(x: originX + 4 * cellSide, y: originY + 5 * cellSide))
        pencil.addLine(to: CGPoint(x: originX + 4 * cellSide, y: originY + 9 * cellSide))
        
        pencil.move(to: CGPoint(x: originX + 5 * cellSide, y: originY + 5 * cellSide))
        pencil.addLine(to: CGPoint(x: originX + 5 * cellSide, y: originY + 9 * cellSide))
        
        pencil.move(to: CGPoint(x: originX + 6 * cellSide, y: originY + 5 * cellSide))
        pencil.addLine(to: CGPoint(x: originX + 6 * cellSide, y: originY + 9 * cellSide))
        
        pencil.move(to: CGPoint(x: originX + 7 * cellSide, y: originY + 5 * cellSide))
        pencil.addLine(to: CGPoint(x: originX + 7 * cellSide, y: originY + 9 * cellSide))

        pencil.move(to: CGPoint(x: originX + 8 * cellSide, y: originY + 5 * cellSide))
        pencil.addLine(to: CGPoint(x: originX + 8 * cellSide, y: originY + 9 * cellSide))
        
        // Upper half X's
        
        pencil.move(to: CGPoint(x: originX + 3 * cellSide, y: originY))
        pencil.addLine(to: CGPoint(x: originX + 5 * cellSide, y: originY + 2 * cellSide))
        
        pencil.move(to: CGPoint(x: originX + 5 * cellSide, y: originY))
        pencil.addLine(to: CGPoint(x: originX + 3 * cellSide, y: originY + 2 * cellSide))
        
        // Lower half X's
        
        pencil.move(to: CGPoint(x: originX + 3 * cellSide, y: originY + 7 * cellSide))
        pencil.addLine(to: CGPoint(x: originX + 5 * cellSide, y: originY + 9 * cellSide))
        
        pencil.move(to: CGPoint(x: originX + 5 * cellSide, y: originY + 7 * cellSide))
        pencil.addLine(to: CGPoint(x: originX + 3 * cellSide, y: originY + 9 * cellSide))
       
       

        #colorLiteral(red: 0.3304081526, green: 0, blue: 1, alpha: 1).setStroke()
        
        pencil.stroke()

    }
}
