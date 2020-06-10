//
//  CChessGame.swift
//  xiangqi
//
//  Created by Felix Lo on 2020/6/10.
//  Copyright © 2020 GoldThumb Inc. All rights reserved.
//

import Foundation

struct CChessGame: CustomStringConvertible {
    var description: String {
        var desc = ""
        for _ in 0 ..< 10 {
            desc = desc + "\n"
            for i in 0 ..< 9 {
                desc = desc + "\(i)"
                desc = desc + ". "
            }
        }
        
        
        return desc
    }
    
    
}




