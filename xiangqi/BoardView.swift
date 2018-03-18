//
//  BoardView.swift
//  xiangqi
//
//  Created by Sharon Chen on 2018-03-11.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {


    override func draw(_ rect: CGRect) {
        print("___________________________________")

//        drawLine(startPoint: CGPoint(x: 0, y: 20.0), endPoint: CGPoint(x: 100.0, y: 20.0), color: UIColor.blue)
//
//        drawLine(fromX: 5.0, fromY: 10.0, toX: 50.0, toY: 100.0, color: UIColor.black)
        drawGrid()
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
        print(self)
        print(bounds.origin.x)
        print(bounds.origin.y)
        print(bounds.width)
        print(bounds.height)
        
        let topLeftX: CGFloat = 50.0
        let topLeftY: CGFloat = 40.0
        
        let cellWidth: CGFloat = 25
        let cellHeight: CGFloat = 20
        
        // horizontal
        
        for i in 0...8 {
            drawLine(fromX: topLeftX, fromY: topLeftY + CGFloat(i) * cellHeight, toX: cellWidth * CGFloat(7) + topLeftX, toY: topLeftY + CGFloat(i) * cellHeight, color: UIColor.red)
        }
        
        // vertical
        
        for i in 0...7 {
            drawLine(fromX: topLeftX + CGFloat(i) * cellWidth, fromY: topLeftY , toX: topLeftX + CGFloat(i) * cellWidth, toY: cellHeight * CGFloat(8) + topLeftY, color: UIColor.black)
        }
    }
}

