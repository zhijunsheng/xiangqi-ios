
//  BoardView.swift
//  xiangqi
//
//  Created by Felix Lo on 2020-05-22.
//  Copyright © 2020 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {

    let size: CGFloat = 75
    let anchorY: CGFloat = 142
    let anchorX: CGFloat = 70
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        
        for i in 0 ..< 9 {
            path.move(to: CGPoint(x: CGFloat(i) * size + anchorX, y: anchorY))
            path.addLine(to: CGPoint(x: CGFloat(i) * size + anchorX, y: size * 4 + anchorY))
        }
        
        for i in 0 ..< 9 {
            path.move(to: CGPoint(x: CGFloat(i) * size + anchorX, y: anchorY + size * 5))
            path.addLine(to: CGPoint(x: CGFloat(i) * size + anchorX, y: size * 9 + anchorY))
        }

        for i in 0 ..< 10 {
            path.move(to: CGPoint(x: anchorX, y: CGFloat(i) * size + anchorY))
            path.addLine(to: CGPoint(x: size * 8 + anchorX, y: CGFloat(i) * size + anchorY))
        }
        path.move(to: CGPoint(x: anchorX, y: anchorY + size * 4))
        path.addLine(to: CGPoint(x: anchorX, y: size * 5 + anchorY))
        path.move(to: CGPoint(x: anchorX + size * 8, y: anchorY + size * 4))
        path.addLine(to: CGPoint(x: anchorX + size * 8, y: size * 5 + anchorY))
        path.move(to: CGPoint(x: anchorX + size * 3, y: anchorY))
        path.addLine(to: CGPoint(x: anchorX + size * 5, y: anchorY + size * 2))
        path.move(to: CGPoint(x: anchorX + size * 5, y: anchorY))
        path.addLine(to: CGPoint(x: anchorX + size * 3, y: size * 2 + anchorY))
        path.move(to: CGPoint(x: anchorX + size * 3, y: anchorY + size * 9))
        path.addLine(to: CGPoint(x: anchorX + size * 5, y: size * 7 + anchorY))
        path.move(to: CGPoint(x: anchorX + size * 5, y: anchorY + size * 9))
        path.addLine(to: CGPoint(x: anchorX + size * 3, y: size * 7 + anchorY))
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        path.stroke()
        
        for i in 0 ..< 2{
            drawStar(col: 1 + 6 * i, row: 2)
            drawStar(col: 1 + 6 * i, row: 7)
            drawHalfStarRight(col: 8, row: 3 + 3 * i)
            drawHalfStarLeft(col: 0, row: 3 + 3 * i)
        }
        
        for i in 0 ..< 3{
            drawStar(col: 2 + 2 * i, row: 3)
            drawStar(col: 2 + 2 * i, row: 6)
        }
        
        
    }
    
    func drawHalfStarLeft(col: Int, row: Int) {
        let x: CGFloat = anchorX + size * CGFloat(col)
        let y: CGFloat = anchorY + size * CGFloat(row)
        
        let starRatio: CGFloat = 3
        let starPoint: CGFloat = 15
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: x + size/starRatio, y: y + size/starPoint))
        path.addLine(to: CGPoint(x: x + size/starPoint, y: y + size/starPoint))
        path.addLine(to: CGPoint(x: x + size/starPoint, y: y + size/starRatio))
        path.move(to: CGPoint(x: x + size/starRatio, y: y - size/starPoint))
        path.addLine(to: CGPoint(x: x + size/starPoint, y: y - size/starPoint))
        path.addLine(to: CGPoint(x: x + size/starPoint, y: y - size/starRatio))
        path.stroke()
    }
    
    func drawHalfStarRight(col: Int, row: Int) {
        let x: CGFloat = anchorX + size * CGFloat(col)
        let y: CGFloat = anchorY + size * CGFloat(row)
        let path = UIBezierPath()
        let starRatio: CGFloat = 3
        let starPoint: CGFloat = 15
        path.move(to: CGPoint(x: x - size/starRatio, y: y + size/starPoint))
        path.addLine(to: CGPoint(x: x - size/starPoint, y: y + size/starPoint))
        path.addLine(to: CGPoint(x: x - size/starPoint, y: y + size/starRatio))
        path.move(to: CGPoint(x: x - size/starRatio, y: y - size/starPoint))
        path.addLine(to: CGPoint(x: x - size/starPoint, y: y - size/starPoint))
        path.addLine(to: CGPoint(x: x - size/starPoint, y: y - size/starRatio))
        path.stroke()
    }
    
        
    func drawStar(col: Int, row: Int) {
        drawHalfStarLeft(col: col, row: row)
        drawHalfStarRight(col: col, row: row)
    }
    
    
}
