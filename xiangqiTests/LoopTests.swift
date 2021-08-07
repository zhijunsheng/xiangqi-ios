//
//  LoopTests.swift
//  xiangqiTests
//
//  Created by jichengye on 2021/8/6.
//  Copyright © 2021 GoldThumb Inc. All rights reserved.
//

import XCTest

class LoopTests: XCTestCase {
    
//     even number, odd number
    
    func testisEven() {
        let answer = isEven(num: 5)
        print(answer)
        let ans = isEven(num: 6)
        print(ans)
    }
    
    func isEven(num: Int) -> Bool {
        if num / 2 == 0{
            return true
        } else{
            return false
        }
    }
    
    
    
    
    func testGreaterThan3() {
        let answer = greaterThan3(num: 5)
        print(answer)
        let ans = greaterThan3(num: -7)
        print(ans)
    }
    
    func greaterThan3(num: Int) -> Bool { // booleanb
        if num > 3 {
            return true
        } else{
            return false
        }
    }
    
    func testMul() {
        let p = mul(a: 2, b: 3, c: 4)
        print("p = \(p)")
    }
    
    func mul(a: Int, b: Int, c: Int) -> Int {
        let prod = a * b * c
        return prod
    }
  
    func testSub() {
        let d = sub(a: 7, b: 4)
        print("d = \(d)")
    }
    
    func sub(a: Int, b: Int) -> Int {
        let diff = a - b
        return diff
    }
 
    func testAdd() {
        // addition, subtraction, multiplication, division
        // plus, minus, times, divide
        let s = add(a: 3, b: 5)
        print("s = \(s)")
    }
    
    func add(a: Int, b: Int) -> Int {
        let sum = a + b
        return sum
    }
 
    func testFunction() {
        print("maths")
        sayHello()
        print("________________________")
        sayHelloTo(person: "Albert")
        sayHelloTo(person: "Donald")
    }
    
    func sayHelloTo(person: String) {
        print("Hello: \(person)")
    }
    
    func sayHello() {
        print("Hello")
    }

}
