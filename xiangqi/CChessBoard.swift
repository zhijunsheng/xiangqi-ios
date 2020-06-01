//
//  CChessBoard.swift
//  xiangqi
//
//  Created by Grace Huang on 5/28/20.
//  Copyright © 2020 GoldThumb Inc. All rights reserved.
//

import Foundation

struct CChessBoard: CustomStringConvertible {
    var description: String {
        var desc: String = ""
        desc += "  "
        
        for i in 0..<9 {
            desc += "\(i) "
        }
        
        desc += "\n"
        
        for row in 0..<10 {
            desc += "\(row) "
            for col in 0..<9 {
                desc += ". "
            }
            desc += "\n"
        }
        return desc
    }
}


