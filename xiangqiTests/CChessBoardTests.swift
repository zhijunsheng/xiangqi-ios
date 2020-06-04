//
//  CChessBoardTests.swift
//  xiangqiTests
//
//  Created by Grace Huang on 5/28/20.
//  Copyright © 2020 GoldThumb Inc. All rights reserved.
//

import XCTest
@testable import xiangqi

class CChessBoardTests: XCTestCase {

    func testPrintingBoard() {
        var board = CChessBoard()
        
        board.pieceBox.insert(CChessPiece(imgName:"rb", col: 3, row: 3, isBlack: false, pieceType: .King))
        board.pieceBox.insert(CChessPiece(imgName:"bb", col: 3, row: 6, isBlack: true, pieceType: .King))
        print(board)
        
    }
    
    func testTernary() {
//        if 5 % 2 == 1 {
//            print("odd")
//        } else {
//            print("Even")
//        }
        
        print(5 % 2 == 1 ? "odd" : "even")
        
        var a = 3
        // Collatz Conjecture
        if a % 2 == 0 {
            a = a / 2
        } else {
            a = 3 * a + 1
        }
        
        a = a % 2 == 0 ? a / 2 : 3 * a + 1
    }
    
    
    
}
