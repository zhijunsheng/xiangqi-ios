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
        let brd: XiangqiBoard
        brd = XiangqiBoard()
        XCTAssertTrue(brd.isValidRookMove(fromCol: 0, fromRow: 0, toCol: 0, toRow: 2))
        
        // TODO
//        XCTAssertFalse(brd.isValidRookMove(fromCol: 8, fromRow: 0, toCol: 8, toRow: 4))
    }
    
    func testIsValidKnightMove() {
        var brd: XiangqiBoard
        brd = XiangqiBoard()
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
    
    func testIsValidBishopMove() {
        var brd: XiangqiBoard
        
        /*
         
           0 1 2 3 4 5 6 7 8
         0 . . ! . . . . . .
         1 . . . . . . . . .
         2 B . . . . . . . .
         3 . . . . . . . . .
         4 . . . . . . . . .
         5 . . . . . . . . .
         6 . . . . . . . . .
         7 . . . . . . . . .
         8 . . . . . . . . .
         9 . . . . . . . . .
         
         */
        brd = XiangqiBoard()
        brd.pieces.insert(XiangqiPiece(rank: .bishop, isRed: true, col: 0, row: 2))
        XCTAssertTrue(brd.isValidBishopMove(fromCol: 0, fromRow: 2, toCol: 2, toRow: 0))
        
        // crossing the river
        /*
         + 0 1 2 3 4 5 6 7 8
         0 . . . . . . . . .
         1 . . . . . . . . .
         2 . . . . . . . . .
         3 . . . . . . . . .
         4 . . B . . . . . .
         5 . . . . . . . . .
         6 . . . . ? . . . .
         7 . . . . . . . . .
         8 . . . . . . . . .
         9 . . . . . . . . .
         */
        brd = XiangqiBoard()
        brd.pieces.insert(XiangqiPiece(rank: .bishop, isRed: true, col: 2, row: 4))
        XCTAssertFalse(brd.isValidBishopMove(fromCol: 2, fromRow: 4, toCol: 4, toRow: 6))
        
        /*
         + 0 1 2 3 4 5 6 7 8
         0 . . . . . . . . .
         1 . . . . . . . . .
         2 . . . . . . . . .
         3 . . . . ? . . . .
         4 . . . . . . . . .
         5 . . . . . . b . .
         6 . . . . . . . . .
         7 . . . . . . . . .
         8 . . . . . . . . .
         9 . . . . . . . . .
         */
        brd = XiangqiBoard()
        brd.pieces.insert(XiangqiPiece(rank: .bishop, isRed: false, col: 6, row: 5))
        XCTAssertFalse(brd.isValidBishopMove(fromCol: 6, fromRow: 5, toCol: 4, toRow: 3))
        
        // blocking
        
        /*
         
          0 1 2 3 4 5 6 7 8
        0 . . . . . . . . .
        1 . . . . . . . . .
        2 . . . . . . . . .
        3 . . B . . . . . .
        4 . . . R . . . . .
        5 . . . . ? . . . .
        6 . . . . . . . . .
        7 . . . . . . . . .
        8 . . . . . . . . .
        9 . . . . . . . . .
         
        */
        brd = XiangqiBoard()
        brd.pieces.insert(XiangqiPiece(rank: .rook, isRed: true, col: 3, row: 4))
        brd.pieces.insert(XiangqiPiece(rank: .bishop, isRed: true, col: 2, row: 3))
        XCTAssertFalse(brd.isValidBishopMove(fromCol: 2, fromRow: 3, toCol: 4, toRow: 5))
        print(brd)
    }
    
    func testIsValidKingMove() {
        var brd: XiangqiBoard
        /*
         
           0 1 2 3 4 5 6 7 8
         0 . . . . . K ? . .
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
        brd = XiangqiBoard()
        brd.pieces.insert(XiangqiPiece(rank: .king, isRed: true, col: 5, row: 0))
        XCTAssertFalse(brd.isValidKingMove(fromCol: 5, fromRow: 0, toCol: 6, toRow: 0))
        
        /*
         
         + 0 1 2 3 4 5 6 7 8
         0 . . . . K ! . . .
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
        brd = XiangqiBoard()
        brd.pieces.insert(XiangqiPiece(rank: .king, isRed: true, col: 4, row: 0))
        XCTAssertTrue(brd.isValidKingMove(fromCol: 4, fromRow: 0, toCol: 5, toRow: 0))
    }
}
