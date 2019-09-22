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
        
        XCTAssertNil(Utils.xyToColRow(xy: 169.0, orgXY: 70.0, cellSide: 100.0, margin: 15))
        XCTAssertNil(Utils.xyToColRow(xy: 175.0, orgXY: 70.0, cellSide: 100.0, margin: 15))
        XCTAssertNil(Utils.xyToColRow(xy: 66.0, orgXY: 70.0, cellSide: 100.0, margin: 15))
        XCTAssertEqual(1, Utils.xyToColRow(xy: 189.0, orgXY: 70.0, cellSide: 100.0, margin: 15))
        
        XCTAssertNil(Utils.xyToColRow(xy: 71.0, orgXY: 70.0, cellSide: 100.0, margin: 15))
        XCTAssertEqual(0, Utils.xyToColRow(xy: 86.0, orgXY: 70.0, cellSide: 100.0, margin: 15))
        XCTAssertEqual(0, Utils.xyToColRow(xy: 150.0, orgXY: 70.0, cellSide: 100.0, margin: 15))
        XCTAssertNil(Utils.xyToColRow(xy: 160.0, orgXY: 70.0, cellSide: 100.0, margin: 15))
        XCTAssertNil(Utils.xyToColRow(xy: 180.0, orgXY: 70.0, cellSide: 100.0, margin: 15))
        XCTAssertEqual(1, Utils.xyToColRow(xy: 186.0, orgXY: 70.0, cellSide: 100.0, margin: 15))
        XCTAssertNil(Utils.xyToColRow(xy: 280.0, orgXY: 70.0, cellSide: 100.0, margin: 15))
        XCTAssertEqual(2, Utils.xyToColRow(xy: 287.0, orgXY: 70.0, cellSide: 100.0, margin: 15))
    }
}
