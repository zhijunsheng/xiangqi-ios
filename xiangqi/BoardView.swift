//
//  BoardView.swift
//  xiangqi
//
//  Created by Peter Shi on 2018-11-30.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {
    
    let originX: CGFloat = 6.0
    let originY: CGFloat = 6.0
    let side: CGFloat = 30.0
    
    override func draw(_ rect: CGRect) {
        
        let pen = UIBezierPath()
        // horizontal
        for i in 0..<10 {
            pen.move(to: CGPoint(x: originX, y: originY + side * CGFloat(i)))
            pen.addLine(to: CGPoint(x: originX + side * 8, y: originY + side * CGFloat(i)))
        }
        
        // vertical
        for i in 0..<9 {
            pen.move(to: CGPoint(x: originX + side * CGFloat(i), y: originY))
            pen.addLine(to: CGPoint(x: originX + side * CGFloat(i), y: originY + side * 4))
        }
        
        for i in 0..<9 {
            pen.move(to: CGPoint(x: originX + side * CGFloat(i), y: originY + side * 5))
            pen.addLine(to: CGPoint(x: originX + side * CGFloat(i), y: originY + side * 9))
        }
        UIColor.black.setStroke()
        pen.lineWidth = 2
        
        pen.stroke()
    }
}
