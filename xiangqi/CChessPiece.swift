//
//  CChessPiece.swift
//  xiangqi
//
//  Created by Felix Lo on 2020/6/8.
//  Copyright © 2020 GoldThumb Inc. All rights reserved.
//

import Foundation

struct CChessPiece: Hashable {
    let isBlack: Bool
    let rank: CChessRank
    let col: Int
    let row: Int
    let imageName: String
}
