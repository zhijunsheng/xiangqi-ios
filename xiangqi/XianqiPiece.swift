//
//  xianqi.swift
//  xiangqi
//
//  Created by Lambert Lin on 2019/11/16.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import Foundation
struct XiangqiPiece {
    let col: Int // 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
    let row: Int // 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
    let rank: String // "rook", "knight", "pawn", "bishop", "king", "cannon", "guard"
    let isRed: Bool // true, false
}
