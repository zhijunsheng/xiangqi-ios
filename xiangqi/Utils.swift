//
//  Utils.swift
//  xiangqi
//
//  Created by Halwong on 2019/6/20.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import UIKit

struct Utils {
    static func xyToColRow(xy: CGFloat, orgXY: CGFloat, cellSide: CGFloat, margin: CGFloat) -> Int? {
        
        let col = Int((xy - orgXY) / cellSide)
        
        let first = orgXY + cellSide * CGFloat(col)
        let second = orgXY + cellSide * CGFloat(col + 1)
        
        if xy > first + margin && xy < second - margin {
            return col
        } else {
            return nil
        }
    }
    
    static func xToCol(x: CGFloat, orgX: CGFloat, cellSide: CGFloat, margin: CGFloat) -> Int? {
        let col = Int((x - orgX) / cellSide)
    
        let first = orgX + cellSide * CGFloat(col)
        let second = orgX + cellSide * CGFloat(col + 1)

        if x > first + margin && x < second - margin {
            return col
        } else {
            return nil
        }
    }
}

