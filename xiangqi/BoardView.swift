//
//  BoardView.swift
//  xiangqi
//
//  Created by Corey Gao on 2020-09-07.
//  Copyright © 2020 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {
    let originX: CGFloat = 90
    let originY: CGFloat = 55
    let cellSide: CGFloat = 67
    
    override func draw(_ rect: CGRect) {
        drawBoard()
        drawPieces()
  
    }
    
    func drawPieces() {
        let bb = UIImage(named: "bb")
        bb?.draw(in: CGRect(x: originX + 3.5 * cellSide , y: originY - cellSide * 0.5 , width: cellSide, height: cellSide))
  
        let bj = UIImage(named: "bj")
        let bm = UIImage(named: "bm")
        let bx = UIImage(named: "bx")
        let bs = UIImage(named: "bs")
        let bp = UIImage(named: "bp")
        for i in 0..<2 {
            bj?.draw(in: CGRect(x: originX + cellSide * CGFloat(i * 8) - cellSide * 0.5, y: originY - cellSide * 0.5, width: cellSide, height: cellSide))
            bm?.draw(in: CGRect(x: originX + cellSide * CGFloat(1 + i * 6) - cellSide * 0.5, y: originY - cellSide * 0.5, width: cellSide, height: cellSide))
            bx?.draw(in: CGRect(x: originX + cellSide * CGFloat(2 + i * 4) - cellSide * 0.5, y: originY - cellSide * 0.5, width: cellSide, height: cellSide))
            bs?.draw(in: CGRect(x: originX + cellSide * CGFloat(3 + i * 2) - cellSide * 0.5, y: originY - cellSide * 0.5, width: cellSide, height: cellSide))
            bp?.draw(in: CGRect(x: originX + cellSide * CGFloat(1 + i * 6) - cellSide * 0.5, y: originY + cellSide * 2 - cellSide * 0.5, width: cellSide, height: cellSide))
        }
        
        bj?.draw(in: CGRect(x: <#T##CGFloat#>, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>))
        bm?.draw(in: CGRect(x: <#T##CGFloat#>, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>))
        
        
        
        
        let bz = UIImage(named: "bz")
        for i in 0..<5 {
            bz?.draw(in: CGRect(x: originX + cellSide * CGFloat(i) * 2 - cellSide * 0.5, y: originY + cellSide * 3 - cellSide * 0.5, width: cellSide, height: cellSide))
        }

    }
   
    func drawBoard()  {
        let pencil = UIBezierPath()
        
        for i in 0..<10 {
            pencil.move(to: CGPoint(x: originX , y: CGFloat(i) * cellSide + originY))
            pencil.addLine(to: CGPoint(x: 8 * cellSide + originX, y: CGFloat(i) * cellSide + originY))
        }
        
        pencil.move(to: CGPoint(x: originX, y: originY))
        pencil.addLine(to: CGPoint(x: originX, y:  5 * cellSide + originY))
        
        // vertical
        
        for i in 0..<9 {
            pencil.move(to: CGPoint(x: CGFloat(i) * cellSide + originX , y: originY))
            pencil.addLine(to: CGPoint(x: CGFloat(i) * cellSide + originX, y: 4 * cellSide + originY))
        }
        
        for i in 0..<9 {
            pencil.move(to: CGPoint(x: CGFloat(i) * cellSide + originX , y: 5 * cellSide + originY))
            pencil.addLine(to: CGPoint(x: CGFloat(i) * cellSide + originX, y: 9 * cellSide + originY))
        }
        
        for i in 0..<2 {
            pencil.move(to: CGPoint(x: 8 * CGFloat(i) * cellSide + originX, y: 4 * cellSide + originY))
            pencil.addLine(to: CGPoint(x: 8 * CGFloat(i) * cellSide + originX, y: 5 * cellSide + originY))
        }
        
        pencil.move(to: CGPoint(x: 3 * cellSide + originX, y: originY))
        pencil.addLine(to: CGPoint(x: 5 * cellSide + originX, y: originY + cellSide * 2))
        
        pencil.move(to: CGPoint(x: 5 * cellSide + originX, y: originY ))
        pencil.addLine(to: CGPoint(x: 3 * cellSide + originX, y: originY + cellSide * 2))
        
        pencil.move(to: CGPoint(x: 3 * cellSide + originX, y: originY + cellSide * 7))
        pencil.addLine(to: CGPoint(x: 5 * cellSide + originX, y: originY + cellSide * 9))
        pencil.move(to: CGPoint(x: 5 * cellSide + originX, y: originY + cellSide * 7))
        pencil.addLine(to: CGPoint(x: 3 * cellSide + originX, y: originY + cellSide * 9))
        
        pencil.stroke()


    }
}

