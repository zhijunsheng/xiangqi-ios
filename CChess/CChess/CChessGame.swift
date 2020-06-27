//
//  CChessGame.swift
//  CChess
//
//  Created by Zhijun Sheng on 2020-06-26.
//  Copyright © 2020 Gold Thumb Inc. All rights reserved.
//

import Foundation
import Combine

class CChessGame: ObservableObject {
    @Published var pieces: Set<CChessPiece> = []
    
    init() {
        for i in 0..<2 {
            pieces.insert(CChessPiece(col: 0 + i * 8, row: 0, imageName: "bj"))
            pieces.insert(CChessPiece(col: 0 + i * 8, row: 9, imageName: "rj"))
            
            pieces.insert(CChessPiece(col: 1 + i * 6, row: 0, imageName: "bm"))
            pieces.insert(CChessPiece(col: 1 + i * 6, row: 9, imageName: "rm"))
            
            pieces.insert(CChessPiece(col: 2 + i * 4, row: 0, imageName: "bx"))
            pieces.insert(CChessPiece(col: 2 + i * 4, row: 9, imageName: "rx"))

            pieces.insert(CChessPiece(col: 3 + i * 2, row: 0, imageName: "bs"))
            pieces.insert(CChessPiece(col: 3 + i * 2, row: 9, imageName: "rs"))

            pieces.insert(CChessPiece(col: 1 + i * 6, row: 2, imageName: "bp"))
            pieces.insert(CChessPiece(col: 1 + i * 6, row: 7, imageName: "rp"))
        }
        
        for i in 0..<5 {
            pieces.insert(CChessPiece(col: i * 2, row: 3, imageName: "bz"))
            pieces.insert(CChessPiece(col: i * 2, row: 5, imageName: "rz"))
        }
        
        pieces.insert(CChessPiece(col: 4, row: 0, imageName: "bb"))
        pieces.insert(CChessPiece(col: 4, row: 9, imageName: "rb"))
    }
    
    init(pieces: Set<CChessPiece> = []) {
        self.pieces = pieces
    }
    
    func pieceAt(col: Int, row: Int) -> CChessPiece? {
        pieces.filter { $0.col == col && $0.row == row }.first
    }
    
    func movePiece(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) {
        guard let movingPiece = pieceAt(col: fromCol, row: fromRow) else {
            return
        }
        
        pieces.remove(movingPiece)
        if let targetPiece = pieceAt(col: toCol, row: toRow) {
            pieces.remove(targetPiece)
        }
        
        pieces.insert(CChessPiece(col: toCol, row: toRow, imageName: movingPiece.imageName))
    }
}
