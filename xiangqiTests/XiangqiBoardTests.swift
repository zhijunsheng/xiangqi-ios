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
    func testXiangqiBoard() {
        var brd = XiangqiBoard()
        
        brd.initializeBoard()
        
        print(brd)
        print(brd.pieces.count)
    }
}
