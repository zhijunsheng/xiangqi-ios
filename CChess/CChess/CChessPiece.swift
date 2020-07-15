//
//  CChessPiece.swift
//  CChess
//
//  Created by Zhijun Sheng on 2020-06-26.
//  Copyright © 2020 Gold Thumb Inc. All rights reserved.
//

import Foundation

struct CChessPiece: Hashable {
    let col: Int
    let row: Int
    let player: Player
    let rank: CChessRank
    let imageName: String
}
