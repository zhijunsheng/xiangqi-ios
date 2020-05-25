
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
        
        for i in 0 ..< 10 {
            path.move(to: CGPoint(x: i * 50 + 77, y: 91))
            path.addLine(to: CGPoint(x: i * 50 + 77, y: 500 + 91))
        }

        for i in 0 ..< 11 {
            path.move(to: CGPoint(x: 77, y: i * 50 + 91))
            path.addLine(to: CGPoint(x: 450 + 77, y: i * 50 + 91))
        }
        
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        path.stroke()
        
    }
    

}
