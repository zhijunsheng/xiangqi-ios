//
//  XiangqiPiece.swift
//  xiangqi
//
//  Created by Halwong on 2019/5/4.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import Foundation

struct XiangqiPiece: Hashable {
    let rank: XiangqiPieceRank
    let isRed: Bool
    let col: Int
    let row: Int
    let imgName: String
}

