//
//  Board.swift
//  xiangqi
//
//  Created by Peter Shi on 2019-01-12.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//
// αβψδεφγηιξκλμνοπ;ρστθωςχυζ
// ΑΒΨΔΕΦΓΗΙΞΚΛΜΝΟΠ:ΡΣΤΘΩ΅ΧΥΣ

import Foundation

struct Board: CustomStringConvertible {
    
    static let cols = 9
    static let rows = 10
    
    var pieces: [Piece] = []
    
    func canMoveTo(piece: Piece, destCol: Int, destRow: Int) -> Bool {
        if piece.row == destRow && piece.col == destCol {
            return false
        }
        switch piece.rank {
        case "j":
            return canMove车(startCol: piece.col, startRow: piece.row, destCol: destCol, destRow: destRow)
        case "m":
            return canMove马(startCol: piece.col, startRow: piece.row, destCol: destCol, destRow: destRow)
        case "x":
            return canMove相(startCol: piece.col, startRow: piece.row, destCol: destCol, destRow: destRow)
        case "s":
            return canMove士(startCol: piece.col, startRow: piece.row, destCol: destCol, destRow: destRow)
        case "b":
            return canMove将(startCol: piece.col, startRow: piece.row, destCol: destCol, destRow: destRow)
        case "p":
            return canMove炮(startCol: piece.col, startRow: piece.row, destCol: destCol, destRow: destRow)
        case "z":
            return canMove卒(startCol: piece.col, startRow: piece.row, destCol: destCol, destRow: destRow)
        default:
            return false
        }
    }
    
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
            if startCol + 1 == destCol || startCol - 1 == destCol {
                return true
            }
            
            let start = min(startCol, destCol) + 1
            let end = max(startCol, destCol) - 1
            
            for i in start...end {
                if pieceAt(col: i, row: startRow) != nil {
                    return false
                }
            }
            return true
        } else if startCol == destCol {
            if abs(startRow - destRow) == 1 {
                return true
            }

            let start = min(startRow, destRow) + 1
            let end = max(startRow, destRow) - 1
            
            for i in start ... end {
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
        if isInPalace(row: destRow, col: destCol) && (abs(startRow - destRow) == 1 && abs(startCol - destCol) == 1) {
            return true
        }
        return false
    }
    
    func canMove将(startCol: Int, startRow: Int, destCol: Int, destRow: Int) -> Bool {
        if isInPalace(row: destRow, col: destCol) && (abs(startRow - destRow) == 1 && startCol == destCol || abs(startCol - destCol) == 1 && startRow == destRow) {
            return true
        }
        return false
    }
    
    func canMove卒(startCol: Int, startRow: Int, destCol: Int, destRow: Int) -> Bool {
        guard let candidate = pieceAt(col: startCol, row: startRow) else {
            return false
        }
        if !candidate.isRed {
            if startRow <= 4 && (startRow - destRow == -1 && startCol == destCol) {
                return true
            } else if startRow >= 5 && (startRow - destRow == -1 || abs(startCol - destCol) == 1) {
                return true
            }
        } else {
            if startRow >= 5 && (startRow - destRow == 1 && startCol == destCol) {
                return true
            } else if startRow <= 4 && (startRow - destRow == 1 || abs(startCol - destCol) == 1) {
                return true
            }
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
    
    func isInPalace(row: Int, col: Int) -> Bool {
        if (row == 0 || row == 1 || row == 7 || row == 8) && (col == 3 || col == 4 || col == 5) {
            return true
        }
        return false
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
    //
    
    func numberOfPiecesBetween(startCol: Int, startRow: Int, destCol: Int, destRow: Int) -> Int {
        guard startCol == destCol || startRow == destRow else {
            return 0
        }
        var smaller: Int
        var larger: Int
        if startRow == destRow {
            smaller = min(startCol, destCol)
            larger = max(startCol, destCol)
        } else {
            smaller = min(startRow, destRow)
            larger = max(startRow, destRow)
        }
        
        return numberOfPiecesBetween(smaller: smaller, larger: larger, alongCol: startCol == destCol, indexOfColOrRow: startCol == destCol ? startCol : startRow)
    }
    
    func numberOfPiecesBetween(smaller: Int, larger: Int, alongCol: Bool, indexOfColOrRow: Int) -> Int {
        var pieces = 0
        if larger - smaller <= 1 {
            return 0
        }
        
        for i in smaller + 1...larger - 1 {
            if pieceAt(col: alongCol ? indexOfColOrRow : i, row: alongCol ? i : indexOfColOrRow) != nil {
                pieces += 1
            }
        }
        return pieces
    }
}
