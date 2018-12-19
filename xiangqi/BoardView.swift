//
//  BoardView.swift
//  xiangqi
//
//  Created by Halwong on 2018/11/29.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import UIKit
// (re)write the code from scratch
class BoardView: UIView {
    var originX: CGFloat = 25
    var originY: CGFloat = 20
    var cellSide: CGFloat = 28
    let gap: CGFloat = 5
    let outerFrameLineWidth: CGFloat = 3
    let intervalGap: CGFloat = 3
    let shortLine: CGFloat = 6
    
    let rows = 10
    let cols = 9
    let percent: CGFloat = 0.9
    
    
    override func draw(_ rect: CGRect) {
        
        var smaller = rect.width
        if rect.width > rect.height {
            smaller = rect.height
        }
        
//        originX = (rect.width - smaller * percent) / 2
//        print("-------------\(originX)--------------")
//        originY = (rect.height - smaller * percent) / 2
//        cellSide = smaller * percent / CGFloat(cols - 1)
        cellSide = smaller * percent / CGFloat(rows - 1)
        originX = (rect.width - cellSide * CGFloat(cols - 1)) / 2
        originY = (rect.height - cellSide * CGFloat(rows - 1)) / 2
        
        
        print(rect.width)
        print(rect.height)
        
        drawFrame()
        drawLines()
        drawOuterFrame()
        drawVerticalLines(isUpperHalf: true)
        drawVerticalLines(isUpperHalf: false)
        
        for i in 0 ..< 2 {
            drawHalfStar(locationX: 1 + i * 6, locationY: 2, isLeftHalf: true)
            drawHalfStar(locationX: 1 + i * 6, locationY: 2, isLeftHalf: false)
            drawHalfStar(locationX: 1 + i * 6, locationY: 7, isLeftHalf: true)
            drawHalfStar(locationX: 1 + i * 6, locationY: 7, isLeftHalf: false)
        }
        
        for i in 0 ..< 4 {
            drawHalfStar(locationX: (i + 1) * 2, locationY: 3, isLeftHalf: true)
            drawHalfStar(locationX: (i + 1) * 2, locationY: 6, isLeftHalf: true)
            drawHalfStar(locationX: i * 2, locationY: 3, isLeftHalf: false)
            drawHalfStar(locationX: i * 2, locationY: 6, isLeftHalf: false)
        }
        
        let pen = UIBezierPath()
        pen.move(to: CGPoint(x: originX + cellSide * 5, y: originY))
        pen.addLine(to: CGPoint(x: originX + cellSide * 3, y: originY + cellSide * 2))
        
        pen.move(to: CGPoint(x: originX + cellSide * 3, y: originY))
        pen.addLine(to: CGPoint(x: originX + cellSide * 5, y: originY + cellSide * 2))
        
        pen.move(to: CGPoint(x: originX + cellSide * 5, y: originY + cellSide * 7))
        pen.addLine(to: CGPoint(x: originX + cellSide * 3, y: originY + cellSide * 9))
        
        pen.move(to: CGPoint(x: originX + cellSide * 3, y: originY + cellSide * 7))
        pen.addLine(to: CGPoint(x: originX + cellSide * 5, y: originY + cellSide * 9))
        
        pen.stroke()
    }
    
    func drawQuarterStar(locationX: Int, locationY: Int, isLeftHalf: Bool, isUpperHalf: Bool) {
        var sign0: CGFloat
        var sign1: CGFloat
        if isLeftHalf && isUpperHalf {
            sign0 = -1
            sign1 = -1
        } else if isLeftHalf && !isUpperHalf {
            sign0 = 1
            sign1 = -1
        } else if !isLeftHalf && isUpperHalf {
            sign0 = -1
            sign1 = 1
        } else {
            sign0 = 1
            sign1 = 1
        }
        
        let pencil = UIBezierPath()
        pencil.move(to: CGPoint(x: originX + cellSide * CGFloat(locationX) + intervalGap * sign1, y: originY + cellSide * CGFloat(locationY) + shortLine * sign0 + intervalGap * sign0))
        pencil.addLine(to: CGPoint(x: originX + cellSide * CGFloat(locationX) + intervalGap * sign1, y: originY + cellSide * CGFloat(locationY) + intervalGap * sign0))
        pencil.addLine(to: CGPoint(x: originX + cellSide * CGFloat(locationX) + shortLine * sign1 + intervalGap * sign1, y: originY + cellSide * CGFloat(locationY) + intervalGap * sign0))
        
        pencil.stroke()
    }
    
    func drawHalfStar(locationX: Int, locationY: Int, isLeftHalf: Bool) {
        let pencil = UIBezierPath()
        if isLeftHalf {
            drawQuarterStar(locationX: locationX, locationY: locationY, isLeftHalf: true, isUpperHalf: true)
            drawQuarterStar(locationX: locationX, locationY: locationY, isLeftHalf: true, isUpperHalf: false)
        } else {
            drawQuarterStar(locationX: locationX, locationY: locationY, isLeftHalf: false, isUpperHalf: true)
            drawQuarterStar(locationX: locationX, locationY: locationY, isLeftHalf: false, isUpperHalf: false)
        }
        
        pencil.stroke()
    }
    
    func drawLines() {
        for i in 1 ..< rows - 1 {
            let pencil = UIBezierPath()
            pencil.move(to: CGPoint(x: originX, y: originY + cellSide * CGFloat(i)))
            pencil.addLine(to: CGPoint(x: originX + cellSide * CGFloat(cols - 1), y: originY + cellSide * CGFloat(i)))
            
            pencil.stroke()
        }
    }
    
    func drawFrame() {
        let pen = UIBezierPath()
        pen.move(to: CGPoint(x: originX, y: originY))
        pen.addLine(to: CGPoint(x: originX + cellSide * CGFloat(cols - 1), y: originY))
        pen.addLine(to: CGPoint(x: originX + cellSide * CGFloat(cols - 1), y: originY + cellSide * CGFloat(rows - 1)))
        pen.addLine(to: CGPoint(x: originX, y: originY + cellSide * CGFloat(rows - 1)))
        pen.close()
        pen.stroke()
    }
    
    func drawOuterFrame() {
        let pen = UIBezierPath()
        pen.move(to: CGPoint(x: originX - gap, y: originY - gap))
        pen.addLine(to: CGPoint(x: originX + cellSide * CGFloat(cols - 1) + gap, y: originY - gap))
        pen.addLine(to: CGPoint(x: originX + cellSide * CGFloat(cols - 1) + gap, y: originY + cellSide * CGFloat(rows - 1) + gap))
        pen.addLine(to: CGPoint(x: originX - gap, y: originY + cellSide * CGFloat(rows - 1) + gap))
        pen.close()
        pen.lineWidth = outerFrameLineWidth
        pen.stroke()
    }
    
    func drawVerticalLines(isUpperHalf: Bool) {
        let pen = UIBezierPath()
        var verticalOffset = 0
        if !isUpperHalf {
            verticalOffset = 5
        }
        for i in 1 ..< cols - 1 {
            pen.move(to: CGPoint(x: originX + cellSide * CGFloat(i), y: originY + cellSide * CGFloat(verticalOffset)))
            pen.addLine(to: CGPoint(x: originX + cellSide * CGFloat(i), y: originY + cellSide * CGFloat((rows - 2) / 2 + verticalOffset)))
        }
        pen.stroke()
    }
}
