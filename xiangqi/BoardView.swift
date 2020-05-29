
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
        
        drawStar(x: 77 + 50, y: 91  + 100)
        drawStar(x: 77 + 350, y: 91 + 100)
        drawStar(x: 77 + 100, y: 91 + 150)
        drawStar(x: 77 + 200, y: 91 + 150)
        drawStar(x: 77 + 300, y: 91 + 150)
        drawStar(x: 77 + 50, y: 91 + 350)
        drawStar(x: 77 + 350, y: 91 + 350)
        drawStar(x: 77 + 100, y: 91 + 300)
        drawStar(x: 77 + 200, y: 91 + 300)
        drawStar(x: 77 + 300, y: 91 + 300)
        drawHalfStarRight(x: 400 + 77, y: 91 + 300)
        drawHalfStarLeft(x: 77, y: 91 + 300)
        drawHalfStarRight(x: 400 + 77, y: 91 + 150)
        drawHalfStarLeft(x: 77, y: 91 + 150)
    }
    
    
    
    
    func drawHalfStarLeft(x: CGFloat, y: CGFloat) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: x + 20, y: y + 5))
        path.addLine(to: CGPoint(x: x + 5, y: y + 5))
        path.addLine(to: CGPoint(x: x + 5, y: y + 20))
        path.move(to: CGPoint(x: x + 20, y: y - 5))
        path.addLine(to: CGPoint(x: x + 5, y: y - 5))
        path.addLine(to: CGPoint(x: x + 5, y: y - 20))
        
            path.stroke()
    }
    
    func drawHalfStarRight(x: CGFloat, y: CGFloat) {
    let path = UIBezierPath()
        
        path.move(to: CGPoint(x: x - 20, y: y + 5))
        path.addLine(to: CGPoint(x: x - 5, y: y + 5))
        path.addLine(to: CGPoint(x: x - 5, y: y + 20))
        path.move(to: CGPoint(x: x - 20, y: y - 5))
        path.addLine(to: CGPoint(x: x - 5, y: y - 5))
        path.addLine(to: CGPoint(x: x - 5, y: y - 20))
        
            path.stroke()
    }
    
        
    func drawStar(x: CGFloat, y: CGFloat){
        drawHalfStarRight(x: x, y: y)
        drawHalfStarLeft(x: x, y: y)
    }
    
    
}
