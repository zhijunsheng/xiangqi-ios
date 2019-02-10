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
    
    func move车(startCol: Int, startRow: Int, destCol: Int, destRow: Int) -> Bool {
        if startRow == destRow {
            for i in startCol + 1...destCol - 1 {
                if pieceAt(col: i, row: startRow) != nil {
                    return false
                }
            }
            return true
        } else if startCol == destCol {
            for i in startRow + 1...destRow - 1 {
                if pieceAt(col: startCol, row: i) != nil {
                    return false
                }
            }
            return true
        }
        return false
    }
    
    func move马(startCol: Int, startRow: Int, destCol: Int, destRow: Int) -> Bool {
        if abs(startRow - destRow) == 2 && abs(startCol - destCol) == 1 || abs(startRow - destRow) == 1 && abs(startCol - destCol) == 2 {
            for i in startCol + 1...destCol - 1 {
                if pieceAt(col: i, row: startRow) != nil {
                    return false
                }
            }
            return true
        }
        return false
    }
    func move相(startCol: Int, startRow: Int, destCol: Int, destRow: Int) -> Bool {
        if abs(startRow - destRow) == 2 && abs(startCol - destCol) == 2 {
            return true
        }
        return false
    }
    func move士(startCol: Int, startRow: Int, destCol: Int, destRow: Int) -> Bool {
        if destRow == 3 || destRow == 4 || destRow == 5 && destCol == 0 || destCol == 1 || destCol == 2 ||  destCol == 7 || destCol == 8 || destCol == 9 && abs(startRow - destRow) == 1 && abs(startCol - destCol) == 1 {
            return true
        }
        return false
    }
    func move将(startCol: Int, startRow: Int, destCol: Int, destRow: Int) -> Bool {
        if abs(startRow - destRow) == 1 || abs(startCol - destCol) == 1 {
            return true
        }
        return false
    }
    func move卒(startCol: Int, startRow: Int, destCol: Int, destRow: Int) -> Bool {
        if startRow - destRow == 1 || abs(startCol - destCol) == 1 {
            return true
        }
        return false
    }
    func move炮(startCol: Int, startRow: Int, destCol: Int, destRow: Int) -> Bool {
        if startRow == destRow {
            for i in startCol + 1...destCol - 1 {
                if pieceAt(col: i, row: startRow) != nil && pieceAt(col: i, row: startRow) != nil {
                    return false
                }
            }
            return true
        } else if startCol == destCol {
            for i in startRow + 1...destRow - 1 {
                if pieceAt(col: startCol, row: startRow + 1) != nil && pieceAt(col: i, row: startRow) != nil {
                    return true
                } else if pieceAt(col: startCol, row: i) != nil {
                    return false
                }
                break
            }
            return true
        }
        return false
    }
    
    // *
    //       *
    //  ___________
    // |_|_|_|_|_|_|
    // |_|_|_|_|_|_|
    // |_|_|_|_|_|_|
    // |_|_|_|_|_|_|
    // |_|_|_|_|_|_|
    // |_|_|_|_|_|_|
    // |_|_|_|_|_|_|
    //
    // *_____0______*
    // |_|_|_|_|_|_|
    // |_|_|_|_|_|_|
    // |_|_|_|_|_|_|
    // 0_|_|_|_|_|_|
    // |_|_|_|_|_|_|
    // |_|_|_|_|_|_|
    // |_|_|_|_|_|_|
    // *
    func numberOfPiecesBetween(startCol: Int, startRow: Int, destCol: Int, destRow: Int) -> Int {
        var pieces = 0
        if startCol != destCol && startRow == destRow {
            for i in startCol + 1...destCol - 1 {
                if pieceAt(col: i, row: startRow) != nil {
                    pieces += 1
                }
            }
        } else if startCol == destCol && startRow != destRow {
            for i in startRow + 1...destRow - 1 {
                if pieceAt(col: startCol, row: i) != nil {
                    pieces += 1
                }
            }
        }
        return pieces
    }
}
