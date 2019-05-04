//
//  XiangqiBoard.swift
//  xiangqi
//
//  Created by Halwong on 2019/5/3.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import Foundation

struct XiangqiBoard: CustomStringConvertible {
    
    /*
       0 1 2 3 4 5 6 7 8
     0 . . . . . . . . .
     1 . . . . . . . . .
     2 . . . . . . . . .
     3 . . . . . . . . .
     4 . . . . . . . . .
     5 . . . . . . . . .
     6 . . . . . . . . .
     7 . . . . . . . . .
     8 . . . . . . . . .
     9 . . . . . . . . .
    */
    var description: String {
        var brdStr = ""
        
        brdStr += " "
        for b in 0 ..< 9 {
            brdStr += " \(b)"
        }
        brdStr += "\n"
        
        
        for a in 0 ..< 10 {
            brdStr += "\(a)"
            for _ in 0 ..< 9 {
                brdStr += " ."
            }
            brdStr += "\n"
        }
        
        return brdStr
    }
    
}
