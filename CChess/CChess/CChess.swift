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
    var redsTurn = true
    
    mutating func initializeGame() {
        redsTurn = true
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
    
    func pieceAt(col: Int, row: Int) -> CChessPiece? {
        pieces.filter { $0.col == col && $0.row == row }.first
    }
    
    func canMovePiece(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        if toCol < 0 || toCol > 8 || toRow < 0 || toRow > 9 {
            return false
        }
        
        guard let movingPiece = pieceAt(col: fromCol, row: fromRow) else {
            return false
        }
        
        if movingPiece.isRed != redsTurn {
            return false
        }
        
        if let targetPiece = pieceAt(col: toCol, row: toRow) {
            return targetPiece.isRed != movingPiece.isRed
        }
        
        return true
    }
    
    mutating func movePiece(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) {
        guard let movingPiece = pieceAt(col: fromCol, row: fromRow) else {
            return
        }
        
        pieces.remove(movingPiece)
        if let targetPiece = pieceAt(col: toCol, row: toRow) {
            pieces.remove(targetPiece)
        }
        
        pieces.insert(CChessPiece(col: toCol, row: toRow, isRed: movingPiece.isRed, rank: movingPiece.rank, imageName: movingPiece.imageName))
        
        redsTurn.toggle()
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
