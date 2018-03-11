//
//  SimpleLoopTests.swift
//  xiangqiTests
//
//  Created by Sharon Chen on 2018-03-04.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import XCTest

class SimpleLoopTests: XCTestCase {
    
    func testPriniting() {
        for i in 0...5 {
            print("____i is \(2 * i + 3)__________")
            print("_____")
        }
    }
    
    func testMultiply() {
        XCTAssertEqual(6, multiply(x: 2, y: 3))
        XCTAssertEqual(0, multiply(x: 0, y: 7))
        XCTAssertEqual(-4, multiply(x: 1, y: -4))
    }
    
    func multiply(x: Int, y: Int) -> Int {
        let sum = x * y
        return sum
    }
    
    func testAdd() {
        XCTAssertEqual(7, add(x: 3, y: 4))
        XCTAssertEqual(4, add(x: 0, y: 4))
        XCTAssertEqual(-7, add(x: 0, y: -7))
    }
    
    func add(x: Int, y: Int) -> Int {
        let sum = x + y
        return sum
    }
    
    func testSubtract() {
        XCTAssertEqual(7, subtract(x: 9, y: 2))
        XCTAssertEqual(0, subtract(x: 5, y: 5))
        XCTAssertEqual(-3, subtract(x: 2, y: 5))
    }
    
    func subtract(x: Int, y: Int) -> Int {
        let sum = x - y
        return sum
    }
        
    func testDivide() {
        XCTAssertEqual(3, divide(x: 9, y: 3))
        XCTAssertEqual(0, divide(x: 0, y: 8))
        XCTAssertEqual(-3, divide(x: 6, y: -2))
    }
        
    func divide(x: Int, y: Int) -> Int {
        let sum = x / y
        return sum
    }
}

