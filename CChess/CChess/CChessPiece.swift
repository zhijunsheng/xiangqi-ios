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
    let isRed: Bool
    let rank: CChessRank
    let imageName: String
}

var testData: Set<CChessPiece> = [
    CChessPiece(col: 0, row: 0, isRed: false, rank: .rook, imageName: "bj"),
    CChessPiece(col: 1, row: 0, isRed: false, rank: .knight, imageName: "bm"),
    CChessPiece(col: 2, row: 0, isRed: false, rank: .bishop, imageName: "bx"),
]
