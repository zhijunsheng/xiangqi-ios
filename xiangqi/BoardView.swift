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
    let rows: Int = 10
 
    let originX: CGFloat = 20
    let originY: CGFloat = 20
    let cellSide: CGFloat = 37
   
    override func draw(_ rect: CGRect) {
  
        let pencil = UIBezierPath()
        for i in 0..<10 {
            pencil.move(to: CGPoint(x: originX, y: originY + cellSide * CGFloat(i)))
            pencil.addLine(to: CGPoint(x: originX + (CGFloat(cols) - 1) * cellSide, y: originY + cellSide * CGFloat(i)))

            pencil.move(to: CGPoint(x: originX + cellSide * CGFloat(i - 1), y: originY ))
            pencil.addLine(to: CGPoint(x:  originX + cellSide * CGFloat(i - 1), y: originY + CGFloat(rows - 6) * cellSide))

            pencil.move(to: CGPoint(x: originX + cellSide * CGFloat(i - 1), y: originY + cellSide * 5))
            pencil.addLine(to: CGPoint(x:  originX + cellSide * CGFloat(i - 1), y: originY + CGFloat(rows - 1) * cellSide))
        }
        
        pencil.move(to: CGPoint(x: originX, y: originY + cellSide * 4))
        pencil.addLine(to: CGPoint(x:  originX, y: originY + cellSide * 5))

        pencil.move(to: CGPoint(x: originX + cellSide * 8, y: originY + cellSide * 4))
        pencil.addLine(to: CGPoint(x:  originX + cellSide * 8, y: originY + cellSide * 5))

        /*
         
         i => 3 * i
         0 => 0
         1 => 3
         2 => 6
 
         i => 7 * i
         0 => 0
         1 => 7
         
         i => 2 + 7 * i
         0 => 2
         1 => 9
         2 => 16
         3 => 23
         
        */

//        pencil.move(to: CGPoint(x: originX + cellSide * 3, y: originY + cellSide * 7))
//        pencil.addLine(to: CGPoint(x:  originX + cellSide * 5, y: originY + cellSide * 9))

        for i in 0..<2  {

            pencil.move(to: CGPoint(x: originX + CGFloat(rows - 5) * cellSide, y: originY + CGFloat(i) * 7 * cellSide))
            pencil.addLine(to: CGPoint(x:  originX + CGFloat(rows - 7) * cellSide, y: originY +  CGFloat(i) * 7 * cellSide + 2 * cellSide))
            pencil.move(to: CGPoint(x: originX + CGFloat(rows - 7) * cellSide, y: originY + CGFloat(i) * 7 * cellSide ))
            pencil.addLine(to: CGPoint(x:  originX + CGFloat(rows - 5) * cellSide , y: originY + CGFloat(i) * 7 * cellSide + 2 * cellSide))


        }
        
        pencil.stroke()
        
        let image = UIImage(named: "bz")
        image?.draw(in: CGRect(x: 150, y: 3, width: 40, height: 40))
//
        let imkfld = UIImage(named: "rp")
        imkfld?.draw(in: CGRect(x: 150, y: 90, width: 40, height: 40))

        let jfkd = UIImage(named: "bb")
        jfkd?.draw(in: CGRect(x: 150, y: 120, width: 40, height: 40))
        
        let dfk = UIImage(named: "rb")
        dfk?.draw(in: CGRect(x: 150, y: 190, width: 40, height: 40))
        
        let efk = UIImage(named: "bm")
        efk?.draw(in: CGRect(x: 150, y: 210, width: 40, height: 40))
        
        let erk = UIImage(named: "rj")
        erk?.draw(in: CGRect(x: 150, y: 330, width: 40, height: 40))

       
    }
}

/*
 
 ABCDE * 4 = EDCBA
 
 A = 2
 E = 8
 B = 1
 
   33
 21978
*    4
-------
 87912
 
 
 */
