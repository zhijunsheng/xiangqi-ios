//
//  XiangqiBoardTests.swift
//  xiangqiTests
//
//  Created by Halwong on 2019/5/3.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import XCTest
@testable import xiangqi

class XiangqiBoardTests: XCTestCase {
    
    
    
    func testIsValidRookMove() {
        var brd = XiangqiBoard()
        brd.initializeBoard()
        print(brd)
        
        XCTAssertTrue(brd.isValidRookMove(fromCol: 0, fromRow: 0, toCol: 0, toRow: 2))
        
        XCTAssertFalse(brd.isValidRookMove(fromCol: 8, fromRow: 0, toCol: 8, toRow: 4))
        
        brd.movePiece(fromCol: 0, fromRow: 0, toCol: 0, toRow: 2)
        print(brd)
    }
    
    func testIsValidKnightMove() {
        var brd = XiangqiBoard()
        XCTAssertTrue(brd.isValidKnightMove(fromCol: 4, fromRow: 5, toCol: 2, toRow: 4))
        XCTAssertTrue(brd.isValidKnightMove(fromCol: 4, fromRow: 5, toCol: 3, toRow: 3))
        XCTAssertTrue(brd.isValidKnightMove(fromCol: 4, fromRow: 5, toCol: 5, toRow: 3))
        XCTAssertTrue(brd.isValidKnightMove(fromCol: 4, fromRow: 5, toCol: 6, toRow: 4))
        XCTAssertTrue(brd.isValidKnightMove(fromCol: 4, fromRow: 5, toCol: 6, toRow: 6))
        XCTAssertTrue(brd.isValidKnightMove(fromCol: 4, fromRow: 5, toCol: 5, toRow: 7))
        XCTAssertTrue(brd.isValidKnightMove(fromCol: 4, fromRow: 5, toCol: 3, toRow: 7))
        XCTAssertTrue(brd.isValidKnightMove(fromCol: 4, fromRow: 5, toCol: 2, toRow: 6))

        XCTAssertTrue(brd.isValidKnightMove(fromCol: 4, fromRow: 5, toCol: 5, toRow: 7))
        
        brd.pieces.insert(XiangqiPiece(rank: .pawn, isRed: true, col: 2, row: 3))
        XCTAssertFalse(brd.isValidKnightMove(fromCol: 2, fromRow: 2, toCol: 1, toRow: 4))
        
        brd.initializeBoard()
        
        XCTAssertTrue(brd.isValidKnightMove(fromCol: 1, fromRow: 9, toCol: 2, toRow: 7))
        XCTAssertFalse(brd.isValidKnightMove(fromCol: 2, fromRow: 7, toCol: 3, toRow: 5))
        
        XCTAssertFalse(brd.isValidKnightMove(fromCol: 1, fromRow: 0, toCol: 3, toRow: 1))
    }
}
