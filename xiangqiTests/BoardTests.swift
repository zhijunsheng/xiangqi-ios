//
//  BoardTests.swift
//  xiangqiTests
//
//  Created by Peter Shi on 2019-01-23.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import XCTest
@testable import xiangqi

class BoardTests: XCTestCase {
    
    // j m x s b s x m j
    // . . . . . . . . .
    // . p . . . . . p .
    // z . z . z . z . z
    // . . . . . . . . .
    // . . . . . . . . .
    // Z . Z . Z . Z . Z
    // . P . . . . . P .
    // . . . . . . . . .
    // J M X S B S X M J
    func testBoardOrAnything() {
        var board = Board()
        
        board.pieces.append(Piece(col: 0, row: 0, imageName: "bj", rank: "j", isRed: false))
        board.pieces.append(Piece(col: 1, row: 0, imageName: "bm", rank: "m", isRed: false))
//        board.pieces.append(Piece(col: 5, row: 9, imageName: "rs", rank: "s", isRed: true))
        print(board)
    }
}
