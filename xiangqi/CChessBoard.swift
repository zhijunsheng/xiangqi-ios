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
                    if piece?.isBlack == true {
            
                        if piece?.pieceType == "B" {
                            desc += "B "
                        } else if piece?.pieceType == "S" {
                            desc += "S "
                        } else if piece?.pieceType == "X" {
                            desc += "X "
                        } else if piece?.pieceType == "M" {
                            desc += "M "
                        } else if piece?.pieceType == "J" {
                            desc += "J "
                        } else if piece?.pieceType == "P" {
                            desc += "S "
                        } else if piece?.pieceType == "Z" {
                            desc += "Z "
                        }
                    } else {
                        if piece?.pieceType == "B" {
                            desc += "b "
                        } else if piece?.pieceType == "S" {
                            desc += "s "
                        } else if piece?.pieceType == "X" {
                            desc += "x "
                        } else if piece?.pieceType == "M" {
                            desc += "m "
                        } else if piece?.pieceType == "J" {
                            desc += "j "
                        } else if piece?.pieceType == "P" {
                            desc += "s "
                        } else if piece?.pieceType == "Z" {
                            desc += "z "
                        }
                    }
                    
                }
            }
            
            desc += "\n"
        }
        return desc
    }
    
   
}


