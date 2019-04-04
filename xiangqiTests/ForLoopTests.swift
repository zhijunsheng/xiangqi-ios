//
//  ForLoopTests.swift
//  xiangqiTests
//
//  Created by Zhijun Sheng on 2018-03-04.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import XCTest

class ForLoopTests: XCTestCase {
    
    func testPriniting() {
        for i in 0...5 {
            print("i is \(i)")
        }
    }
    
    func testDict() {
        var dict: [String : Int] = ["A": 123, "bc": -4, "Peter": 100]
        XCTAssertEqual(100, dict["Peter"])
        XCTAssertEqual(-4, dict["bc"])
        dict.removeValue(forKey: "A")
        XCTAssertNil(dict["A"])
    }
}

