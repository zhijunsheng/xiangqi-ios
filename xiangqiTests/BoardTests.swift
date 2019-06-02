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
    // |_|_|_|\|/|_|_|_|`
    // |_|_|_|/|\|_|_|_|`
    // |_|_|_|_|_|_|_|_|`
    // |_|_|_|_|_|_|_|_|`
    // |this is a river|`
    // |_|_|_|_|_|_|_|_|`
    // |_|_|_|_|_|_|_|_|`
    // |_|_|_|\|/|_|_|_|`
    // |_|_|_|/|\|_|_|_|`
    //  `````````````````
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
        
        board.pieces.insert(Piece(col: 0, row: 0, imageName: "bj", rank: "j", isRed: false))
        board.pieces.insert(Piece(col: 8, row: 0, imageName: "bj", rank: "j", isRed: false))
        board.pieces.insert(Piece(col: 0, row: 9, imageName: "rj", rank: "j", isRed: true))
        board.pieces.insert(Piece(col: 8, row: 9, imageName: "rj", rank: "j", isRed: true))
        print(board)
    }
    
    func testMove车() {
        var board = Board()
        board.pieces.insert(Piece(col: 0, row: 0, imageName: "bj", rank: "j", isRed: false))
        board.pieces.insert(Piece(col: 4, row: 0, imageName: "bb", rank: "b", isRed: false))
        print(board)
        XCTAssertFalse(board.canMove车(startCol: 0, startRow: 0, destCol: 2, destRow: 1))
        XCTAssertFalse(board.canMove车(startCol: 0, startRow: 0, destCol: 1, destRow: 1))        
        XCTAssertTrue(board.canMove车(startCol: 0, startRow: 0, destCol: 0, destRow: 9))
        XCTAssertFalse(board.canMove车(startCol: 0, startRow: 0, destCol: 8, destRow: 0))
        XCTAssertTrue(board.canMove车(startCol: 0, startRow: 0, destCol: 0, destRow: 1))
        XCTAssertTrue(board.canMove车(startCol: 0, startRow: 0, destCol: 1, destRow: 0))
        // ___________________
        // Φ . . . . . . . . \\
        // . . . . . . . . . \\
        // j . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // ___________________
        board = Board()
        board.pieces.insert(Piece(col: 0, row: 2, imageName: "bj", rank: "j", isRed: false))
        print(board)
        XCTAssertTrue(board.canMove车(startCol: 0, startRow: 2, destCol: 0, destRow: 0))
    }

    func testMove马() {
        var board = Board()
        board.pieces.insert(Piece(col: 4, row: 3, imageName: "bm", rank: "m", isRed: false))
        print(board)
        XCTAssertTrue(board.canMove马(startCol: 4, startRow: 3, destCol: 6, destRow: 4))
        XCTAssertTrue(board.canMove马(startCol: 4, startRow: 3, destCol: 6, destRow: 2))
        XCTAssertTrue(board.canMove马(startCol: 4, startRow: 3, destCol: 5, destRow: 1))
        XCTAssertTrue(board.canMove马(startCol: 4, startRow: 3, destCol: 3, destRow: 1))
        XCTAssertTrue(board.canMove马(startCol: 4, startRow: 3, destCol: 2, destRow: 2))
        XCTAssertTrue(board.canMove马(startCol: 4, startRow: 3, destCol: 2, destRow: 4))
        XCTAssertTrue(board.canMove马(startCol: 4, startRow: 3, destCol: 3, destRow: 5))
        XCTAssertTrue(board.canMove马(startCol: 4, startRow: 3, destCol: 5, destRow: 5))
        XCTAssertFalse(board.canMove马(startCol: 4, startRow: 3, destCol: 4, destRow: 5))
        XCTAssertFalse(board.canMove马(startCol: 4, startRow: 3, destCol: 2, destRow: 5))
    }
    
    func testMove🌲🐎() { //🐎<(OW!!!!!)
        // ___________________
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . m . . . . \\
        // . . . . j . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // ___________________
        var board = Board()
        board.pieces.insert(Piece(col: 4, row: 3, imageName: "bm", rank: "m", isRed: false))
        board.pieces.insert(Piece(col: 4, row: 4, imageName: "bj", rank: "j", isRed: false))
        print(board)
        XCTAssertFalse(board.canMove马(startCol: 4, startRow: 3, destCol: 5, destRow: 5))
    }
    
    func testMove相() {
        var board = Board()
        board.pieces.insert(Piece(col: 4, row: 2, imageName: "bx", rank: "x", isRed: false))
        print(board)
        XCTAssertTrue(board.canMove相(startCol: 4, startRow: 2, destCol: 2, destRow: 0))
        XCTAssertTrue(board.canMove相(startCol: 4, startRow: 2, destCol: 6, destRow: 0))
        XCTAssertTrue(board.canMove相(startCol: 4, startRow: 2, destCol: 2, destRow: 4))
        XCTAssertTrue(board.canMove相(startCol: 4, startRow: 2, destCol: 6, destRow: 4))
        XCTAssertFalse(board.canMove相(startCol: 4, startRow: 2, destCol: 4, destRow: 5))
        XCTAssertFalse(board.canMove相(startCol: 4, startRow: 2, destCol: 2, destRow: 5))
    }
    
    func test🐘() {
        // ___________________
        // . . . . . . . . . \\
        // . . . b . . . . . \\
        // . . . . x . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // ___________________
        var board = Board()
        board.pieces.insert(Piece(col: 4, row: 2, imageName: "bx", rank: "x", isRed: false))
        board.pieces.insert(Piece(col: 3, row: 1, imageName: "bb", rank: "b", isRed: false))
        print(board)
        XCTAssertFalse(board.canMove相(startCol: 4, startRow: 2, destCol: 2, destRow: 0))
    }
    //                      _________________________________________
    func testI🐘() { // 🐘<(WHAT!!! I can't cross the river!!! Humph.)
        //                  `````````````````````````````````````````
        // ___________________
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . x . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // ___________________
        var board = Board()
        board.pieces.insert(Piece(col: 2, row: 4, imageName: "bx", rank: "x", isRed: false))
        print(board)
        XCTAssertFalse(board.canMove相(startCol: 2, startRow: 4, destCol: 4, destRow: 6)) //        🐘<(FALSE!?!)
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
        board.pieces.insert(Piece(col: 1, row: 1, imageName: "bp", rank: "p", isRed: false))
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
        XCTAssertFalse(board.canMove炮(startCol: 1, startRow: 1, destCol: 3, destRow: 2))
        XCTAssertFalse(board.canMove炮(startCol: 1, startRow: 1, destCol: 2, destRow: 2))
        
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
        XCTAssertTrue(board.canMove炮(startCol: 1, startRow: 1, destCol: 1, destRow: 9))
        
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
        XCTAssertTrue(board.canMove炮(startCol: 1, startRow: 1, destCol: 8, destRow: 1))
        
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
        board.pieces.insert(Piece(col: 1, row: 1, imageName: "bp", rank: "p", isRed: false))
        board.pieces.insert(Piece(col: 1, row: 2, imageName: "bj", rank: "j", isRed: false))
        board.pieces.insert(Piece(col: 1, row: 8, imageName: "rp", rank: "p", isRed: true))
        
        XCTAssertFalse(board.canMove炮(startCol: 1, startRow: 1, destCol: 3, destRow: 2))
        XCTAssertFalse(board.canMove炮(startCol: 1, startRow: 1, destCol: 2, destRow: 2))
        XCTAssertFalse(board.canMove炮(startCol: 1, startRow: 1, destCol: 1, destRow: 9))
        XCTAssertTrue(board.canMove炮(startCol: 1, startRow: 1, destCol: 1, destRow: 8))

       
        
        
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
        board.pieces.insert(Piece(col: 1, row: 1, imageName: "bp", rank: "p", isRed: false))
        board.pieces.insert(Piece(col: 5, row: 1, imageName: "bj", rank: "j", isRed: false))
        board.pieces.insert(Piece(col: 7, row: 1, imageName: "rp", rank: "p", isRed: true))
        XCTAssertTrue(board.canMove炮(startCol: 1, startRow: 1, destCol: 7, destRow: 1))

        //___________________
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . p . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . P . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        //___________________
        
        board = Board()
        board.pieces.insert(Piece(col: 1, row: 2, imageName: "bp", rank: "p", isRed: false))
        board.pieces.insert(Piece(col: 1, row: 7, imageName: "rp", rank: "p", isRed: true))
        
        XCTAssertFalse(board.canMoveTo(piece: board.pieceAt(col: 1, row: 7)!, destCol: 1, destRow: 2))
        
        
        //___________________
        // . . . . . . . . . \\
        // . p . . . J . . . \\
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
        board.pieces.insert(Piece(col: 1, row: 1, imageName: "bp", rank: "p", isRed: false))
        board.pieces.insert(Piece(col: 5, row: 1, imageName: "rp", rank: "p", isRed: true))
        
        XCTAssertFalse(board.canMoveTo(piece: board.pieceAt(col: 1, row: 1)!, destCol: 5, destRow: 1))
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
        board.pieces.insert(Piece(col: 1, row: 1, imageName: "bp", rank: "p", isRed: false))
        board.pieces.insert(Piece(col: 1, row: 2, imageName: "bj", rank: "j", isRed: false))
        board.pieces.insert(Piece(col: 1, row: 8, imageName: "rp", rank: "p", isRed: false))
        XCTAssertFalse(board.canMove炮(startCol: 1, startRow: 1, destCol: 3, destRow: 2))
        XCTAssertFalse(board.canMove炮(startCol: 1, startRow: 1, destCol: 2, destRow: 2))
        XCTAssertFalse(board.canMove炮(startCol: 1, startRow: 1, destCol: 1, destRow: 8))
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
        board.pieces.insert(Piece(col: 1, row: 1, imageName: "bp", rank: "p", isRed: false))
        board.pieces.insert(Piece(col: 1, row: 2, imageName: "bj", rank: "j", isRed: false))
        board.pieces.insert(Piece(col: 1, row: 3, imageName: "bj", rank: "j", isRed: false))
        board.pieces.insert(Piece(col: 1, row: 8, imageName: "rp", rank: "p", isRed: true))
        XCTAssertFalse(board.canMove炮(startCol: 1, startRow: 1, destCol: 1, destRow: 8))
    }
    
    // ___________________
    // . m . . . . . . . \\
    // . . . . . . . . . \\
    // . p . . . . . . . \\
    // . . . . . . . . . \\
    // . . . . . . . . . \\
    // . . . . . . . . . \\
    // . . . . . . . . . \\
    // . P . . . . . . . \\
    // . . . . . . . . . \\
    // . . . . . . . . . \\
    // ___________________
    
    func testCannonCrash() {
        var board = Board()
        board.pieces.insert(Piece(col: 1, row: 7, imageName: "rp", rank: "p", isRed: true))
        board.pieces.insert(Piece(col: 1, row: 2, imageName: "bp", rank: "p", isRed: false))
        board.pieces.insert(Piece(col: 1, row: 0, imageName: "bm", rank: "m", isRed: false))
        print(board)
        XCTAssertEqual(1, board.numberOfPiecesBetween(startCol: 1, startRow: 7, destCol: 1, destRow: 0))
    }
    
    func testNumberOfPiecesBetweenVertical() {
        // numberOfPiecesBetween
        
        var board = Board()
        board.pieces.insert(Piece(col: 1, row: 1, imageName: "bp", rank: "p", isRed: false))
        board.pieces.insert(Piece(col: 1, row: 2, imageName: "bj", rank: "j", isRed: false))
        board.pieces.insert(Piece(col: 1, row: 8, imageName: "rp", rank: "p", isRed: true))
        print(board)
        XCTAssertEqual(0, board.numberOfPiecesBetween(startCol: 1, startRow: 1, destCol: 3, destRow: 2))
        XCTAssertEqual(0, board.numberOfPiecesBetween(startCol: 1, startRow: 1, destCol: 2, destRow: 2))
        XCTAssertEqual(1, board.numberOfPiecesBetween(startCol: 1, startRow: 1, destCol: 1, destRow: 8))
        XCTAssertEqual(0, board.numberOfPiecesBetween(startCol: 1, startRow: 1, destCol: 8, destRow: 1))
        
//         add another piece to test number == 2
        board.pieces.insert(Piece(col: 1, row: 3, imageName: "bb", rank: "b", isRed: false))
        XCTAssertEqual(2, board.numberOfPiecesBetween(startCol: 1, startRow: 1, destCol: 1, destRow: 8))
    }
    
    func testNumberOfPiecesBetweenHorizontal() {
        // numberOfPiecesBetween
        var board = Board()
        board.pieces.insert(Piece(col: 1, row: 1, imageName: "bp", rank: "p", isRed: false))
        board.pieces.insert(Piece(col: 2, row: 1, imageName: "bj", rank: "j", isRed: false))
        board.pieces.insert(Piece(col: 8, row: 1, imageName: "rp", rank: "p", isRed: true))
        print(board)
        XCTAssertEqual(0, board.numberOfPiecesBetween(startCol: 1, startRow: 1, destCol: 2, destRow: 3))
        XCTAssertEqual(0, board.numberOfPiecesBetween(startCol: 1, startRow: 1, destCol: 2, destRow: 2))
        XCTAssertEqual(1, board.numberOfPiecesBetween(startCol: 1, startRow: 1, destCol: 8, destRow: 1))

        XCTAssertEqual(1, board.numberOfPiecesBetween(startCol: 8, startRow: 1, destCol: 1, destRow: 1))
        XCTAssertEqual(0, board.numberOfPiecesBetween(startCol: 1, startRow: 1, destCol: 1, destRow: 8))
        
        board.pieces.insert(Piece(col: 3, row: 1, imageName: "bb", rank: "b", isRed: false))
        XCTAssertEqual(2, board.numberOfPiecesBetween(startCol: 1, startRow: 1, destCol: 8, destRow: 1))
        
    }

    func testMove士() {
        var board = Board()
        
        //  _______________
        // |_|_|_|\|/|_|_|_|`
        // |_|_|_|/|\|_|_|_|`
        // |_|_|_|_|_|_|_|_|`
        // |_|_|_|_|_|_|_|_|`
        // |this is a river|`
        // |_|_|_|_|_|_|_|_|`
        // |_|_|_|_|_|_|_|_|`
        // |_|_|_|\|/|_|_|_|`
        // |_|_|_|/|\|_|_|_|`
        //  `````````````````
        
        // ___________________
        // . . . s . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // ___________________
        
        board.pieces.insert(Piece(col: 3, row: 0, imageName: "bs", rank: "s", isRed: false))
        print(board)
        XCTAssertFalse(board.canMove士(startCol: 3, startRow: 0, destCol: 2, destRow: 1))
        XCTAssertTrue(board.canMove士(startCol: 3, startRow: 0, destCol: 4, destRow: 1))
        XCTAssertFalse(board.canMove士(startCol: 3, startRow: 0, destCol: 4, destRow: 0))
        XCTAssertFalse(board.canMove士(startCol: 3, startRow: 0, destCol: 5, destRow: 0))
    }
    
    func testMove将() {
        // ___________________
        // . . . b . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // ___________________
        
        var board = Board()
        board.pieces.insert(Piece(col: 3, row: 0, imageName: "bb", rank: "b", isRed: false))
        print(board)
        XCTAssertFalse(board.canMove将(startCol: 3, startRow: 0, destCol: 2, destRow: 0))
        XCTAssertFalse(board.canMove将(startCol: 3, startRow: 0, destCol: 2, destRow: 1))
        XCTAssertFalse(board.canMove将(startCol: 3, startRow: 0, destCol: 4, destRow: 1))
        XCTAssertFalse(board.canMove将(startCol: 3, startRow: 0, destCol: 5, destRow: 0))
        XCTAssertFalse(board.canMove将(startCol: 3, startRow: 0, destCol: 5, destRow: 1))
        XCTAssertTrue(board.canMove将(startCol: 3, startRow: 0, destCol: 3, destRow: 1))
        XCTAssertTrue(board.canMove将(startCol: 3, startRow: 0, destCol: 4, destRow: 0))
        XCTAssertTrue(board.canMove将(startCol: 4, startRow: 0, destCol: 5, destRow: 0))
        
        // ___________________
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . b . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // ___________________
//        board = Board()
//        board.pieces.insert(Piece(col: 3, row: 2, imageName: "bb", rank: "b", isRed: false))
//        XCTAssertFalse(<#T##expression: Bool##Bool#>)
    }
    
    func testMove卒() {
        // ___________________
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . = . . . . . . \\
        // . = z = . . . . . \\
        // . . * . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // ___________________
        var board = Board()
        board.pieces.insert(Piece(col: 2, row: 3, imageName: "bz", rank: "z", isRed: false))
        print(board)
        XCTAssertFalse(board.canMove卒(startCol: 2, startRow: 3, destCol: 1, destRow: 3))
        XCTAssertFalse(board.canMove卒(startCol: 2, startRow: 3, destCol: 3, destRow: 3))
        XCTAssertFalse(board.canMove卒(startCol: 2, startRow: 3, destCol: 2, destRow: 2))
        XCTAssertTrue(board.canMove卒(startCol: 2, startRow: 3, destCol: 2, destRow: 4))
        
        // ___________________
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . = . . . . . . \\
        // . = z = . . . . . \\
        // . . * . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // ___________________
        board = Board()
        board.pieces.insert(Piece(col: 2, row: 4, imageName: "bz", rank: "z", isRed: false))
        print(board)
        XCTAssertFalse(board.canMove卒(startCol: 2, startRow: 4, destCol: 1, destRow: 4))
        XCTAssertFalse(board.canMove卒(startCol: 2, startRow: 4, destCol: 3, destRow: 4))
        XCTAssertFalse(board.canMove卒(startCol: 2, startRow: 4, destCol: 2, destRow: 3))
        XCTAssertTrue(board.canMove卒(startCol: 2, startRow: 4, destCol: 2, destRow: 5))
        
        // ___________________
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . = . . . . . . \\
        // . * z * . . . . . \\
        // . . * . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // ___________________
        
        board = Board()
        board.pieces.insert(Piece(col: 2, row: 5, imageName: "bz", rank: "z", isRed: false))
        print(board)
        XCTAssertTrue(board.canMove卒(startCol: 2, startRow: 5, destCol: 1, destRow: 5))
        XCTAssertTrue(board.canMove卒(startCol: 2, startRow: 5, destCol: 3, destRow: 5))
        XCTAssertFalse(board.canMove卒(startCol: 2, startRow: 5, destCol: 2, destRow: 4))
        XCTAssertTrue(board.canMove卒(startCol: 2, startRow: 5, destCol: 2, destRow: 6))
        
        // ___________________
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . * . . . . . . \\
        // . = Z = . . . . . \\
        // . . = . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // ___________________
        board = Board()
        board.pieces.insert(Piece(col: 2, row: 6, imageName: "rz", rank: "z", isRed: true))
        print(board)
        XCTAssertFalse(board.canMove卒(startCol: 2, startRow: 6, destCol: 1, destRow: 6))
        XCTAssertFalse(board.canMove卒(startCol: 2, startRow: 6, destCol: 3, destRow: 6))
        XCTAssertFalse(board.canMove卒(startCol: 2, startRow: 6, destCol: 2, destRow: 7))
        XCTAssertTrue(board.canMove卒(startCol: 2, startRow: 6, destCol: 2, destRow: 5))
        
        // ___________________
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . * . . . . . . \\
        // . = Z = . . . . . \\
        // . . = . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // ___________________
        board = Board()
        board.pieces.insert(Piece(col: 2, row: 5, imageName: "rz", rank: "z", isRed: true))
        print(board)
        XCTAssertFalse(board.canMove卒(startCol: 2, startRow: 5, destCol: 1, destRow: 5))
        XCTAssertFalse(board.canMove卒(startCol: 2, startRow: 5, destCol: 3, destRow: 5))
        XCTAssertFalse(board.canMove卒(startCol: 2, startRow: 5, destCol: 2, destRow: 6))
        XCTAssertTrue(board.canMove卒(startCol: 2, startRow: 5, destCol: 2, destRow: 4))
        
        // ___________________
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . * . . . . . . \\
        // . * Z * . . . . . \\
        // . . = . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // ___________________
        
        board = Board()
        board.pieces.insert(Piece(col: 2, row: 4, imageName: "rz", rank: "z", isRed: true))
        print(board)
        XCTAssertTrue(board.canMove卒(startCol: 2, startRow: 4, destCol: 1, destRow: 4))
        XCTAssertTrue(board.canMove卒(startCol: 2, startRow: 4, destCol: 3, destRow: 4))
        XCTAssertFalse(board.canMove卒(startCol: 2, startRow: 4, destCol: 2, destRow: 5))
        XCTAssertTrue(board.canMove卒(startCol: 2, startRow: 4, destCol: 2, destRow: 3))
        
    }
    
    func testMove() {
        //  _______________
        // |_|_|_|\|/|_|_|_|`
        // |_|_|_|/|\|_|_|_|`
        // |_|_|_|_|_|_|_|_|`
        // |_|_|_|_|_|_|_|_|`
        // |this is a river|`
        // |_|_|_|_|_|_|_|_|`
        // |_|_|_|_|_|_|_|_|`
        // |_|_|_|\|/|_|_|_|`
        // |_|_|_|/|\|_|_|_|`
        //  `````````````````
        
        //___________________
        // . . . . . . . . . \\
        // . p j . . . . . P \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        // . . . . . . . . . \\
        //___________________
        var board = Board()
        board.pieces.insert(Piece(col: 1, row: 1, imageName: "bp", rank: "p", isRed: false))
        board.pieces.insert(Piece(col: 2, row: 1, imageName: "bj", rank: "j", isRed: false))
        board.pieces.insert(Piece(col: 8, row: 1, imageName: "rp", rank: "p", isRed: true))
        print(board)
//        XCTAssertTrue(board.pieceAt(col: 8, row: 1)!.isRed)
        board.movePiece(startCol: 1, startRow: 1, destCol: 1, destRow: 5)
//        XCTAssertNil(board.pieceAt(col: 1, row: 1))
//        XCTAssertFalse(board.pieceAt(col: 8, row: 1)!.isRed)
        
//        print("______________________")
//        print(board.pieceAt(col: 8, row: 1)!.isRed)
        
        print(board)
        
        board = Board()
        board.pieces.insert(Piece(col: 1, row: 1, imageName: "bp", rank: "p", isRed: false))
        board.pieces.insert(Piece(col: 2, row: 1, imageName: "bj", rank: "j", isRed: false))
        board.pieces.insert(Piece(col: 8, row: 1, imageName: "rp", rank: "p", isRed: true))
        print(board)
        XCTAssertTrue(board.pieceAt(col: 8, row: 1)!.isRed)
        board.movePiece(startCol: 1, startRow: 1, destCol: 8, destRow: 1)
        XCTAssertNil(board.pieceAt(col: 1, row: 1))
        XCTAssertFalse(board.pieceAt(col: 8, row: 1)!.isRed)
        print(board)
        print(board.pieces)
    }
    
    func testTest() {
        /*
          _______________
         |_|_|_|\|/|_|_|_|`
         |_|_|_|/|\|_|_|_|`
         |_|_|_|_|_|_|_|_|`
         |_|_|_|_|_|_|_|_|`
         |this is a river|`
         |_|_|_|_|_|_|_|_|`
         |_|_|_|_|_|_|_|_|`
         |_|_|_|\|/|_|_|_|`
         |_|_|_|/|\|_|_|_|`
          `````````````````
        */
        
//        ___________________\\
//         j P x s . . . . . \\
//         . . . . . . . . . \\
//         . . . . . . . . . \\
//         . . . . . . . . . \\
//         . . . . . . . . . \\
//         . . . . . . . . . \\
//         . . . . . . . . . \\
//         . . . . . . . . . \\
//         . . . . . . . . . \\
//         . . . . . . . . . \\
//        ___________________\\
        
        var board = Board()
        board.pieces.insert(Piece(col: 0, row: 0, imageName: "bj", rank: "j", isRed: false))
        board.pieces.insert(Piece(col: 1, row: 0, imageName: "rp", rank: "p", isRed: true))
        board.pieces.insert(Piece(col: 2, row: 0, imageName: "bx", rank: "x", isRed: false))
        board.pieces.insert(Piece(col: 3, row: 0, imageName: "bs", rank: "s", isRed: false))
        print(board)
        XCTAssertEqual(4, board.pieces.count)
        board.movePiece(startCol: 1, startRow: 0, destCol: 3, destRow: 0)
        XCTAssertEqual(3, board.pieces.count)
        XCTAssertNil(board.pieceAt(col: 1, row: 0))
        XCTAssertTrue(board.canMoveTo(piece: board.pieceAt(col: 3, row: 0)!, destCol: 0, destRow: 0))
        
        
    }
}
