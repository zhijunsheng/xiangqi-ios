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
    private(set) var whoseTurn: Player = .red
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
        whoseTurn = lastMovedPiece.player
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
        
        pieces.insert(CChessPiece(col: toCol, row: toRow, player: movingPiece.player, rank: movingPiece.rank, imageName: movingPiece.imageName))
        
        whoseTurn = whoseTurn == .red ? .black : .red
    }
    
    func canSeeEnemyKingFrom(col: Int, row: Int, player: Player) -> Bool {
        guard let enemyKing = kingOf(player: player.enemy) else {
            return false
        }
        return enemyKing.col == col &&
            numPiecesBetween(Move(enemyKing.col, enemyKing.row, col, row)) == 0
    }
    
    private func kingOf(player: Player) -> CChessPiece? {
        return pieces.filter{ $0.rank == .king && $0.player == player }.first
    }
    
    func underThreatAt(col: Int, row: Int, enemy: Player) -> Bool {
        for piece in pieces where piece.player == enemy {
            if canPieceAttack(mv: Move(fC: piece.col, fR: piece.row, tC: col, tR: row)) {
                return true
            }
        }
        return false
    }
    
    func isHandicap(move: Move) -> Bool {
        return lastMovedPiece == nil && !inBoard(move.tC, move.tR)
    }
    
    func isValid(mv: Move, player: Player) -> Bool {
        guard let movingPiece = pieceAt(col: mv.fC, row: mv.fR) else {
            return false
        }
        
        guard inBoard(mv.tC, mv.tR), !isStandstill(move: mv) else {
            return false
        }
        
        if let target = pieceAt(col: mv.tC, row: mv.tR), target.player == movingPiece.player  {
            return false
        }
        
        switch movingPiece.rank {
        case .knight where !validKnight(mv):
            return false
        case .rook where !validRook(mv):
            return false
        case .bishop where !validBishop(mv):
            return false
        case .king where !canKingMove(mv):
            return false
        case .pawn where !validPawn(mv):
            return false
        case .warrior where !validWarrior(mv):
            return false
        case .cannon where !validCannon(mv):
            return false
        default:
            break
        }
        
        if canRescueCheck(move: mv, player: player) {
            return true
        }

        if kingExposedBy(protector: movingPiece) {
            return false
        }
        
        return true
    }
    
    private func kingExposedBy(protector: CChessPiece) -> Bool {
        if let king = pieces.filter({ $0.player == protector.player && $0.rank == .king }).first {
            var gameCopy = self
            gameCopy.pieces.remove(protector)
            if gameCopy.checked(player: king.player) {
                return true
            }
        }
        return false
    }
    
    private func isStandstill(move: Move) -> Bool {
        return move.fC == move.tC && move.fR == move.tR
    }
    
    func checked(player: Player) -> Bool {
        if let king = pieces.filter({ $0.player == player && $0.rank == .king }).first {
            return underThreatAt(col: king.col, row: king.row, enemy: player.enemy)
        }
        return false
    }
    
    func canRescueCheck(move: Move, player: Player) -> Bool {
        guard let movingPiece = pieceAt(col: move.fC, row: move.fR), checked(player: player) else {
            return false
        }
        var gameCopy = self
        gameCopy.pieces.remove(movingPiece)
        if let target = gameCopy.pieceAt(col: move.tC, row: move.tR) {
            gameCopy.pieces.remove(target)
        }
        
        gameCopy.pieces.insert(CChessPiece(col: move.tC, row: move.tR, player: movingPiece.player, rank: movingPiece.rank, imageName: movingPiece.imageName))
        
        return !gameCopy.checked(player: player)
    }
    
    func canPieceAttack(mv: Move) -> Bool {
        guard let movingPiece = pieceAt(col: mv.fC, row: mv.fR),
              !isStandstill(move: mv) else {
            return false
        }

        switch movingPiece.rank {
        case .knight:
            return validKnight(mv)
        case .rook:
            return validRook(mv)
        case .bishop:
            return validBishop(mv)
        case .king:
            return canKingAttack(mv)
        case .pawn:
            return validPawn(mv)
        case .warrior:
            return validWarrior(mv)
        case .cannon:
            return validCannon(mv)
        }
    }
    
    func validWarrior(_ mv: Move) -> Bool {
        guard let movingPiece = pieceAt(col: mv.fC, row: mv.fR),
              !outOfPalace(col: mv.tC, row: mv.tR, player: movingPiece.player) else {
            return false
        }
        
        return isDiagonal(mv) && steps(mv) == 1
    }
    
    func validCannon(_ mv: Move) -> Bool {
        if pieceAt(col: mv.tC, row: mv.tR) == nil {
            return validRook(mv)
        }
        return numPiecesBetween(mv) == 1;
    }
    
    private func validKnight(_ mv: Move) -> Bool {
        if abs(mv.fC - mv.tC) == 1 && abs(mv.fR - mv.tR) == 2 {
            return pieceAt(col: mv.fC, row: (mv.fR + mv.tR)/2) == nil
        } else if abs(mv.fR - mv.tR) == 1 && abs(mv.fC - mv.tC) == 2 {
            return pieceAt(col: (mv.fC + mv.tC)/2, row: mv.fR) == nil
        }
        return false
    }
    
    func validRook(_ mv: Move) -> Bool {
        guard emptyBetween(mv) else {
            return false
        }
        return isStraight(mv)
    }
    
    func validBishop(_ mv: Move) -> Bool {
        guard let movingPiece = pieceAt(col: mv.fC, row: mv.fR),
              selfSide(row: mv.tR, player: movingPiece.player),
              emptyBetween(mv) else {
            return false
        }
        return isDiagonal(mv) && steps(mv) == 2
    }
    
    func canKingAttack(_ mv: Move) -> Bool {
        guard let movingPiece = pieceAt(col: mv.fC, row: mv.fR),
              !outOfPalace(col: mv.tC, row: mv.tR, player: movingPiece.player) else {
            return false
        }
        return isStraight(mv) && steps(mv) == 1
    }
    
    func canKingMove(_ mv: Move) -> Bool {
        guard !canSeeEnemyKingFrom(col: mv.tC, row: mv.tR, player: whoseTurn),
              !underThreatAt(col: mv.tC, row: mv.tR, enemy: whoseTurn.enemy) else {
            return false
        }
        return canKingAttack(mv)
    }
    
    func emptyAndSafe(row: Int, cols: ClosedRange<Int>, enemy: Player) -> Bool {
        return emptyAt(row: row, cols: cols) && safeAt(row: row, cols: cols, enemy: enemy)
    }
    
    func safeAt(row: Int, cols: ClosedRange<Int>, enemy: Player) -> Bool {
        for col in cols {
            if underThreatAt(col: col, row: row, enemy: enemy) {
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
    
    func validPawn(_ mv: Move) -> Bool {
        guard let movingPiece = pieceAt(col: mv.fC, row: mv.fR),
              steps(mv) == 1,
              isStraight(mv) else {
            return false
        }
        
        if selfSide(row: mv.fR, player: movingPiece.player) {
            return mv.tR - mv.fR == (movingPiece.player == .red ? -1 : 1)
        } else {
            return mv.tR - mv.fR != (movingPiece.player == .red ? 1 : -1)
        }
    }
    
    private func numPiecesBetween(_ mv: Move) -> Int {
        if !isStraight(mv) || steps(mv) < 2 {
            return 0;
        }
        var cnt = 0
        var head: Int
        var tail: Int
        if mv.fC == mv.tC { // vertical
            head = min(mv.fR, mv.tR)
            tail = max(mv.fR, mv.tR)
            for row in head + 1 ..< tail {
                cnt += pieceAt(col: mv.fC, row: row) == nil ? 0 : 1
            }
        } else {
            head = min(mv.fC, mv.tC)
            tail = max(mv.fC, mv.tC)
            for col in head + 1 ..< tail {
                cnt += pieceAt(col: col, row: mv.fR) == nil ? 0 : 1
            }
        }
        return cnt
    }
    
    private func isStraight(_ mv: Move) -> Bool {
        return mv.fC == mv.tC || mv.fR == mv.tR
    }
    
    private func isDiagonal(_ mv: Move) -> Bool {
        return abs(mv.fC - mv.tC) == abs(mv.fR - mv.tR)
    }
    
    private func outOfPalace(col: Int, row: Int, player: Player) -> Bool {
        switch player {
        case .red:
            return col < 3 || col > 5 || row < 7 || row > 9
        case .black:
            return col < 3 || col > 5 || row < 0 || row > 2
        }
    }
    
    private func selfSide(row: Int, player: Player) -> Bool {
        switch player {
        case .red:
            return row >= 5
        case .black:
            return row <= 4
        }
    }
    
    private func steps(_ mv: Move) -> Int {
        if mv.fC == mv.tC {
            return abs(mv.fR - mv.tR)
        } else if mv.fR == mv.tR {
            return abs(mv.fC - mv.tC)
        } else if isDiagonal(mv) {
            return abs(mv.fR - mv.tR)
        }
        return 0; // neither straight nor diagonal
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
        return col >= 0 && col <= 8 && row >= 0 && row <= 9
    }
    
    mutating func initializeGame() {
        whoseTurn = .red
        pieces.removeAll()
        for i in 0..<2 {
            pieces.insert(CChessPiece(col: 0 + i * 8, row: 0, player: .black, rank: .rook, imageName: "bj"))
            pieces.insert(CChessPiece(col: 0 + i * 8, row: 9, player: .red, rank: .rook, imageName: "rj"))
            
            pieces.insert(CChessPiece(col: 1 + i * 6, row: 0, player: .black, rank: .knight, imageName: "bm"))
            pieces.insert(CChessPiece(col: 1 + i * 6, row: 9, player: .red, rank: .knight, imageName: "rm"))
            
            pieces.insert(CChessPiece(col: 2 + i * 4, row: 0, player: .black, rank: .bishop, imageName: "bx"))
            pieces.insert(CChessPiece(col: 2 + i * 4, row: 9, player: .red, rank: .bishop, imageName: "rx"))

            pieces.insert(CChessPiece(col: 3 + i * 2, row: 0, player: .black, rank: .warrior, imageName: "bs"))
            pieces.insert(CChessPiece(col: 3 + i * 2, row: 9, player: .red, rank: .warrior, imageName: "rs"))

            pieces.insert(CChessPiece(col: 1 + i * 6, row: 2, player: .black, rank: .cannon, imageName: "bp"))
            pieces.insert(CChessPiece(col: 1 + i * 6, row: 7, player: .red, rank: .cannon, imageName: "rp"))
        }
        
        for i in 0..<5 {
            pieces.insert(CChessPiece(col: i * 2, row: 3, player: .black, rank: .pawn, imageName: "bz"))
            pieces.insert(CChessPiece(col: i * 2, row: 6, player: .red, rank: .pawn, imageName: "rz"))
        }
        
        pieces.insert(CChessPiece(col: 4, row: 0, player: .black, rank: .king, imageName: "bb"))
        pieces.insert(CChessPiece(col: 4, row: 9, player: .red, rank: .king, imageName: "rb"))
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
                        desc += piece.player == .red ? " k" : " K"
                    case .warrior:
                        desc += piece.player == .red ? " w" : " W"
                    case .bishop:
                        desc += piece.player == .red ? " b" : " B"
                    case .knight:
                        desc += piece.player == .red ? " n" : " N"
                    case .rook:
                        desc += piece.player == .red ? " r" : " R"
                    case .cannon:
                        desc += piece.player == .red ? " c" : " C"
                    case .pawn:
                        desc += piece.player == .red ? " p" : " P"
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
