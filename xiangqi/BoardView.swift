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
        pencil.addLine(to: CGPoint(x: 30, y: 210))
        
        pencil.move(to: CGPoint(x: 60, y: 30))
        pencil.addLine(to: CGPoint(x: 60, y: 210))
        
        pencil.move(to:   CGPoint(x: 90, y: 30))
        pencil.addLine(to: CGPoint(x: 90, y: 210))
        
        pencil.move(to: CGPoint(x: 120, y: 30))
        pencil.addLine(to: CGPoint(x: 120, y: 210))
        
        pencil.move(to: CGPoint(x: 150, y: 30))
        pencil.addLine(to: CGPoint(x: 150, y: 210))
        
        pencil.move(to: CGPoint(x: 180, y: 30))
        pencil.addLine(to: CGPoint(x: 180, y: 210))
 
        pencil.move(to: CGPoint(x: 210, y: 30))
        pencil.addLine(to: CGPoint(x: 210, y: 210))
        
        pencil.move(to: CGPoint(x: 240, y: 30))
        pencil.addLine(to: CGPoint(x: 240, y: 210))
        
        pencil.move(to:   CGPoint(x: 270, y: 30))
        pencil.addLine(to: CGPoint(x: 270, y: 210))
        
        //
        pencil.move(to: CGPoint(x: 30, y: 240))
        pencil.addLine(to: CGPoint(x: 30, y: 390))
               
        pencil.move(to: CGPoint(x: 60, y: 240))
        pencil.addLine(to: CGPoint(x: 60, y: 390))
               
        pencil.move(to:   CGPoint(x: 90, y: 240))
        pencil.addLine(to: CGPoint(x: 90, y: 390))
               
        pencil.move(to: CGPoint(x: 120, y: 240))
        pencil.addLine(to: CGPoint(x: 120, y: 390))
               
        pencil.move(to: CGPoint(x: 150, y: 240))
        pencil.addLine(to: CGPoint(x: 150, y: 390))
            
        pencil.move(to: CGPoint(x: 180, y: 240))
        pencil.addLine(to: CGPoint(x: 180, y: 390))
        
        pencil.move(to: CGPoint(x: 210, y: 240))
        pencil.addLine(to: CGPoint(x: 210, y: 390))
               
        pencil.move(to: CGPoint(x: 240, y: 240))
        pencil.addLine(to: CGPoint(x: 240, y: 390))
               
        pencil.move(to:   CGPoint(x: 270, y: 240))
        pencil.addLine(to: CGPoint(x: 270, y: 390))
        
        //horzontal
        
        pencil.move(to: CGPoint(x: 30, y: 30))
        pencil.addLine(to: CGPoint(x: 270, y: 30))
       
        pencil.move(to: CGPoint(x: 30, y: 70))
        pencil.addLine(to: CGPoint(x: 270, y: 70))
        
        pencil.move(to: CGPoint(x: 30, y: 110))
        pencil.addLine(to: CGPoint(x: 270, y: 110))
        
        pencil.move(to: CGPoint(x: 30, y: 150))
        pencil.addLine(to: CGPoint(x: 270, y: 150))
        
        pencil.move(to: CGPoint(x: 30, y: 190))
        pencil.addLine(to: CGPoint(x: 270, y: 190))
        
        
        
        
        
        pencil.stroke()
      
    }


}
