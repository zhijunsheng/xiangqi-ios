//
//  XiangqiBoard.swift
//  xiangqi
//
//  Created by Halwong on 2019/5/3.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import Foundation

struct XiangqiBoard: CustomStringConvertible {
    
    var description: String {
        var brdStr = ""
        for _ in 0 ..< 10 {
            for _ in 0 ..< 9 { // "\n"
                brdStr += " ."
            }
            brdStr += "\n"
        }
        
        
//        brdStr = brdStr + "abcd"
//        brdStr.append("++++++")
        
        return brdStr
    }
    
}
