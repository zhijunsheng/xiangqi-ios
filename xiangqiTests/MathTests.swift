//
//  Swift.swift
//  xiangqiTests
//
//  Created by Peter Shi on 2019-03-14.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import XCTest

class Swift: XCTestCase {
    
    func testDecreasing() {
        var count: Int = 0
        
        for a in 1...9 {
            for b in 0...9 {
                for c in 0...9 {
//                    for d in 0...9 { // d = 3
//                        for e in 0...9 {
//                            if a > b && b > c && c > d && d > e { // e = 0, 1, 2
//                                count += 1
//                                print("\(a)\(b)\(c)\(d)\(e)")
//                            }
//                        }
//                    }
                    for d in 0...9 { // d = 3
                        for e in 0..<d {
                            if a > b && b > c && c > d { // e = 0, 1, 2
                                count += 1
                                print("\(a)\(b)\(c)\(d)\(e)")
                            }
                        }
                    }
                }
            }
        }
        XCTAssertEqual(count, 252)
    }
}
