//
//  CannonTests.swift
//  CChessTests
//
//  Created by Zhijun Sheng on 2020-07-15.
//  Copyright © 2020 Gold Thumb Inc. All rights reserved.
//

import XCTest
@testable import CChess

class CannonTests: XCTestCase {

    func testCanCannonAttack() {
        var cchess = CChess()
        cchess.initializeGame()
        
        /*
         + 0 1 2 3 4 5 6 7 8
         0 R N B W K . B N R
         1 . . . . W . . . .
         2 . C . . . . . C .
         3 P . P . P . P . P
         4 . . . . . . . . .
         5 . . . . . . . . .
         6 p . p . p . p . p
         7 . c . . . . . . .
         8 . . . . . c . . .
         9 r n b w k w b n r
         */
        cchess.movePiece(move: Move(7, 7, 7, 8))
        cchess.movePiece(move: Move(5, 0, 4, 1))
        cchess.movePiece(move: Move(7, 8, 5, 8))
        XCTAssertFalse(cchess.canCannonAttack(Move(5, 8, 5, 0)))
    }

}
