//
//  CChessGame.swift
//  CChess
//
//  Created by Zhijun Sheng on 2020-06-26.
//  Copyright © 2020 Gold Thumb Inc. All rights reserved.
//

import Foundation

struct CChess {
    var pieces: Set<CChessPiece> = []
    var previousPieces: Set<CChessPiece> = []
    private(set) var redTurn: Bool = true
    private(set) var lastMovedPiece: CChessPiece?
    
    var whiteKingSideRookMoved = false
    var whiteQueenSideRookMoved = false
    var whiteKingMoved = false
    
    var blackKingSideRookMoved = false
    var blackQueenSideRookMoved = false
    var blackKingMoved = false
    
    mutating func withdraw() {
        guard let lastMovedPiece = lastMovedPiece else {
            return
        }
        pieces = previousPieces
        redTurn = lastMovedPiece.isRed
        self.lastMovedPiece = nil
    }
    
    mutating func movePiece(move: Move) {
        let fromCol = move.fC
        let fromRow = move.fR
        let toCol = move.tC
        let toRow = move.tR
        
        guard let movingPiece = pieceAt(col: fromCol, row: fromRow) else {
            return
        }
        
        pieces.remove(movingPiece)
        if let targetPiece = pieceAt(col: toCol, row: toRow) {
            pieces.remove(targetPiece)
        }
        
        pieces.insert(CChessPiece(col: toCol, row: toRow, isRed: movingPiece.isRed, rank: movingPiece.rank, imageName: movingPiece.imageName))
        
        redTurn.toggle()
    }
    
    func underThreatAt(col: Int, row: Int, redEnemy: Bool) -> Bool {
        for piece in pieces where piece.isRed == redEnemy {
            if canPieceAttack(move: Move(fC: piece.col, fR: piece.row, tC: col, tR: row)) {
                return true
            }
        }
        return false
    }
    
    func isHandicap(move: Move) -> Bool {
        return lastMovedPiece == nil && !inBoard(move.tC, move.tR)
    }
    
    func isValid(mv: Move, isRed: Bool) -> Bool {
        guard let movingPiece = pieceAt(col: mv.fC, row: mv.fR) else {
            return false
        }
        
        guard inBoard(mv.tC, mv.tR), !isStandstill(move: mv) else {
            return false
        }
        
        
        
        if movingPiece.isRed != redTurn {
            return false
        }
        
        if let targetPiece = pieceAt(col: mv.tC, row: mv.tR) {
            return targetPiece.isRed != movingPiece.isRed
        }
        
        return true
    }
    
    private func kingExposedBy(protector: CChessPiece) -> Bool {
        if let king = pieces.filter({ $0.isRed == protector.isRed && $0.rank == .king }).first {
            var gameCopy = self
            gameCopy.pieces.remove(protector)
            if gameCopy.checked(isRed: king.isRed) {
                return true
            }
        }
        return false
    }
    
    private func isStandstill(move: Move) -> Bool {
        return move.fC == move.tC && move.fR == move.tR
    }
    
    func checked(isRed: Bool) -> Bool {
        if let king = pieces.filter({ $0.isRed == isRed && $0.rank == .king }).first {
            return underThreatAt(col: king.col, row: king.row, redEnemy: !isRed)
        }
        return false
    }
    
    func canRescueCheck(move: Move, isRed: Bool) -> Bool {
        guard let movingPiece = pieceAt(col: move.fC, row: move.fR), checked(isRed: isRed) else {
            return false
        }
        var gameCopy = self
        gameCopy.pieces.remove(movingPiece)
        if let target = gameCopy.pieceAt(col: move.tC, row: move.tR) {
            gameCopy.pieces.remove(target)
        }
        
        gameCopy.pieces.insert(CChessPiece(col: move.tC, row: move.tR, isRed: movingPiece.isRed, rank: movingPiece.rank, imageName: movingPiece.imageName))
        
        return !gameCopy.checked(isRed: isRed)
    }
    
    func canPieceAttack(move: Move) -> Bool {
        guard let movingPiece = pieceAt(col: move.fC, row: move.fR),
              !isStandstill(move: move) else {
            return false
        }

        switch movingPiece.rank {
        case .knight:
            return validKnight(move)
        case .rook:
            return validRook(move)
        case .bishop:
            return validBishop(move)
        case .king:
            return canKingAttack(move)
        case .pawn:
            return canPawnAttack(move)
        case .warrior:
            return true
        case .cannon:
            return true
        }
    }
    
    func validWarrior(_ move: Move) -> Bool {
        return false
    }
    
    func validCannon(_ move: Move) -> Bool {
        return false
    }
    
    private func validKnight(_ move: Move) -> Bool {
        return
            abs(move.fC - move.tC) == 1 && abs(move.fR - move.tR) == 2 ||
            abs(move.fR - move.tR) == 1 && abs(move.fC - move.tC) == 2
    }
    
    func validRook(_ move: Move) -> Bool {
        let fromCol = move.fC
        let fromRow = move.fR
        let toCol = move.tC
        let toRow = move.tR
        
        guard emptyBetween(move) else {
            return false
        }
        return fromCol == toCol || fromRow == toRow
    }
    
    func validBishop(_ move: Move) -> Bool {
        let fromCol = move.fC
        let fromRow = move.fR
        let toCol = move.tC
        let toRow = move.tR
        
        guard emptyBetween(move) else {
            return false
        }
        return abs(fromCol - toCol) == abs(fromRow - toRow)
    }
    
    func canKingMove(_ move: Move) -> Bool {
        let toCol = move.tC
        let toRow = move.tR
        
        guard !underThreatAt(col: toCol, row: toRow, redEnemy: !redTurn) else {
            return false
        }
//        if canCastle(toCol: toCol, toRow: toRow) {
//            return true
//        }
        return canKingAttack(move)
    }
    
    func canKingAttack(_ move: Move) -> Bool {
        let fromCol = move.fC
        let fromRow = move.fR
        let toCol = move.tC
        let toRow = move.tR
        
        let deltaCol = abs(fromCol - toCol)
        let deltaRow = abs(fromRow - toRow)
        return (deltaCol == 1 || deltaRow == 1) && deltaCol + deltaRow < 3
    }
    
    func emptyAndSafe(row: Int, cols: ClosedRange<Int>, redEnemy: Bool) -> Bool {
        return emptyAt(row: row, cols: cols) && safeAt(row: row, cols: cols, redEnemy: redEnemy)
    }
    
    func safeAt(row: Int, cols: ClosedRange<Int>, redEnemy: Bool) -> Bool {
        for col in cols {
            if underThreatAt(col: col, row: row, redEnemy: redEnemy) {
                return false
            }
        }
        return true
    }
    
    func emptyAt(row: Int, cols: ClosedRange<Int>) -> Bool {
        for col in cols {
            if pieceAt(col: col, row: row) != nil {
                return false
            }
        }
        return true
    }
    
    func canPawnMove(_ move: Move) -> Bool {
        let fromCol = move.fC
        let fromRow = move.fR
        let toCol = move.tC
        let toRow = move.tR
        
        guard let movingPawn = pieceAt(col: move.fC, row: move.fR) else {
            return false
        }
        
//        if let target = pieceAt(col: move.tC, row: move.tR), target.isWhite != movingPawn.isWhite {
//            return canPawnAttack(move)
//        } else if toCol == fromCol {
//            if pieceAt(col: move.fC, row: move.fR + (movingPawn.isWhite ? -1 : 1)) == nil {
//                return
//                    move.tR == fromRow + (movingPawn.isWhite ? -1 : 1) ||
//                    toRow == fromRow + (movingPawn.isWhite ? -2 : 2) &&
//                    pieceAt(col: fromCol, row: toRow) == nil &&
//                    fromRow == (movingPawn.isWhite ? 6 : 1)
//            }
//        } else if let lastMovedPiece = lastMovedPiece,
//                  lastMovedPiece.rank == .pawn,
//                  lastMovedPiece.isWhite != movingPawn.isWhite,
//                  lastMovedPiece.row == fromRow,
//                  lastMovedPiece.col == toCol,
//                  abs(toCol - fromCol) == 1 {
//            if movingPawn.isWhite {
//                return fromRow == 3 && toRow == 2
//            } else {
//                return fromRow == 4 && toRow == 5
//            }
//        }

        return false
    }
    
    func canPawnAttack(_ move: Move) -> Bool {
        let fromCol = move.fC
        let fromRow = move.fR
        let toCol = move.tC
        let toRow = move.tR
        
        guard let movingPawn = pieceAt(col: fromCol, row: fromRow) else {
            return false
        }
        return toRow == fromRow + (movingPawn.isRed ? -1 : 1) && abs(toCol - fromCol) == 1
    }
    
    func emptyBetween(_ move: Move) -> Bool {
        let fromCol = move.fC
        let fromRow = move.fR
        let toCol = move.tC
        let toRow = move.tR
        
        if fromRow == toRow { // horizontal
            let minCol = min(fromCol, toCol)
            let maxCol = max(fromCol, toCol)
            if maxCol - minCol < 2   {
                return true
            }
            for i in minCol + 1 ... maxCol - 1 {
                if pieceAt(col: i, row: fromRow) != nil {
                    return false
                }
            }
            return true
        } else if fromCol == toCol { // vertical
            let minRow = min(fromRow, toRow)
            let maxRow = max(fromRow, toRow)
            if maxRow - minRow < 2   {
                return true
            }
            for i in minRow + 1 ... maxRow - 1 {
                if pieceAt(col: fromCol, row: i) != nil {
                    return false
                }
            }
            return true
        } else if abs(fromCol - toCol) == abs(fromRow - toRow) { // diagonal
            let minCol = min(fromCol, toCol)
            let maxCol = max(fromCol, toCol)
            let minRow = min(fromRow, toRow)
            let maxRow = max(fromRow, toRow)
            
            if fromRow - toRow == fromCol - toCol { // top left to bottom right \
                if maxCol - minCol < 2   {
                    return true
                }
                for i in 1..<abs(fromCol - toCol) {
                    if pieceAt(col: minCol + i, row: minRow + i) != nil {
                        return false
                    }
                }
                return true
            } else { // bottom left to top right /
                if maxCol - minCol < 2   {
                    return true
                }
                for i in 1..<abs(fromCol - toCol) {
                    if pieceAt(col: minCol + i, row: maxRow - i) != nil {
                        return false
                    }
                }
                return true
            }
        }
        
        return false
    }
    
    func emptyBetween(from: Int, to: Int, constant: Int) -> Bool {
        let minCol = min(from, to)
        let maxCol = max(from, to)
        if maxCol - minCol < 2   {
            return true
        }
        for i in minCol + 1 ... maxCol - 1 {
            if pieceAt(col: i, row: constant) != nil {
                return false
            }
        }
        return true
    }
    
    func pieceAt(col: Int, row: Int) -> CChessPiece? {
        pieces.filter { $0.col == col && $0.row == row }.first
    }
    
    private func inBoard(_ col: Int, _ row: Int) -> Bool {
        return col >= 0 && col <= 7 && row >= 0 && row <= 7
    }
    
    mutating func initializeGame() {
        redTurn = true
        pieces.removeAll()
        for i in 0..<2 {
            pieces.insert(CChessPiece(col: 0 + i * 8, row: 0, isRed: false, rank: .rook, imageName: "bj"))
            pieces.insert(CChessPiece(col: 0 + i * 8, row: 9, isRed: true, rank: .rook, imageName: "rj"))
            
            pieces.insert(CChessPiece(col: 1 + i * 6, row: 0, isRed: false, rank: .knight, imageName: "bm"))
            pieces.insert(CChessPiece(col: 1 + i * 6, row: 9, isRed: true, rank: .knight, imageName: "rm"))
            
            pieces.insert(CChessPiece(col: 2 + i * 4, row: 0, isRed: false, rank: .bishop, imageName: "bx"))
            pieces.insert(CChessPiece(col: 2 + i * 4, row: 9, isRed: true, rank: .bishop, imageName: "rx"))

            pieces.insert(CChessPiece(col: 3 + i * 2, row: 0, isRed: false, rank: .warrior, imageName: "bs"))
            pieces.insert(CChessPiece(col: 3 + i * 2, row: 9, isRed: true, rank: .warrior, imageName: "rs"))

            pieces.insert(CChessPiece(col: 1 + i * 6, row: 2, isRed: false, rank: .cannon, imageName: "bp"))
            pieces.insert(CChessPiece(col: 1 + i * 6, row: 7, isRed: true, rank: .cannon, imageName: "rp"))
        }
        
        for i in 0..<5 {
            pieces.insert(CChessPiece(col: i * 2, row: 3, isRed: false, rank: .pawn, imageName: "bz"))
            pieces.insert(CChessPiece(col: i * 2, row: 6, isRed: true, rank: .pawn, imageName: "rz"))
        }
        
        pieces.insert(CChessPiece(col: 4, row: 0, isRed: false, rank: .king, imageName: "bb"))
        pieces.insert(CChessPiece(col: 4, row: 9, isRed: true, rank: .king, imageName: "rb"))
    }
}

extension CChess: CustomStringConvertible {
    var description: String {
        var desc = ""
        
        desc += "+ 0 1 2 3 4 5 6 7 8\n"
        for row in 0..<10 {
            desc += "\(row)"
            for col in 0..<9 {
                if let piece = pieceAt(col: col, row: row) {
                    switch piece.rank {
                    case .king:
                        desc += piece.isRed ? " k" : " K"
                    case .warrior:
                        desc += piece.isRed ? " w" : " W"
                    case .bishop:
                        desc += piece.isRed ? " b" : " B"
                    case .knight:
                        desc += piece.isRed ? " n" : " N"
                    case .rook:
                        desc += piece.isRed ? " r" : " R"
                    case .cannon:
                        desc += piece.isRed ? " c" : " C"
                    case .pawn:
                        desc += piece.isRed ? " p" : " P"
                    }
                } else {
                    desc += " ."
                }
            }
            desc += "\n"
        }
        
        return desc
    }
}
