//
//  BoardView.swift
//  xiangqi
//
//  Created by jichengye on 2021/7/28.
//  Copyright © 2021 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {

    override func draw(_ rect: CGRect) {
            
        let line1 = UIBezierPath()
        for i in 0 ..< 9 {
            line1.move(to: CGPoint(x: 50, y: 50 + 68.75 * CGFloat(i)))
            line1.addLine(to: CGPoint(x: 50 + 68.75 * 8, y: 50 + 68.75 * CGFloat(i)))
            
        }
        line1.stroke()
        
    }
    

}


  
    







