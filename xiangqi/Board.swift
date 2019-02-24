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
    
    mutating func movePiece(startCol: Int, startRow: Int, destCol: Int, destRow: Int) {
        guard let indexOfCandidate = indexOfPieceAt(col: startCol, row: startRow) else {
            return
        }
        let indexOfTarget = indexOfPieceAt(col: destCol, row: destRow)
        var candidate = pieces[indexOfCandidate]
        if candidate.rank == "j" && canMove车(startCol: startCol, startRow: startRow, destCol: destCol, destRow: destRow) {
            if indexOfTarget != nil {
                pieces.remove(at: indexOfTarget!)
            }
            candidate.col = destCol
            candidate.row = destRow
            pieces.remove(at: indexOfCandidate)
            pieces.append(candidate)
        } else if candidate.rank == "m" && canMove马(startCol: startCol, startRow: startRow, destCol: destCol, destRow: destRow) {
            if indexOfTarget != nil {
                pieces.remove(at: indexOfTarget!)
            }
            candidate.col = destCol
            candidate.row = destRow
            pieces.remove(at: indexOfCandidate)
            pieces.append(candidate)
        } else if candidate.rank == "x" && canMove相(startCol: startCol, startRow: startRow, destCol: destCol, destRow: destRow) {
            if indexOfTarget != nil {
                pieces.remove(at: indexOfTarget!)
            }
            candidate.col = destCol
            candidate.row = destRow
            pieces.remove(at: indexOfCandidate)
            pieces.append(candidate)
        } else if candidate.rank == "s" && canMove士(startCol: startCol, startRow: startRow, destCol: destCol, destRow: destRow) {
            if indexOfTarget != nil {
                pieces.remove(at: indexOfTarget!)
            }
            candidate.col = destCol
            candidate.row = destRow
            pieces.remove(at: indexOfCandidate)
            pieces.append(candidate)
        } else if candidate.rank == "b" && canMove将(startCol: startCol, startRow: startRow, destCol: destCol, destRow: destRow) {
            if indexOfTarget != nil {
                pieces.remove(at: indexOfTarget!)
            }
            candidate.col = destCol
            candidate.row = destRow
            pieces.remove(at: indexOfCandidate)
            pieces.append(candidate)
        } else if candidate.rank == "p" && canMove炮(startCol: startCol, startRow: startRow, destCol: destCol, destRow: destRow) {
            if indexOfTarget != nil {
                pieces.remove(at: indexOfTarget!)
            }
            candidate.col = destCol
            candidate.row = destRow
            pieces.remove(at: indexOfCandidate)
            pieces.append(candidate)
        } else if candidate.rank == "z" && canMove卒(startCol: startCol, startRow: startRow, destCol: destCol, destRow: destRow) {
            if indexOfTarget != nil {
                pieces.remove(at: indexOfTarget!)
            }
            candidate.col = destCol
            candidate.row = destRow
            pieces.remove(at: indexOfCandidate)
            pieces.append(candidate)
        }
    }
    
    func indexOfPieceAt(col: Int, row: Int) -> Int? {
        guard pieceAt(col: col, row: row) != nil else {
            return nil
        }
        for i in 0..<pieces.count {
            if col == pieces[i].col && row == pieces[i].row {
                return i
            }
        }
        return nil
    }
    
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
    
    func canMove车(startCol: Int, startRow: Int, destCol: Int, destRow: Int) -> Bool {
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
    
    func canMove马(startCol: Int, startRow: Int, destCol: Int, destRow: Int) -> Bool {
        if abs(startRow - destRow) == 2 && abs(startCol - destCol) == 1 || abs(startRow - destRow) == 1 && abs(startCol - destCol) == 2 {
            if startCol + 1 < destCol - 1 {
                for i in startCol + 1...destCol - 1 {
                    if pieceAt(col: i, row: startRow) != nil {
                        return false
                    }
                }
            }
            return true
        }
        return false
    }
    
    func canMove相(startCol: Int, startRow: Int, destCol: Int, destRow: Int) -> Bool {
        if abs(startRow - destRow) == 2 && abs(startCol - destCol) == 2 {
            return true
        }
        return false
    }
    
    func canMove士(startCol: Int, startRow: Int, destCol: Int, destRow: Int) -> Bool {
        if ((destCol == 3 || destCol == 4 || destCol == 5) && (destRow == 0 || destRow == 1 || destRow == 2 ||  destRow == 7 || destRow == 8 || destRow == 9)) && abs(startRow - destRow) == 1 && abs(startCol - destCol) == 1 {
            return true
        }
        return false
    }
    
    func canMove将(startCol: Int, startRow: Int, destCol: Int, destRow: Int) -> Bool {
        if abs(startRow - destRow) == 1 || abs(startCol - destCol) == 1 {
            return true
        }
        return false
    }
    
    func canMove卒(startCol: Int, startRow: Int, destCol: Int, destRow: Int) -> Bool {
        if startRow - destRow == 1 || abs(startCol - destCol) == 1 {
            return true
        }
        return false
    }
    
    func canMove炮(startCol: Int, startRow: Int, destCol: Int, destRow: Int) -> Bool {
        guard let cannon = pieceAt(col: startCol, row: startRow) else {
            return false
        }
        
        let destinationPiece = pieceAt(col: destCol, row: destRow)
        
        if destinationPiece == nil {
            return canMove车(startCol: startCol, startRow: startRow, destCol: destCol, destRow: destRow)
        } else {
            if destinationPiece!.isRed == cannon.isRed {
                return false
            }
            
            if numberOfPiecesBetween(startCol: startCol, startRow: startRow, destCol: destCol, destRow: destRow) > 1 {
                return false
            }
            return true
        }
    }
    
    // *
    //       *
    //  _______________
    // |_|_|_|\|/|_|_|_|`
    // |_|_|_|/|\|_|_|_|`
    // |_|_|_|_|_|_|_|_|`
    // |_|_|_|_|_|_|_|_|`
    // |this is a river|`
    // |_|_|_|_|_|_|_|_|`
    // |_|_|_|_|_|_|_|_|`
    // |_|_|_|\|/|_|_|_|`
    // |_|_|_|/|\|_|_|_|`
    //  `````````````````
    // *_____0_____*
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
