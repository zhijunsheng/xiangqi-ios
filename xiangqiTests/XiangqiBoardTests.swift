//
//  XiangqiBoardTests.swift
//  xiangqiTests
//
//  Created by ethan on 2019/9/19.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import XCTest
@testable import xiangqi

class XiangqiBoardTests: XCTestCase {

    /*
    
     r: red
     b: black
     
     r: rook 车（城堡）
     n: knight 马（骑士）
     b: bishop 象（大主教）
     w: warrior 士（勇士）rb
     k: king 将（国王）
     c: cannon 炮（加农炮）
     p: pawn 卒（小兵）
     
     rr rn rb rw rk rw rb rn rr
     .  .  .  .  .  .  .  .  .
     .  rc .  .  .  .  .  rc .
     rp .  rp .  rp .  rp .  rp
     .  .  .  .  .  .  .  .  .
     .  .  .  .  .  .  .  .  .
     bp .  bp .  bp .  bp .  bp
     .  bc .  .  .  .  .  bc .
     .  .  .  .  .  .  .  .  .
     br bn bb bw bk bw bb bn br
     
     1=p
     2=c
     3=r
     4=n
     5=b
     6=w
     7=k
     
     r3 r4 r5 r6 r7 r6 r5 r4 r3
     .  .  .  .  .  .  .  .  .
     .  r2 .  .  .  .  .  r2 .
     r1 .  r1 .  r1 .  r1 .  r1
     .  .  .  .  .  .  .  .  .
     .  .  .  .  .  .  .  .  .
     b1 .  b1 .  b1 .  b1 .  b1
     .  b2 .  .  .  .  .  b2 .
     .  .  .  .  .  .  .  .  .
     b3 b4 b5 b6 b7 b6 b5 b4 b3
     
     R N B W K W B N R
     . . . . . . . . .
     . C . . . . . C .
     P . P . P . P . P
     . . . . . . . . .
     . . . . . . . . .
     p . p . p . p . p
     . c . . . . . c .
     . . . . . . . . .
     r n b w k w b n r
     
     . . . . . . . . .
     . . . . . . . . .
     . . . . . . . . .
     . . . . . . . . .
     . . . . . . . . .
     . . . . . . . . .
     . . . . . . . . .
     . . . . . . . . .
     . . . . . . . . .
     . . . . . . . . .
     
     
      
    */
    func testExample() {
        
        let board = XiangqiBoard()
        print(board)
    }

}
