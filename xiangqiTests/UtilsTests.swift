//
//  UtilsTests.swift
//  xiangqiTests
//
//  Created by Halwong on 2019/6/20.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import XCTest
@testable import xiangqi

class UtilsTests: XCTestCase {

    func testXToCol() {
        
        XCTAssertNil(Utils.xToCol(x: 169.0, orgX: 70.0, cellSide: 100.0, margin: 15))
        XCTAssertNil(Utils.xToCol(x: 175.0, orgX: 70.0, cellSide: 100.0, margin: 15))
        XCTAssertNil(Utils.xToCol(x: 66.0, orgX: 70.0, cellSide: 100.0, margin: 15))
        XCTAssertEqual(1, Utils.xToCol(x: 189.0, orgX: 70.0, cellSide: 100.0, margin: 15))
        
        XCTAssertNil(Utils.xToCol(x: 71.0, orgX: 70.0, cellSide: 100.0, margin: 15))
        XCTAssertEqual(0, Utils.xToCol(x: 86.0, orgX: 70.0, cellSide: 100.0, margin: 15))
        XCTAssertEqual(0, Utils.xToCol(x: 150.0, orgX: 70.0, cellSide: 100.0, margin: 15))
        XCTAssertNil(Utils.xToCol(x: 160.0, orgX: 70.0, cellSide: 100.0, margin: 15))
        XCTAssertNil(Utils.xToCol(x: 180.0, orgX: 70.0, cellSide: 100.0, margin: 15))
        XCTAssertEqual(1, Utils.xToCol(x: 186.0, orgX: 70.0, cellSide: 100.0, margin: 15))
        XCTAssertNil(Utils.xToCol(x: 280.0, orgX: 70.0, cellSide: 100.0, margin: 15))
        XCTAssertEqual(2, Utils.xToCol(x: 287.0, orgX: 70.0, cellSide: 100.0, margin: 15))
    }
}
