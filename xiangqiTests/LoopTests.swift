//
//  LoopTests.swift
//  xiangqiTests
//
//  Created by Peter Shi on 2018-04-13.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import XCTest

class LoopTests: XCTestCase {

    
    func testNumberOfMultipleOfThree() {
        numberOfMultipleOfThree()
    }
    
    func numberOfMultipleOfThree() {
        
        var result = 0
        
        for x in 1...10{
            if x % 3 == 0 {
                print("result is \(result)")
                result = result + 1
            }
        }
        
        print(":-) :-( result is \(result)")
        
    }
    
    
    
    
    
    
    
    
    func testPrintEvenInts() {
        
        printEvenInts(x: 100)
        
    }
    
    func printEvenInts(x: Int) {
        
        for i in 1...x {
            if i % 2 == 0 {
                print("\(i) is an even number")
            }
        }
    }
    
    
    
    
    
    
    func testForLoop() {
        
        
        print("helloworld")
    
        for i in 1...7 {
            print("i is \(i)")
        }
    
    
    
    }
    
}
