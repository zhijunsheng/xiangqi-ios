//
//  CChessDelegate.swift
//  CChess
//
//  Created by Zhijun Sheng on 2020-07-14.
//  Copyright © 2020 Gold Thumb Inc. All rights reserved.
//

import Foundation

protocol CChessDelegate {
    func play(with move: Move)
    func pieceAt(col: Int, row: Int) -> CChessPiece?
}
