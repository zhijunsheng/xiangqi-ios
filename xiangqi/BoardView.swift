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
    let cellSide: CGFloat = 100
    
    override func draw(_ rect: CGRect) {
    
        let pencil = UIBezierPath()
        
        //      Horizantal Lines 1
        
        pencil.move(to: CGPoint(x: originX, y: originY))
        pencil.addLine(to: CGPoint(x: 500, y: originY))

        pencil.move(to: CGPoint(x: originX, y: originY + cellSide))
        pencil.addLine(to: CGPoint(x: 500, y: originY + cellSide))
        
        pencil.move(to: CGPoint (x: originX, y: originY + cellSide * 2))
        pencil.addLine(to: CGPoint (x: 500, y: originY + cellSide * 2))
        
        pencil.move(to: CGPoint (x: originX, y: originY + cellSide * 3))
        pencil.addLine(to: CGPoint (x: 500, y: originY + cellSide * 3))
        
        pencil.move(to: CGPoint (x: originX, y: originY + cellSide * 4))
        pencil.addLine(to: CGPoint (x: 500, y: originY + cellSide * 4))
        
        pencil.move(to: CGPoint (x: originX, y: originY + cellSide * 5))
        pencil.addLine(to: CGPoint (x: 500, y: originY + cellSide * 5))
        
        pencil.move(to: CGPoint (x: originX, y: originY + cellSide * 6))
        pencil.addLine(to: CGPoint (x: 500, y: originY + cellSide * 6))
        
        pencil.move(to: CGPoint (x: originX, y: originY + cellSide * 7))
        pencil.addLine(to: CGPoint (x: 500, y: originY + cellSide * 7))
        
        pencil.move(to: CGPoint (x: originX, y: originY + cellSide * 8))
        pencil.addLine(to: CGPoint (x: 500, y: originY + cellSide * 8))
        
        pencil.move(to: CGPoint (x: originX, y: originY + cellSide * 9))
        pencil.addLine(to: CGPoint (x: 500, y: originY + cellSide * 9))
        
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
        
        pencil.move(to: CGPoint (x: 500, y: originY))
        pencil.addLine(to: CGPoint (x: 500, y: originY + cellSide * 9))
        
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
        
        //Lower Cross Lines
        
        pencil.move(to: CGPoint (x: originX + cellSide * 3, y: originY + cellSide * 7))
        pencil.addLine(to: CGPoint (x: originX + cellSide * 5, y: originY + cellSide * 9))
        
        pencil.move(to: CGPoint (x: originX + cellSide * 5,  y: originY + cellSide * 7))
        pencil.addLine(to: CGPoint (x: originX + cellSide * 3, y: originY + cellSide * 9))
        
        pencil.stroke()
        
        let redRookImage = UIImage(named: "rj")
        redRookImage?.draw(in: CGRect(x: originX - cellSide / 2, y: originY - cellSide / 2, width: cellSide, height: cellSide))
//        redRookImage?.draw(in: CGRect(x: originX - cellSide / 2 + cellSide, y: originY - cellSide / 2 + cellSide, width: cellSide, height: cellSide))
        
        let pieceImage = UIImage(named: "bp")
        pieceImage?.draw(in: CGRect(x: originX - cellSide / 2 + cellSide, y:  originY - cellSide / 2 + cellSide * 2 , width: cellSide, height: cellSide))
        
        let redHorseImage = UIImage(named: "rm")
        redHorseImage?.draw(in: CGRect(x: originX - cellSide / 2 + cellSide , y:  originY - cellSide / 2 , width: cellSide, height: cellSide))

        let redElephantImage = UIImage(named: "rx")
        redElephantImage?.draw(in: CGRect(x: originX - cellSide / 2 + cellSide * 2, y:  originY - cellSide / 2 , width: cellSide, height: cellSide))

        let redSoldierImage = UIImage(named: "rs")
        redSoldierImage?.draw(in: CGRect(x: originX - cellSide / 2 + cellSide * 3, y:  originY - cellSide / 2 + cellSide , width: cellSide, height: cellSide))
        
        
        
        
    }
    
    
    
    
 

}
