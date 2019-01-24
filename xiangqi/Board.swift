//
//  Board.swift
//  xiangqi
//
//  Created by Peter Shi on 2019-01-12.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import Foundation

struct Board: CustomStringConvertible {
    
    static let cols = 9
    static let rows = 10
    
    var pieces: [Piece] = []
    
    // j m x s b s x m j
    // . . . . . . . . .
    // . p . . . . . p .
    // z . z . z . z . z
    // . . . . . . . . .
    // . . . . . . . . .
    // Z . Z . Z . Z . Z
    // . P . . . . . P .
    // . . . . . . . . .
    // J M X S B S X M J
    
    // Θ Σ Δ Ω
    
    var description: String {
        var boardDesc = ""
        for _ in 0..<Board.rows {
            for _ in 0..<Board.cols {
                boardDesc.append(". ")
            }
            boardDesc.append("\n")
        }
        
        return boardDesc
    }
    
    
}
