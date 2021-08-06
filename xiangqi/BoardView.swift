//
//  BoardView.swift
//  xiangqi
//
//  Created by 吴淑雅 on 2021-07-27.
//  Copyright © 2021 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {
    
    let gridX: CGFloat = 90
    let gridY: CGFloat = 115
    let cellSide: CGFloat = 69 
    
    override func draw(_ rect: CGRect) {
        
        let hL1 = UIBezierPath()
        for i in 0..<10 {
            hL1.move(to: CGPoint(x: gridX, y: gridY + CGFloat(i) * cellSide))
            hL1.addLine(to: CGPoint(x: gridX + 8 * cellSide, y: gridY + CGFloat(i) * cellSide))
        }
        #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1).setStroke()
        hL1.stroke()
        
        let vL = UIBezierPath()
        // Upper vertical lines are done
        for i in 0..<9 {
            vL.move(to: CGPoint(x: gridX + CGFloat(i) * cellSide, y: gridY))
            vL.addLine(to: CGPoint(x: gridX + CGFloat(i) * cellSide, y: gridY + 4 * cellSide))
        }
        // Lower vertical lines are not done
        for i in 0..<9 {
            vL.move(to: CGPoint(x: gridX + CGFloat(i) * cellSide, y: gridY + cellSide * 5))
            vL.addLine(to: CGPoint(x: gridX + CGFloat(i) * cellSide, y: gridY + cellSide * 9))
        }
        #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1).setStroke()
        vL.stroke()
    }
    

}
