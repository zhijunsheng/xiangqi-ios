//
//  CChessPiece.swift
//  xiangqi
//
//  Created by Grace Huang on 5/31/20.
//  Copyright © 2020 GoldThumb Inc. All rights reserved.
//

import Foundation

struct CChessPiece: Hashable {
    let imgName: String
    let col: Int
    let row: Int
    let isBlack: Bool
    let pieceType: PieceType
}
