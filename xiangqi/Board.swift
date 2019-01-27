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
    
    // pieces
    
    var description: String {
        var boardDesc = ""
        for i in 0..<Board.rows {
            for j in 0..<Board.cols {
                if i == 0 {
                    if j == 0 || j == 8 {
                        boardDesc.append("j ")
                    } else if j == 1 || j == 7 {
                        boardDesc.append("m ")
                    } else if j == 2 || j == 6 {
                        boardDesc.append("x ")
                    } else if j == 3 || j == 5 {
                        boardDesc.append("s ")
                    } else if j == 4 {
                        boardDesc.append("b ")
                    }
                }
                
                
                
                if i == 2 {
                    if j == 1 || j == 7 {
                        boardDesc.append("p ")
                    } else {
                        boardDesc.append(". ")
                    }
                }
                if i == 3 {
                    if j % 2 == 0 {
                        boardDesc.append("z ")
                    } else {
                        boardDesc.append(". ")
                    }
                }
                
                if i == 9 {
                    if j == 0 || j == 8 {
                        boardDesc.append("J ")
                    } else if j == 1 || j == 7 {
                        boardDesc.append("M ")
                    } else if j == 2 || j == 6 {
                        boardDesc.append("X ")
                    } else if j == 3 || j == 5 {
                        boardDesc.append("S ")
                    } else if j == 4 {
                        boardDesc.append("B ")
                    }
                }
                
                if i == 7 {
                    if j == 1 || j == 7 {
                        boardDesc.append("P ")
                    } else {
                        boardDesc.append(". ")
                    }
                }
                if i == 6 {
                    if j % 2 == 0 {
                        boardDesc.append("Z ")
                    } else {
                        boardDesc.append(". ")
                    }
                }
                
                if i == 1 || i == 4 || i == 5 || i == 8 {
                    boardDesc.append(". ")
                }
            }
            boardDesc.append("\n")
        }
        return boardDesc
    }
}
