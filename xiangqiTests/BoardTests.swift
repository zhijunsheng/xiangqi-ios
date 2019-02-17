//
//  BoardTests.swift
//  xiangqiTests
//
//  Created by Peter Shi on 2019-01-23.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//  ©

import XCTest
@testable import xiangqi

class BoardTests: XCTestCase {
    
    //  _______________
    // |_|_|_|_|_|_|_|_|
    // |_|_|_|_|_|_|_|_|
    // |_|_|_|_|_|_|_|_|
    // |_|_|_|_|_|_|_|_|
    // |_______________|
    // |_|_|_|_|_|_|_|_|
    // |_|_|_|_|_|_|_|_|
    // |_|_|_|_|_|_|_|_|
    // |_|_|_|_|_|_|_|_|

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
        board.pieces.append(Piece(col: 4, row: 0, imageName: "bb", rank: "b", isRed: false))
        print(board)
        XCTAssertFalse(board.move车(startCol: 0, startRow: 0, destCol: 2, destRow: 1))
        XCTAssertFalse(board.move车(startCol: 0, startRow: 0, destCol: 1, destRow: 1))
        XCTAssertTrue(board.move车(startCol: 0, startRow: 0, destCol: 0, destRow: 9))
        XCTAssertFalse(board.move车(startCol: 0, startRow: 0, destCol: 8, destRow: 0))
    }
//
//    func testMove马() {
//        var board = Board()
//        board.pieces.append(Piece(col: 4, row: 3, imageName: "bm", rank: "m", isRed: false))
//        print(board)
//        XCTAssertTrue(board.move马(startCol: 4, startRow: 3, destCol: 6, destRow: 4))
//        XCTAssertTrue(board.move马(startCol: 4, startRow: 3, destCol: 6, destRow: 2))
//        XCTAssertTrue(board.move马(startCol: 4, startRow: 3, destCol: 5, destRow: 1))
//        XCTAssertTrue(board.move马(startCol: 4, startRow: 3, destCol: 3, destRow: 1))
//        XCTAssertTrue(board.move马(startCol: 4, startRow: 3, destCol: 2, destRow: 2))
//        XCTAssertTrue(board.move马(startCol: 4, startRow: 3, destCol: 2, destRow: 4))
//        XCTAssertTrue(board.move马(startCol: 4, startRow: 3, destCol: 3, destRow: 5))
//        XCTAssertTrue(board.move马(startCol: 4, startRow: 3, destCol: 5, destRow: 5))
//        XCTAssertFalse(board.move马(startCol: 4, startRow: 3, destCol: 4, destRow: 5))
//        XCTAssertFalse(board.move马(startCol: 4, startRow: 3, destCol: 2, destRow: 5))
//    }
    func testMove相() {
        var board = Board()
        board.pieces.append(Piece(col: 4, row: 2, imageName: "bx", rank: "x", isRed: false))
        print(board)
        XCTAssertTrue(board.move相(startCol: 4, startRow: 2, destCol: 2, destRow: 0))
        XCTAssertTrue(board.move相(startCol: 4, startRow: 2, destCol: 6, destRow: 0))
        XCTAssertTrue(board.move相(startCol: 4, startRow: 2, destCol: 2, destRow: 4))
        XCTAssertTrue(board.move相(startCol: 4, startRow: 2, destCol: 6, destRow: 4))
        XCTAssertFalse(board.move相(startCol: 4, startRow: 2, destCol: 4, destRow: 5))
        XCTAssertFalse(board.move相(startCol: 4, startRow: 2, destCol: 2, destRow: 5))
    }
    
    // j m x s b s x m j
    // . . . . . . . . .
    ///. p . . . . . p .
    // . z z . z . z . z
    // . . . . . . . . .
    // . . . . . . . . .
    // Z|||Z . Z . Z . Z
    // . p . . . . . P .
    // . . . . . . . . .
    // J M X S B S X M J
    
    func testMove炮() {
        
        var board = Board()
        board.pieces.append(Piece(col: 1, row: 1, imageName: "bp", rank: "p", isRed: false))
        print(board)
        
        
        //                                                    <=_<
        // <=ς>____________ψ______ψψψ________Ψ_________ψ____________ψΨΨψψ______ψψψ______ψ____ΨΨ_
        
        // ___________________
        // . . . . . . . . . \\
        // . p . . . . . . . \\
        // . . . ψ . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // ___________________
        XCTAssertFalse(board.move炮(startCol: 1, startRow: 1, destCol: 3, destRow: 2))
        XCTAssertFalse(board.move炮(startCol: 1, startRow: 1, destCol: 2, destRow: 2))
        
        // ___________________
        // . . . . . . . . . \\
        // . p . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . p . . . . . . . \\
        // ___________________
        XCTAssertTrue(board.move炮(startCol: 1, startRow: 1, destCol: 1, destRow: 9))
        
        // ___________________
        // . . . . . . . . . \\
        // . p . . . . . . p \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // ___________________
        XCTAssertTrue(board.move炮(startCol: 1, startRow: 1, destCol: 8, destRow: 1))
        
        // ___________________
        // . . . . . . . . . \\
        // . p . . . . . . . \\
        // . j . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . P . . . . . . . \\
        // . . . . . . . . . \\
        // ___________________
        
        board = Board()
        board.pieces.append(Piece(col: 1, row: 1, imageName: "bp", rank: "p", isRed: false))
        board.pieces.append(Piece(col: 1, row: 2, imageName: "bj", rank: "j", isRed: false))
        board.pieces.append(Piece(col: 1, row: 8, imageName: "rp", rank: "p", isRed: true))
        
        XCTAssertFalse(board.move炮(startCol: 1, startRow: 1, destCol: 3, destRow: 2))
        XCTAssertFalse(board.move炮(startCol: 1, startRow: 1, destCol: 2, destRow: 2))
        XCTAssertFalse(board.move炮(startCol: 1, startRow: 1, destCol: 1, destRow: 9))
        XCTAssertTrue(board.move炮(startCol: 1, startRow: 1, destCol: 1, destRow: 8))

       
        
        
        //___________________
        // . . . . . . . . . \\
        // . p . . . j . M . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        //___________________
        
        board = Board()
        board.pieces.append(Piece(col: 1, row: 1, imageName: "bp", rank: "p", isRed: false))
        board.pieces.append(Piece(col: 5, row: 1, imageName: "bj", rank: "j", isRed: false))
        board.pieces.append(Piece(col: 7, row: 1, imageName: "rp", rank: "p", isRed: true))
        XCTAssertTrue(board.move炮(startCol: 1, startRow: 1, destCol: 7, destRow: 1))

        
    }
    
    func testMove炮_cannibalism() {
        // ___________________
        // . . . . . . . . . \\
        // . p . . . . . . . \\
        // . j . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . m . . . . . . . \\
        // . . . . . . . . . \\
        // ___________________
        
        var board = Board()
        board.pieces.append(Piece(col: 1, row: 1, imageName: "bp", rank: "p", isRed: false))
        board.pieces.append(Piece(col: 1, row: 2, imageName: "bj", rank: "j", isRed: false))
        board.pieces.append(Piece(col: 1, row: 8, imageName: "rp", rank: "p", isRed: false))
        XCTAssertFalse(board.move炮(startCol: 1, startRow: 1, destCol: 3, destRow: 2))
        XCTAssertFalse(board.move炮(startCol: 1, startRow: 1, destCol: 2, destRow: 2))
        XCTAssertFalse(board.move炮(startCol: 1, startRow: 1, destCol: 1, destRow: 8))
    }
    
    func testMove炮_doubleBlocked() {
        // ___________________
        // . . . . . . . . . \\
        // . p . . . . . . . \\
        // . j . . . . . . . \\
        // . j . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . P . . . . . . . \\
        // . . . . . . . . . \\
        // ___________________
        
        var board = Board()
        board.pieces.append(Piece(col: 1, row: 1, imageName: "bp", rank: "p", isRed: false))
        board.pieces.append(Piece(col: 1, row: 2, imageName: "bj", rank: "j", isRed: false))
        board.pieces.append(Piece(col: 1, row: 3, imageName: "bj", rank: "j", isRed: false))
        board.pieces.append(Piece(col: 1, row: 8, imageName: "rp", rank: "p", isRed: true))
        XCTAssertFalse(board.move炮(startCol: 1, startRow: 1, destCol: 1, destRow: 8))
    }
    
    func testNumberOfPiecesBetweenVertical() {
        // numberOfPiecesBetween
        
        var board = Board()
        board.pieces.append(Piece(col: 1, row: 1, imageName: "bp", rank: "p", isRed: false))
        board.pieces.append(Piece(col: 1, row: 2, imageName: "bj", rank: "j", isRed: false))
        board.pieces.append(Piece(col: 1, row: 8, imageName: "rp", rank: "p", isRed: true))
        print(board)
        XCTAssertEqual(0, board.numberOfPiecesBetween(startCol: 1, startRow: 1, destCol: 3, destRow: 2))
        XCTAssertEqual(0, board.numberOfPiecesBetween(startCol: 1, startRow: 1, destCol: 2, destRow: 2))
        XCTAssertEqual(1, board.numberOfPiecesBetween(startCol: 1, startRow: 1, destCol: 1, destRow: 8))
        XCTAssertEqual(0, board.numberOfPiecesBetween(startCol: 1, startRow: 1, destCol: 8, destRow: 1))
        
        // add another piece to test number == 2
        board.pieces.append(Piece(col: 1, row: 3, imageName: "bb", rank: "b", isRed: false))
        XCTAssertEqual(2, board.numberOfPiecesBetween(startCol: 1, startRow: 1, destCol: 1, destRow: 8))
    }
    
    func testNumberOfPiecesBetweenHorizontal() {
        // numberOfPiecesBetween
        var board = Board()
        board.pieces.append(Piece(col: 1, row: 1, imageName: "bp", rank: "p", isRed: false))
        board.pieces.append(Piece(col: 2, row: 1, imageName: "bj", rank: "j", isRed: false))
        board.pieces.append(Piece(col: 8, row: 1, imageName: "rp", rank: "p", isRed: true))
        print(board)
        XCTAssertEqual(0, board.numberOfPiecesBetween(startCol: 1, startRow: 1, destCol: 2, destRow: 3))
        XCTAssertEqual(0, board.numberOfPiecesBetween(startCol: 1, startRow: 1, destCol: 2, destRow: 2))
        XCTAssertEqual(1, board.numberOfPiecesBetween(startCol: 1, startRow: 1, destCol: 8, destRow: 1))
        XCTAssertEqual(0, board.numberOfPiecesBetween(startCol: 1, startRow: 1, destCol: 1, destRow: 8))
        
        board.pieces.append(Piece(col: 3, row: 1, imageName: "bb", rank: "b", isRed: false))
        XCTAssertEqual(2, board.numberOfPiecesBetween(startCol: 1, startRow: 1, destCol: 8, destRow: 1))
        
    }
//
//    func testMove士() {
//        var board = Board()
//        board.pieces.append(Piece(col: 3, row: 0, imageName: "bs", rank: "s", isRed: false))
//        print(board)
//        XCTAssertFalse(board.move士(startCol: 3, startRow: 0, destCol: 2, destRow: 1))
//        XCTAssertTrue(board.move士(startCol: 3, startRow: 0, destCol: 4, destRow: 1))
//        XCTAssertFalse(board.move士(startCol: 3, startRow: 0, destCol: 4, destRow: 0))
//        XCTAssertFalse(board.move士(startCol: 3, startRow: 0, destCol: 5, destRow: 0))
//    }
}
//
