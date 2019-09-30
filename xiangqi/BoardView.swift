//
//  BoardView.swift
//  xiangqi
//
//  Created by Grace Huang on 9/29/19.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {
    
    let originX:CGFloat = 25
    let originY:CGFloat = 25
    let boardWidth:CGFloat = 258
   
    override func draw(_ rect: CGRect) {
        let pen = UIBezierPath()
        pen.move(to: CGPoint(x: originX, y: originY))
        pen.addLine(to: CGPoint(x: boardWidth + originX, y: originY))
        pen.addLine(to: CGPoint(x: boardWidth + originX, y: 300))
        pen.addLine(to: CGPoint(x: originX, y: 300))
        pen.close()
        
        for i in 0..<7 {
            pen.move(to: CGPoint(x: boardWidth/8.0 * (CGFloat(i) + 1) + originX, y: originY))
            pen.addLine(to: CGPoint(x: boardWidth/8.0 * (CGFloat(i) + 1) + originX, y: 300))
         

        }
        
        pen.stroke()
    }
 
}
