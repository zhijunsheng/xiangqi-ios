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
                    if piece?.pieceType == "B" {
                        desc += piece?.isBlack == true ? "B " : "b "
                    } else if piece?.pieceType == "S" {
                        desc += piece?.isBlack == true ? "S " : "s "
                    } else if piece?.pieceType == "X" {
                        desc += piece?.isBlack == true ? "X " : "x "
                    } else if piece?.pieceType == "M" {
                        desc += piece?.isBlack == true ? "M " : "m "
                    } else if piece?.pieceType == "J" {
                        desc += piece?.isBlack == true ? "J " : "j "
                    } else if piece?.pieceType == "P" {
                        desc += piece?.isBlack == true ? "P " : "p "
                    } else if piece?.pieceType == "Z" {
                        desc += piece?.isBlack == true ? "Z " : "z "
                    }
                }
            }
            desc += "\n"
        }
        return desc
    }
    
   
}


