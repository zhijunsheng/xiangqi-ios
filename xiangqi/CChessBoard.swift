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
    
    mutating func movePiece(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) {
        let piece = pieceAt(col: fromCol, row: fromRow)
        
        if piece == nil {
            return
        } 
        
        pieceBox.insert(CChessPiece(imgName: piece!.imgName, col: toCol, row: toRow, isBlack: piece!.isBlack, pieceType: piece!.pieceType))
        pieceBox.remove(piece!)
    }
    
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
                if let piece = pieceAt(col: col, row: row) {
                    switch piece.pieceType {
                    case .King :
                        desc += piece.isBlack ? "K " : "k "
                    case .Rook :
                        desc += piece.isBlack ? "R " : "r "
                    case .Bishop :
                        desc += piece.isBlack ? "B " : "b "
                    case .Warrior :
                        desc += piece.isBlack ? "W " : "w "
                    case .Knight :
                        desc += piece.isBlack ? "N " : "n "
                    case .Pawn :
                        desc += piece.isBlack ? "P " : "p "
                    case .Cannon :
                        desc += piece.isBlack ? "C " : "c "
                    }
                } else {
                    desc += ". "
                }
            }
            desc += "\n"
        }
        return desc
    }
}


