//
//  Player.swift
//  CChess
//
//  Created by Zhijun Sheng on 2020-07-15.
//  Copyright © 2020 Gold Thumb Inc. All rights reserved.
//

import Foundation

enum Player {
    case red
    case black
    
    var enemy: Player {
        switch self {
        case .red:
            return .black
        case .black:
            return .red
        }
    }
}
