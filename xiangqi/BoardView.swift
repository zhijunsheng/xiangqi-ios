//
//  BoardView.swift
//  xiangqi
//
//  Created by 刀剑神域 SAO project on 2019-04-22.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {

    override func draw(_ rect: CGRect) {
    
        
        
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: 20, y: 20))
        path.addLine(to: CGPoint(x: 300, y: 20))
        
        path.stroke()
        
        
        
        //Board
        //Pieces of two players
        //Function and movement of every piece
        //How to check
        
        
    }
    

}
