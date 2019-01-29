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
    // . p. . . . . . . .
    // . . . . . . . . .
    // Z . Z . Z . Z . Z
    // . P . . . . . P .
    // . . . . . . . . .
    // J M X S B S X M J
    
    // Θ Σ Δ Ω
    
    // pieces
    // we need each piece inside pieces
    
    var description: String {
        var boardDesc = ""
        for i in 0..<Board.rows {
            for j in 0..<Board.cols {
                if let piece = pieceAt(col: j, row: i) {
                    if piece.rank == "j" {
                        boardDesc.append(piece.isRed ? "J " : "j ")
                    } else if piece.rank == "m" {
                        boardDesc.append(piece.isRed ? "M " : "m ")
                    } else if piece.rank == "x" {
                        boardDesc.append(piece.isRed ? "X " : "x ")
                    } else if piece.rank == "s" {
                        boardDesc.append(piece.isRed ? "S " : "s ")
                    } else if piece.rank == "b" {
                        boardDesc.append(piece.isRed ? "B " : "b ")
                    } else if piece.rank == "p" {
                        boardDesc.append(piece.isRed ? "P " : "p ")
                    } else if piece.rank == "z" {
                        boardDesc.append(piece.isRed ? "Z " : "z ")
                    }
                } else {
                    boardDesc.append(". ")
                }
            }
            boardDesc.append("\n")
        }
        return boardDesc
    }
    
    func pieceAt(col: Int, row: Int) -> Piece? {
        for piece in pieces {
            if piece.col == col && piece.row == row {
                return piece
            }
        }
        return nil
    }
}
