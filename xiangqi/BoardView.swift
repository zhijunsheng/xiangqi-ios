//
//  BoardView.swift
//  xiangqi
//
//  Created by 吴淑雅 on 2021-07-27.
//  Copyright © 2021 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {

    let cS: CGFloat = 80 - 11
    
    override func draw(_ rect: CGRect) {
        
        let hL1 = UIBezierPath()
        for i in 0..<10 {
            hL1.move(to: CGPoint(x: 55, y: 75 + CGFloat(i) * cS))
            hL1.addLine(to: CGPoint(x: 55 + 8 * cS, y: 75 + CGFloat(i) * cS))
        }
        #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1).setStroke()
        hL1.stroke()
        
        let vL = UIBezierPath()
        // Upper vertical lines are done
        for i in 0..<9 {
            vL.move(to: CGPoint(x: 55 + CGFloat(i) * cS, y: 75))
            vL.addLine(to: CGPoint(x: 55 + CGFloat(i) * cS, y: 75 + 4 * cS))
        }
        // Lower vertical lines are not done
        for i in 0..<1 {
            vL.move(to: CGPoint(x: 55 + CGFloat(i) * cS, y: 475))
            vL.addLine(to: CGPoint(x: 55 + CGFloat(i) * cS, y: 795))
        }
        #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1).setStroke()
        vL.stroke()
    }
    

}
