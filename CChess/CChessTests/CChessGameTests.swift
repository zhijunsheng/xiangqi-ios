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

    func testPrintingGameBoard() {
        let game = CChessGame()
        game.reset()
        print(game)
    }

}
