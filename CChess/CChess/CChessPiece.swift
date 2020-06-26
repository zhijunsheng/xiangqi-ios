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
    let imageName: String
}

var testData: Set<CChessPiece> = [
    CChessPiece(col: 0, row: 0, imageName: "bj"),
    CChessPiece(col: 1, row: 0, imageName: "bm"),
    CChessPiece(col: 2, row: 0, imageName: "bx"),
]
