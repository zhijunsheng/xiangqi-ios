
//  BoardView.swift
//  xiangqi
//
//  Created by Felix Lo on 2020-05-22.
//  Copyright © 2020 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {

    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        
        for i in 0 ..< 9 {
            path.move(to: CGPoint(x: i * 50 + 77, y: 91))
            path.addLine(to: CGPoint(x: i * 50 + 77, y: 200 + 91))
        }
        
        for i in 0 ..< 9 {
            path.move(to: CGPoint(x: i * 50 + 77, y: 91 + 250))
            path.addLine(to: CGPoint(x: i * 50 + 77, y: 450 + 91))
        }

        for i in 0 ..< 10 {
            path.move(to: CGPoint(x: 77, y: i * 50 + 91))
            path.addLine(to: CGPoint(x: 400 + 77, y: i * 50 + 91))
        }
        
        path.move(to: CGPoint(x: 77, y: 91 + 200))
        path.addLine(to: CGPoint(x: 77, y: 250 + 91))
        
        path.move(to: CGPoint(x: 77 + 400, y: 91 + 200))
        path.addLine(to: CGPoint(x: 77 + 400, y: 250 + 91))
        
        path.move(to: CGPoint(x: 77 + 150, y: 91))
        path.addLine(to: CGPoint(x: 77 + 250, y: 91 + 100))
        
        path.move(to: CGPoint(x: 77 + 250, y: 91))
        path.addLine(to: CGPoint(x: 77 + 150, y: 100 + 91))
        
        path.move(to: CGPoint(x: 77 + 150, y: 91 + 450))
        path.addLine(to: CGPoint(x: 77 + 250, y: 350 + 91))
        
        path.move(to: CGPoint(x: 77 + 250, y: 91 + 450))
        path.addLine(to: CGPoint(x: 77 + 150, y: 350 + 91))
        
        
        
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        path.stroke()
        
        drawStar(x: 500, y: 200)
    }
    
    
    
    
    func drawHalfStarRight(x: CGFloat, y: CGFloat) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: x + 25, y: y + 10))
        path.addLine(to: CGPoint(x: x + 10, y: y + 10))
        path.addLine(to: CGPoint(x: x + 10, y: y + 25))
        path.move(to: CGPoint(x: x + 25, y: y - 10))
        path.addLine(to: CGPoint(x: x + 10, y: y - 10))
        path.addLine(to: CGPoint(x: x + 10, y: y - 25))
        
            path.stroke()
    }
    
    func drawHalfStarLeft(x: CGFloat, y: CGFloat) {
    let path = UIBezierPath()
        
        path.move(to: CGPoint(x: x - 25, y: y + 10))
        path.addLine(to: CGPoint(x: x - 10, y: y + 10))
        path.addLine(to: CGPoint(x: x - 10, y: y + 25))
        path.move(to: CGPoint(x: x - 25, y: y - 10))
        path.addLine(to: CGPoint(x: x - 10, y: y - 10))
        path.addLine(to: CGPoint(x: x - 10, y: y - 25))
        
            path.stroke()
    }
    
        
    func drawStar(x: CGFloat, y: CGFloat){
        drawHalfStarRight(x: x, y: y)
        drawHalfStarLeft(x: x, y: y)
    }
    
    
}
