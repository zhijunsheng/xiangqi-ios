//
//  BoardView.swift
//  xiangqi
//
//  Created by Sharon Chen on 2018-03-11.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {
     let gap: CGFloat = 35
    let topLeftX: CGFloat = 20.0
    let topLeftY: CGFloat = 20.0
    let row: CGFloat = 0
    let col: CGFloat = 0
    
    override func draw(_ rect: CGRect) {
        print("___________________________________")
        
        //        drawLine(startPoint: CGPoint(x: 0, y: 20.0), endPoint: CGPoint(x: 100.0, y: 20.0), color: UIColor.blue)
        //
        //        drawLine(fromX: 5.0, fromY: 10.0, toX: 50.0, toY: 100.0, color: UIColor.black)
        drawGrid()
    }
   
    func drawCell(withColor color: UIColor, x: CGFloat, y: CGFloat, width: CGFloat, height:CGFloat) {
        
        
        let cellRect = CGRect(x: topLeftX + gap * row - gap / 2, y: topLeftY + gap * col - gap / 2, width: gap, height: gap)
        let path = UIBezierPath(rect: cellRect)
        color.setFill()
        path.fill()
    }
    func drawLine(startPoint: CGPoint, endPoint: CGPoint, color: UIColor) {
        let line = UIBezierPath()
        line.move(to: startPoint)
        line.addLine(to: endPoint)
        
        //        let strokeColor = UIColor.red
        color.setStroke()
        
        line.stroke()
    }
    
    func drawLine (fromX: CGFloat, fromY: CGFloat, toX: CGFloat, toY: CGFloat, color: UIColor){
        drawLine(startPoint: CGPoint(x: fromX, y: fromY), endPoint: CGPoint(x: toX, y: toY), color: color)
    }
    
    func drawGrid() {
        let x = topLeftX + gap * row
        let y = topLeftY + gap * col
        print(self)
        print(bounds.origin.x)
        print(bounds.origin.y)
        print(bounds.width)
        print(bounds.height)
        drawCell(withColor: .green, x: x, y: y, width: gap, height: gap)
       
        

       
        
        // horizontal
        
        for i in 0...4 {
            drawLine(fromX: topLeftX, fromY: topLeftY + CGFloat(i) * gap, toX: gap * CGFloat(9) + topLeftX - gap, toY: topLeftY + CGFloat(i) * gap, color: UIColor.red)
        }
        
        // vertical
        
        for i in 0...8 {
            drawLine(fromX: topLeftX + CGFloat(i) * gap, fromY: topLeftY , toX: topLeftX + CGFloat(i) * gap, toY: gap * CGFloat(4) + topLeftY, color: UIColor.black)
        }
        
        for i in 0...4 {
            drawLine(fromX: topLeftX, fromY: topLeftY + CGFloat(i) * gap + gap * 5, toX: gap * CGFloat(9) + topLeftX - gap, toY: topLeftY + CGFloat(i) * gap + gap * 5, color: UIColor.red)
        }
        
        // vertical
        
        for i in 0...8 {
            drawLine(fromX: topLeftX + CGFloat(i) * gap, fromY: topLeftY + gap * 9, toX: topLeftX + CGFloat(i) * gap, toY: gap * CGFloat(5) + topLeftY, color: UIColor.black)
        }
    
        drawLine(fromX: topLeftX, fromY: gap * 4 + topLeftY, toX: topLeftX, toY: gap * 5 + topLeftY, color: .blue)
        
        drawLine(fromX: topLeftX + gap * 8, fromY: gap * 4 + topLeftY, toX: topLeftX + gap * 8, toY: gap * 5 + topLeftY, color: .blue)
        
        drawLine(fromX: topLeftX + gap * 3, fromY: topLeftY, toX: topLeftX + gap * 5, toY: topLeftY + gap * 2, color: .black)
        
        drawLine(fromX: topLeftX + gap * 5, fromY: topLeftY, toX: topLeftX + gap * 3, toY: topLeftY + gap * 2, color: .black)
    
        drawLine(fromX: topLeftX + gap * 3, fromY: topLeftY + gap * 7, toX: topLeftX + gap * 5, toY: topLeftY + gap * 9, color: .black)
        
        drawLine(fromX: topLeftX + gap * 5, fromY: topLeftY + gap * 7, toX: topLeftX + gap * 3, toY: topLeftY + gap * 9, color: .black)
    }
}


