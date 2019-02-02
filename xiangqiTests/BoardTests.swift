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
        board.pieces.append(Piece(col: 8, row: 0, imageName: "bj", rank: "j", isRed: false))
        board.pieces.append(Piece(col: 0, row: 9, imageName: "rj", rank: "j", isRed: true))
        board.pieces.append(Piece(col: 8, row: 9, imageName: "rj", rank: "j", isRed: true))
        print(board)
    }
    func testMove车() {
        var board = Board()
        board.pieces.append(Piece(col: 0, row: 0, imageName: "bj", rank: "j", isRed: false))
        print(board)
        XCTAssertFalse(board.move车(startCol: 0, startRow: 0, destCol: 2, destRow: 1))
        XCTAssertFalse(board.move车(startCol: 0, startRow: 0, destCol: 1, destRow: 1))
        XCTAssertTrue(board.move车(startCol: 0, startRow: 0, destCol: 0, destRow: 9))
        XCTAssertTrue(board.move车(startCol: 0, startRow: 0, destCol: 8, destRow: 0))
    }
    func testMove马() {
        var board = Board()
        board.pieces.append(Piece(col: 4, row: 3, imageName: "bm", rank: "m", isRed: false))
        print(board)
        XCTAssertTrue(board.move马(startCol: 4, startRow: 3, destCol: 6, destRow: 4))
        XCTAssertTrue(board.move马(startCol: 4, startRow: 3, destCol: 6, destRow: 2))
        XCTAssertTrue(board.move马(startCol: 4, startRow: 3, destCol: 5, destRow: 1))
        XCTAssertTrue(board.move马(startCol: 4, startRow: 3, destCol: 3, destRow: 1))
        XCTAssertTrue(board.move马(startCol: 4, startRow: 3, destCol: 2, destRow: 2))
        XCTAssertTrue(board.move马(startCol: 4, startRow: 3, destCol: 2, destRow: 4))
        XCTAssertTrue(board.move马(startCol: 4, startRow: 3, destCol: 3, destRow: 5))
        XCTAssertTrue(board.move马(startCol: 4, startRow: 3, destCol: 5, destRow: 5))
        XCTAssertFalse(board.move马(startCol: 4, startRow: 3, destCol: 4, destRow: 5))
        XCTAssertFalse(board.move马(startCol: 4, startRow: 3, destCol: 2, destRow: 5))
    }
}
