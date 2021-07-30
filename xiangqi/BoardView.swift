//
//  BoardView.swift
//  xiangqi
//
//  Created by 吴淑雅 on 2021-07-27.
//  Copyright © 2021 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {

    override func draw(_ rect: CGRect) {
        
        let hL1 = UIBezierPath()
        for i in 0..<10 {
            hL1.move(to: CGPoint(x: 55, y: 75 + i * 80))
            hL1.addLine(to: CGPoint(x: 675, y: 75 + i * 80))
        }
        #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1).setStroke()
        hL1.stroke()
        
        let vL = UIBezierPath()
        for i in 0..<9 {
            vL.move(to: CGPoint(x: 55 + CGFloat(i) * 77.5, y: 75))
            vL.addLine(to: CGPoint(x: 55 + CGFloat(i) * 77.5, y: 395))
        }
        for i in 0..<9 {
            vL.move(to: CGPoint(x: 55 + CGFloat(i) * 77.5, y: 475))
            vL.addLine(to: CGPoint(x: 55 + CGFloat(i) * 77.5, y: 795))
        }
        #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1).setStroke()
        vL.stroke()
    }
    

}
