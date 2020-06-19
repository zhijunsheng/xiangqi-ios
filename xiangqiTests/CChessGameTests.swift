//
//  CChessGameTests.swift
//  xiangqiTests
//
//  Created by Felix Lo on 2020/6/10.
//  Copyright © 2020 GoldThumb Inc. All rights reserved.
//

import XCTest
@testable import xiangqi

class CChessGameTests: XCTestCase {

    func testPrintBoard() {
        var game = CChessGame()
        let aPiece = CChessPiece(isBlack: true, rank: .knight, col: 1, row: 0, imageName: "bm.pmg")
        game.pieces.insert(aPiece)
        
        print(game)
        
    }

    func testPieceAt() {
        var game = CChessGame()
        let piece = CChessPiece(isBlack: true, rank: .rook, col: 0, row: 0, imageName: "bm.pmg")
        
        let piece2 = CChessPiece(isBlack: true, rank: .rook, col: 7, row: 0, imageName: "bm.pmg")
        
        let piece1 = CChessPiece(isBlack: false, rank: .guardian, col: 2, row: 3, imageName:"bm.pmg")
        
        game.pieces.insert(piece)
        game.pieces.insert(piece2)
        game.pieces.insert(piece1)
        XCTAssertNotNil(game.pieceAt(col: 0, row: 0))
        XCTAssertNil(game.pieceAt(col: 0, row: 3))
        XCTAssertNotNil(game.pieceAt(col: 7, row: 0))
        print (game)
    }
    
}
