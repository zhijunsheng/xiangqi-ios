//
//  RookTests.swift
//  CChessTests
//
//  Created by Zhijun Sheng on 2020-07-09.
//  Copyright © 2020 Gold Thumb Inc. All rights reserved.
//

import XCTest
@testable import CChess

class RookTests: XCTestCase {

    func testRookOnEmptyBoard() {
        let game = CChessGame()
        game.pieces.removeAll()
        
        /*
         + 0 1 2 3 4 5 6 7 8
         0 . . . . . . . . .
         1 . . . . . . . . .
         2 . . . . . . . . .
         3 . . . . . . . . .
         4 . . . . r . . . .
         5 . . . . . . . . .
         6 . . . . . . . . .
         7 . . . . . . . . .
         8 . . . . . . . . .
         9 . . . . . . . . .
         */
        game.pieces.insert(CChessPiece(col: 4, row: 4, isRed: true, rank: .rook, imageName: ""))
        XCTAssertTrue(game.canMovePiece(fromCol: 4, fromRow: 4, toCol: 4, toRow: 0))
        
        /*
         + 0 1 2 3 4 5 6 7 8
         0 R N B W K W B N R
         1 . . . . . . . . .
         2 . C . . . . . C .
         3 P . P . P . P . P
         4 . . . . . . . . .
         5 . . . . . . . . .
         6 p . p . p . p . p
         7 . c . . . . . c .
         8 . . . . . . . . .
         9 r n b w k w b n r
         */
    }

}
