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
    let cellSide:CGFloat = 258/8
    override func draw(_ rect: CGRect) {
        let pieceImage = UIImage(named:"rb")
        pieceImage?.draw(at: CGPoint(x: 25, y: 25))
        
        let pen = UIBezierPath()
        pen.move(to: CGPoint(x: originX, y: originY))
        pen.addLine(to: CGPoint(x: cellSide * 8 + originX, y: originY))
        pen.addLine(to: CGPoint(x: cellSide * 8 + originX, y: cellSide * 9 + originY))
        pen.addLine(to: CGPoint(x: originX, y: cellSide * 9 + originY))
        pen.close()

        for i in 0..<7 {
            pen.move(to: CGPoint(x: cellSide * CGFloat(i + 1) + originX, y: originY))
            pen.addLine(to: CGPoint(x: cellSide * CGFloat(i + 1) + originX, y: cellSide * 4 + originY))

            pen.move(to: CGPoint(x: cellSide * CGFloat(i + 1) + originX, y: cellSide * 5 + originY))
            pen.addLine(to: CGPoint(x: cellSide * CGFloat(i + 1) + originX, y: cellSide * 9 + originY))

        }
        pen.move(to: CGPoint(x: originX, y: cellSide * 4 + originY))
        pen.addLine(to: CGPoint(x: cellSide * 8 + originX, y: cellSide * 4 + originY))
        pen.move(to: CGPoint(x: originX, y: cellSide * 5 + originY))
        pen.addLine(to: CGPoint(x: cellSide * 8 + originX, y: cellSide * 5 + originY))

        for i in 0..<9 {
            pen.move(to: CGPoint(x: originX, y: cellSide * CGFloat(i) + originY))
            pen.addLine(to: CGPoint(x: cellSide * 8 + originX, y: cellSide * CGFloat(i) + originY))
        }
        
        for i in 0..<2 {
            pen.move(to: CGPoint(x: cellSide * 3 + originX, y: originY + cellSide * CGFloat(i * 7)))
            pen.addLine(to: CGPoint(x: cellSide * 5 + originX, y: originY + cellSide * CGFloat(i * 7 + 2)))
            
            pen.move(to: CGPoint(x: cellSide * 5 + originX, y: originY + cellSide * CGFloat(i * 7)))
            pen.addLine(to: CGPoint(x: cellSide * 3 + originX, y: originY + cellSide * CGFloat(i * 7 + 2)))
        }
        pen.stroke()
    }
 
}
