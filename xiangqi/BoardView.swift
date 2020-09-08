//
//  BoardView.swift
//  xiangqi
//
//  Created by Corey Gao on 2020-09-07.
//  Copyright © 2020 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let pencil = UIBezierPath()
        
        pencil.move(to: CGPoint(x: 30, y: 30))
        pencil.addLine(to: CGPoint(x: 30, y: 80))
        
        pencil.stroke()
        
    }


}
