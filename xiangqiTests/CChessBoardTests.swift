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
        
        board.pieceBox.insert(CChessPiece(imgName:"rb", col: 3, row: 3, isBlack: false, pieceType:"B"))
        board.pieceBox.insert(CChessPiece(imgName:"bb", col: 3, row: 6, isBlack: true, pieceType:"B"))
        print(board)
        
    }
}
