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
//    func testQ26() {
//        <#statements#>
//    }
//    func testQ77() {
//        var a: Int
//        for a in 1...9 {
//            for b in 1...9 {
//                for c in 1...9 {
//                    for d in 1...9 {
//                        for i in 1...a {
//                            if a % i != 0 {
//                                if 1 / a =
//                            } else {
//                                continue
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }
    
    func testNum() {
        var num = 0
        num = (420 * 820 / 20) % 3
        print(num)
    }
    
    func testReversal() {
        // also works ||
        //            \/
//        var num: Int = 0
//        for a in 0...9 {
//            for b in 0...9 {
//                for c in 0...9 {
//                    for d in 1...9 {
//                        num = a * 1000 + b * 100 + c * 10 + d
//                        for i in 2...9 {
//                            if (d * 1000 + c * 100 + b * 10 + a) * i == num {
//                                print(num)
//                            }
//                        }
//                    }
//                }
//            }
//        }
        for b in 1...9999 {
            for i in 2...9 {
                if b % 10 != 0 && reversal(number: b) * i == b {
                    print(b)
                }
            }
        }
        XCTAssertEqual(4321, reversal(number: 1234))
    }
    
    func reversal(number: Int) -> Int {
        if number < 100 {
            let a = number / 10
            let b = number % 10
            return a + b * 10
        } else if number < 1000 {
            let a = number / 100
            let b = number % 100 / 10
            let c = number % 10
            return a + b * 10 + c * 100
        } else if number < 10000 {
            let a = number / 1000
            let b = number % 1000 / 100
            let c = number % 100 / 10
            let d = number % 10
            return a + b * 10 + c * 100 + d * 1000
        }
        return 2789
    }
}
