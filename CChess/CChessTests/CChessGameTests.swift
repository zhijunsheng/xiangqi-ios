//
//  CChessGameTests.swift
//  CChessTests
//
//  Created by Zhijun Sheng on 2020-06-29.
//  Copyright © 2020 Gold Thumb Inc. All rights reserved.
//

import XCTest
@testable import CChess

class CChessGameTests: XCTestCase {

    func testGameBoard() {
        let game = CChess()
        XCTAssertNotNil(game.pieceAt(col: 0, row: 0))
        XCTAssertNil(game.pieceAt(col: 0, row: 1))
    }
    
    func testMovePiece() {
        let game = CChess()
        XCTAssertNotNil(game.pieceAt(col: 0, row: 0))
        XCTAssertNil(game.pieceAt(col: 0, row: 1))
        
        game.movePiece(fromCol: 0, fromRow: 0, toCol: 0, toRow: 1)
        
        XCTAssertNil(game.pieceAt(col: 0, row: 0))
        XCTAssertNotNil(game.pieceAt(col: 0, row: 1))
    }

    func testCanMovePiece() {
        let game = CChess()
        XCTAssertFalse(game.canMovePiece(fromCol: 0, fromRow: 0, toCol: -2, toRow: 0))
    }
    
    func testCaptureOwnPiece() {
        let game = CChess()
        XCTAssertFalse(game.canMovePiece(fromCol: 0, fromRow: 0, toCol: 0, toRow: 3))
    }
    
    func testMovePieceFromEmpty() {
        let game = CChess()
        XCTAssertFalse(game.canMovePiece(fromCol: 0, fromRow: 1, toCol: 0, toRow: 3))
    }
}
