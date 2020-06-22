//
//  CChessGame.swift
//  xiangqi
//
//  Created by Felix Lo on 2020/6/10.
//  Copyright © 2020 GoldThumb Inc. All rights reserved.
//

import Foundation

struct CChessGame: CustomStringConvertible {
    
    var pieces: Set<CChessPiece> = Set<CChessPiece>()
    
    mutating func resetGame() {
        for i in 0 ..< 2 {
            pieces.insert(CChessPiece(isBlack: true, rank: .rook, col: i * 8, row: 0, imageName: "bj.png"))
            pieces.insert(CChessPiece(isBlack: false, rank: .rook, col: i * 8, row: 9, imageName: "rj.png"))
            pieces.insert(CChessPiece(isBlack: true, rank: .knight, col: i * 6 + 1, row: 0, imageName: "bm.png"))
            pieces.insert(CChessPiece(isBlack: false, rank: .knight, col: i * 6 + 1, row: 9, imageName: "rm.png"))

        }
        pieces.insert(CChessPiece(isBlack: true, rank: .bishop, col: 2, row: 0, imageName: "bx.png"))
        pieces.insert(CChessPiece(isBlack: true, rank: .guardian, col: 3, row: 0, imageName: "bs.png"))
        pieces.insert(CChessPiece(isBlack: true, rank: .king, col: 4, row: 0, imageName: "bb.png"))
        pieces.insert(CChessPiece(isBlack: true, rank: .guardian, col: 5, row: 0, imageName: "bs.png"))
        pieces.insert(CChessPiece(isBlack: true, rank: .bishop, col: 6, row: 0, imageName: "bx.png"))

        pieces.insert(CChessPiece(isBlack: true, rank: .cannon, col: 1, row: 2, imageName: "bp.png"))
        pieces.insert(CChessPiece(isBlack: true, rank: .cannon, col: 7, row: 2, imageName: "bp.png"))
        
        for i in 0 ..< 5 {
            pieces.insert(CChessPiece(isBlack: true, rank: .pawn, col: i * 2, row: 3, imageName: "bz.png"))
            pieces.insert(CChessPiece(isBlack: false, rank: .pawn, col: i * 2, row: 6, imageName: "rz.png"))
        }
        
                pieces.insert(CChessPiece(isBlack: false, rank: .bishop, col: 2, row: 9, imageName: "rx.png"))
        pieces.insert(CChessPiece(isBlack: false, rank: .guardian, col: 3, row: 9, imageName: "rs.png"))
        pieces.insert(CChessPiece(isBlack: false, rank: .king, col: 4, row: 9, imageName: "rb.png"))
        pieces.insert(CChessPiece(isBlack: false, rank: .guardian, col: 5, row: 9, imageName: "rs.png"))
        pieces.insert(CChessPiece(isBlack: false, rank: .bishop, col: 6, row: 9, imageName: "rx.png"))
        pieces.insert(CChessPiece(isBlack: false, rank: .cannon, col: 1, row: 7, imageName: "rp.png"))
        pieces.insert(CChessPiece(isBlack: false, rank: .cannon, col: 7, row: 7, imageName: "rp.png"))
    }
    
    func pieceAt(col: Int, row: Int) -> CChessPiece? {
        for piece in pieces {
            if piece.col == col && piece.row == row{
                return piece
            }
        }
        return nil
    }
    
    var description: String {
        var desc = "  "
        
        
        for i in 0 ..< 9 {
            desc = desc + " \(i)"
        }
        for row in 0 ..< 10 {
            desc = desc + "\n"
            desc = desc + " \(row)"
            for col in 0 ..< 9 {
                if let piece = pieceAt(col: col, row: row) {
                    if piece.rank == .pawn {
                        desc += piece.isBlack ? " P" : " p"
                    } else if piece.rank == .knight {
                        desc += piece.isBlack ? " N" : " n"
                    } 
                    
                } else {
                    desc += " ."
                }
                
            }
        }
        
        return desc
    }
    
    
}




