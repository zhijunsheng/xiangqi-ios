//
//  PiTests.swift
//  xiangqiTests
//
//  Created by Bowen Lin on 2018-04-08.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import XCTest

class PiTests: XCTestCase {
   
    func testPi(){
        print("pi is \(Double.pi)")
        
        print("our pi1 \(calculatePi1(x: 5))")
    
//        print("our pi2 \(calculatePi2(x: 100001))")
    }
    
    func calculatePi1(x: Int) -> Double {
        
        var result: Double = 0
        for i in 1...x {
            result = result + Double(1) / Double(i * i)
        }
        result = result * 6
        result = sqrt(result)
        
        return result
    }
    
    func calculatePi2(x: Int) -> Double {
    var result: Double = 0
        for i in 1...x{
            print("1 = \(i)")
            let denominator = Double(i * 2 + 1)
            var fraction = 4 / denominator
            let sign = Double(truncating:pow(-1, i) as NSNumber)
            fraction *= sign
            result += fraction
            print("fraction = \(fraction)")
        }
        return result
    }
    
    func testPower(){
        
        let x = pow(5, 2)
        print(x)
    }

    func testSign(){
        XCTAssertEqual(1, sign(x: 4))
        XCTAssertEqual(1, sign(x: 16))
        XCTAssertEqual(1, sign(x: 4))
        XCTAssertEqual(-1, sign(x: 5))
        XCTAssertEqual(1, sign(x: 0))
        XCTAssertEqual(-1, sign(x: 9))
    }

    func sign(x: Int) -> Int{
        var sum = -1
        for i in 0...x {
            sum *= -1
            print("nth term = \(i).sum = \(sum)")
        }
        return sum
    }

}
