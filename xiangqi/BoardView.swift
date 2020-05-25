//
//  BoardView.swift
//  xiangqi
//
//  Created by Felix Lo on 2020-05-22.
//  Copyright © 2020 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: 50, y: 50))
        path.addLine(to: CGPoint(x: 50, y: 200))
        
        path.move(to: CGPoint(x: 250, y: 400))
        path.addLine(to: CGPoint(x: 50, y: 200))
        
        path.stroke()
        
    }
    

}
