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
        pieces.insert(CChessPiece(isBlack: false, rank: .rook, col: 0, row: 0, imageName: "bj.png"))
        pieces.insert(CChessPiece(isBlack: false, rank: .knight, col: 1, row: 0, imageName: "bm.png"))
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
//                        if piece .isBlack {
//                            desc += piece.isBlack ? " N" : " n"
//                        } else if piece.rank == .bishop {
//                            desc += piece.isBlack ? " B" : " b"
//                        } else if piece.rank == .cannon {
//                            desc += piece.isBlack ? " C" : " c"
//                        }
                    }
                    
                        } else {
                            desc += " ."
                        }
                
            }
        }
        
        return desc
    }
    
    
}




