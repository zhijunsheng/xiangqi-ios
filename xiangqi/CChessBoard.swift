//
//  CChessBoard.swift
//  xiangqi
//
//  Created by Grace Huang on 5/28/20.
//  Copyright © 2020 GoldThumb Inc. All rights reserved.
//

import Foundation


struct CChessBoard: CustomStringConvertible {
    var pieceBox: Set<CChessPiece> = Set<CChessPiece>()
    
    
    func pieceAt(col: Int, row: Int) -> CChessPiece? {
        for piece in pieceBox {
            if col == piece.col && row == piece.row {
                return piece
            }
        }
        return nil
    }
    
    var description: String {
       
        var desc: String = ""
        desc += "  "
        
        for i in 0..<9 {
            desc += "\(i) "
        }
        
        desc += "\n"
        
        for row in 0..<10 {
            desc += "\(row) "
            for col in 0..<9 {
                let piece = pieceAt(col: col, row: row)
                
                if piece == nil {
                    desc += ". "
                } else {
                    if piece?.pieceType == .King {
                        desc += piece?.isBlack == true ? "K " : "k "
                    } else if piece?.pieceType == .Warrior {
                        desc += piece?.isBlack == true ? "W " : "w "
                    } else if piece?.pieceType == .Bishop {
                        desc += piece?.isBlack == true ? "B " : "b "
                    } else if piece?.pieceType == .Knight {
                        desc += piece?.isBlack == true ? "N " : "n "
                    } else if piece?.pieceType == .Rook {
                        desc += piece?.isBlack == true ? "R " : "r "
                    } else if piece?.pieceType == .Cannon {
                        desc += piece?.isBlack == true ? "C " : "c "
                    } else if piece?.pieceType == .Pawn {
                        desc += piece?.isBlack == true ? "P " : "p "
                    }
                }
            }
            desc += "\n"
        }
        return desc
    }
    
   
}


