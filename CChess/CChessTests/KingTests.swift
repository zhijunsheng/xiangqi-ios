//
//  KingTests.swift
//  CChessTests
//
//  Created by Zhijun Sheng on 2020-07-15.
//  Copyright © 2020 Gold Thumb Inc. All rights reserved.
//

import XCTest
@testable import CChess

class KingTests: XCTestCase {

    func testThreatFromCannon() {
        var cchess = CChess()
        cchess.initializeGame()
        print(cchess)
        
        /*
         + 0 1 2 3 4 5 6 7 8
         0 . . . . . . . . .
         1 . . . . . . . . .
         2 . . . . . . . . .
         3 . . . . . . . . .
         4 . . . . . . . . .
         5 . . . . . . . . .
         6 . . . . . . . . .
         7 . . . . . . . . .
         8 . . . . . . . . .
         9 . . . . . . . . .
         */
        
    }
    
    func testUnderThreat() {
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
         7 . c . . . . . c .
         8 . . . . w . . . .
         9 r n b w k . b n r
         */
        cchess.movePiece(move: Move(5, 9, 4, 8))
        cchess.movePiece(move: Move(5, 0, 4, 1))
        XCTAssertFalse(cchess.underThreatAt(col: 5, row: 9, enemy: .black))
    }
    
    func testValidKing() {
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
         7 . c . . . . . c .
         8 . . . . w . . . .
         9 r n b w k . b n r
         */
        cchess.movePiece(move: Move(5, 9, 4, 8))
        cchess.movePiece(move: Move(5, 0, 4, 1))
        XCTAssertTrue(cchess.canKingAttack(Move(4, 9, 5, 9)))
        XCTAssertFalse(cchess.canSeeEnemyKingFrom(col: 5, row: 9, player: .red))
        XCTAssertTrue(cchess.canKingMove(Move(4, 9, 5, 9)))
        XCTAssertTrue(cchess.isValid(mv: Move(4, 9, 5, 9), player: .red))
    }

    func testKingsFaceToFace() {
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
         7 . c . . . . . c .
         8 . . . . w . . . .
         9 r n b w . k b n r
         */
        cchess.movePiece(move: Move(5, 9, 4, 8))
        cchess.movePiece(move: Move(5, 0, 4, 1))
        cchess.movePiece(move: Move(4, 9, 5, 9))
        XCTAssertTrue(cchess.canSeeEnemyKingFrom(col: 5, row: 0, player: .black))
        XCTAssertFalse(cchess.isValid(mv: Move(4, 0, 5, 0), player: .black))
    }
}
