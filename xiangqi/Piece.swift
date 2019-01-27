//
//  Piece.swift
//  xiangqi
//
//  Created by Peter Shi on 2019-01-12.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import Foundation

struct Piece: Hashable {
    var col: Int
    var row: Int
    let imageName: String
    let rank: String
    let isRed: Bool
}
