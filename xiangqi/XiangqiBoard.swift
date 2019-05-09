//
//  XiangqiBoard.swift
//  xiangqi
//
//  Created by Halwong on 2019/5/3.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import Foundation

struct XiangqiBoard: CustomStringConvertible {
    
    var pieces: Set<XiangqiPiece> = Set<XiangqiPiece>()
    
    mutating func initializeBoard() {
        for i in 0 ..< 2 {
            pieces.insert(XiangqiPiece(rank: .rook, isRed: true, col: i * 8, row: 0))
            pieces.insert(XiangqiPiece(rank: .rook, isRed: false, col: i * 8, row: 9))
            
            pieces.insert(XiangqiPiece(rank: .knight, isRed: true, col: 1 + i * 6, row: 0))
            pieces.insert(XiangqiPiece(rank: .knight, isRed: false, col: 1 + i * 6, row: 9))
            
            pieces.insert(XiangqiPiece(rank: .bishop, isRed: true, col: 2 + i * 4, row: 0))
            pieces.insert(XiangqiPiece(rank: .bishop, isRed: false, col: 2 + i * 4, row: 9))
            
            pieces.insert(XiangqiPiece(rank: .warrior, isRed: true, col: 3 + i * 2, row: 0))
            pieces.insert(XiangqiPiece(rank: .warrior, isRed: false, col: 3 + i * 2, row: 9))
            
            pieces.insert(XiangqiPiece(rank: .cannon, isRed: true, col: 1 + i * 6, row: 2))
            pieces.insert(XiangqiPiece(rank: .cannon, isRed: false, col: 1 + i * 6, row: 7))
        }
        
        pieces.insert(XiangqiPiece(rank: .king, isRed: true, col: 4, row: 0))
        pieces.insert(XiangqiPiece(rank: .warrior, isRed: false, col: 4, row: 9))
        
        for i in 0 ..< 5 {
            pieces.insert(XiangqiPiece(rank: .pawn, isRed: true, col: i * 2, row: 3))
            pieces.insert(XiangqiPiece(rank: .pawn, isRed: false, col: i * 2, row: 6))
        }
    }
    
    var description: String {
        var brdStr = ""
        
        brdStr += " "
        for b in 0 ..< 9 {
            brdStr += " \(b)"
        }
        brdStr += "\n"
        
        for a in 0 ..< 10 {
            brdStr += "\(a)"
            for i in 0 ..< 9 {
                let piece = pieceAt(col: i, row: a)
                if piece == nil {
                    brdStr += " ."
                } else {
                    if piece!.rank == .rook {
                        brdStr += piece!.isRed ? " R" : " r"
                    } else if piece!.rank == .knight {
                        brdStr += piece!.isRed ? " N" : " n"
                    } else if piece!.rank == .bishop {
                        brdStr += piece!.isRed ? " B" : " b"
                    } else if piece!.rank == .warrior {
                        brdStr += piece!.isRed ? " W" : " w"
                    } else if piece!.rank == .king {
                        brdStr += piece!.isRed ? " K" : " k"
                    } else if piece!.rank == .cannon {
                        brdStr += piece!.isRed ? " C" : " c"
                    } else if piece!.rank == .pawn {
                        brdStr += piece!.isRed ? " P" : " p"
                    }
                }
            }
            brdStr += "\n"
        }
        
        return brdStr
    }
    
    func pieceAt(col: Int, row: Int) -> XiangqiPiece? {
        for piece in pieces {
            if piece.col == col && piece.row == row {
                return piece
            }
        }
        
        return nil
    }
}
