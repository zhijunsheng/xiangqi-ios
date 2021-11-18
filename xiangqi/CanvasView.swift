//
//  CanvasView.swift
//  xiangqi
//
//  Created by Kenneth Wu on 2021-11-17.
//  Copyright © 2021 GoldThumb Inc. All rights reserved.
//

import UIKit

class CanvasView: UIView {


    override func draw(_ rect: CGRect) {
        
        
        let line = UIBezierPath()
        
        let number = 75
        
        
        line.move(to: CGPoint(x: number, y: number))
        line.addLine(to: CGPoint(x: number*9, y: number))
        
        line.move(to: CGPoint(x: number, y:number*2))
        line.addLine(to: CGPoint(x: number*9, y: number*2))
        
        line.move(to: CGPoint(x: number, y: number*3))
        line.addLine(to: CGPoint(x: number*9, y: number*3))
        
        line.move(to: CGPoint(x: number, y: number*4))
        line.addLine(to: CGPoint(x: number*9, y: number*4))
        
        
        
        line.move(to: CGPoint(x: number*4, y: number))
        line.addLine(to: CGPoint(x: number*6, y: number*3))
        
        line.move(to: CGPoint(x: number*6, y: number))
        line.addLine(to: CGPoint(x: number*4, y: number*3))
        
        
        
        line.move(to: CGPoint(x: number, y: number*5))
        line.addLine(to: CGPoint(x: number*9, y: number*5))
        
        line.move(to: CGPoint(x: number, y: number*6))
        line.addLine(to: CGPoint(x: number*9, y: number*6))
        
        line.move(to: CGPoint(x: number, y: number*7))
        line.addLine(to: CGPoint(x: number*9, y: number*7))
        
        line.move(to: CGPoint(x: number, y:number*8))
        line.addLine(to: CGPoint(x: number*9, y: number*8))
        
        line.move(to: CGPoint(x: number, y: number*9))
        line.addLine(to: CGPoint(x: number*9, y: number*9))
        
        line.move(to: CGPoint(x: number, y: number*10))
        line.addLine(to: CGPoint(x: number*9, y: number*10))
        
        
        
        line.move(to: CGPoint(x: number, y: number*1))
        line.addLine(to: CGPoint(x: number, y: number*5))
        
        line.move(to: CGPoint(x: number*2, y: number*1))
        line.addLine(to: CGPoint(x: number*2, y: number*5))
        
        line.move(to: CGPoint(x: number*3, y: number*1))
        line.addLine(to: CGPoint(x: number*3, y: number*5))
        
        line.move(to: CGPoint(x: number*4, y: number*1))
        line.addLine(to: CGPoint(x: number*4, y: number*5))
        
        line.move(to: CGPoint(x: number*5, y: number*1))
        line.addLine(to: CGPoint(x: number*5, y: number*5))
        
        line.move(to: CGPoint(x: number*6, y: number*1))
        line.addLine(to: CGPoint(x: number*6, y: number*5))
        
        line.move(to: CGPoint(x: number*7, y: number*1))
        line.addLine(to: CGPoint(x: number*7, y: number*5))
        
        line.move(to: CGPoint(x: number*8, y: number*1))
        line.addLine(to: CGPoint(x: number*8, y: number*5))
        
        line.move(to: CGPoint(x: number*9, y: number*1))
        line.addLine(to: CGPoint(x: number*9, y: number*5))
        
        
        
        line.move(to: CGPoint(x: number, y: number*10))
        line.addLine(to: CGPoint(x: number, y: number*6))
        
        line.move(to: CGPoint(x: number*2, y: number*10))
        line.addLine(to: CGPoint(x: number*2, y: number*6))
        
        line.move(to: CGPoint(x: number*3, y: number*10))
        line.addLine(to: CGPoint(x: number*3, y: number*6))
        
        line.move(to: CGPoint(x: number*4, y:number*10))
        line.addLine(to: CGPoint(x: number*4, y: number*6))
        
        line.move(to: CGPoint(x: number*5, y: number*10))
        line.addLine(to: CGPoint(x: number*5, y: number*6))
        
        line.move(to: CGPoint(x: number*6, y: number*10))
        line.addLine(to: CGPoint(x: number*6, y: number*6))
        
        line.move(to: CGPoint(x: number*7, y: number*10))
        line.addLine(to: CGPoint(x: number*7, y: number*6))

        line.move(to: CGPoint(x: number*8, y: number*10))
        line.addLine(to: CGPoint(x: number*8, y: number*6))

        line.move(to: CGPoint(x: number*9, y: number*10))
        line.addLine(to: CGPoint(x: number*9, y: number*6))

        
        line.move(to: CGPoint(x: number*6, y: number*10))
        line.addLine(to: CGPoint(x: number*4, y: number*8))
        
        line.move(to: CGPoint(x: number*6, y: number*8 ))
        line.addLine(to: CGPoint(x: number*4, y: number*10))
        
        line.stroke()
    }

}
