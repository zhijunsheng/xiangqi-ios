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
        pieces = Set<XiangqiPiece>()
        
        for i in 0 ..< 2 {
            pieces.insert(XiangqiPiece(rank: .rook, isRed: true, col: i * 8, row: 0, imgName: "rj"))
            pieces.insert(XiangqiPiece(rank: .rook, isRed: false, col: i * 8, row: 9, imgName: "bj"))
            
            pieces.insert(XiangqiPiece(rank: .knight, isRed: true, col: 1 + i * 6, row: 0, imgName: "rm"))
            pieces.insert(XiangqiPiece(rank: .knight, isRed: false, col: 1 + i * 6, row: 9, imgName: "bm"))
            
            pieces.insert(XiangqiPiece(rank: .bishop, isRed: true, col: 2 + i * 4, row: 0, imgName: "rx"))
            pieces.insert(XiangqiPiece(rank: .bishop, isRed: false, col: 2 + i * 4, row: 9, imgName: "bx"))
            
            pieces.insert(XiangqiPiece(rank: .warrior, isRed: true, col: 3 + i * 2, row: 0, imgName: "rs"))
            pieces.insert(XiangqiPiece(rank: .warrior, isRed: false, col: 3 + i * 2, row: 9, imgName: "bs"))
            
            pieces.insert(XiangqiPiece(rank: .cannon, isRed: true, col: 1 + i * 6, row: 2, imgName: "rp"))
            pieces.insert(XiangqiPiece(rank: .cannon, isRed: false, col: 1 + i * 6, row: 7, imgName: "bp"))
        }
        
        pieces.insert(XiangqiPiece(rank: .king, isRed: true, col: 4, row: 0, imgName: "rb"))
        pieces.insert(XiangqiPiece(rank: .king, isRed: false, col: 4, row: 9, imgName: "bb"))
        
        for i in 0 ..< 5 {
            pieces.insert(XiangqiPiece(rank: .pawn, isRed: true, col: i * 2, row: 3, imgName: "rz"))
            pieces.insert(XiangqiPiece(rank: .pawn, isRed: false, col: i * 2, row: 6, imgName: "bz"))
        }
    }
    
    mutating func movePiece(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) {
        print(numberOfPiecesBetween(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow))
        
        if !isValidMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow) {
            return
        }
        
        guard let piece = pieceAt(col: fromCol, row: fromRow) else {
            return
        }
        
        if let destinationPiece = pieceAt(col: toCol, row: toRow) {
            pieces.remove(destinationPiece)
        }
        
        pieces.remove(piece)
        pieces.insert(XiangqiPiece(rank: piece.rank, isRed: piece.isRed, col: toCol, row: toRow, imgName: piece.imgName))
    }
    
    func isValidMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        
        guard let movingPiece = pieceAt(col: fromCol, row: fromRow) else {
            return false
        }

        if stepOwnPiece(movingPiece: movingPiece, col: toCol, row: toRow) {
            return false
        }
        
        if movingPiece.rank == .rook {
            return isValidRookMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        } else if movingPiece.rank == .knight {
            return isValidKnightMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        } else if movingPiece.rank == .bishop {
            return isValidBishopMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        } else if movingPiece.rank == .king {
            return isValidKingMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        } else if movingPiece.rank == .warrior {
            return isValidWarriorMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        } else if movingPiece.rank == .pawn {
            return isValidPawnMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        } else if movingPiece.rank == .cannon {
            return isValidCannonMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        }
        
        return false
    }
    
    func stepOwnPiece(movingPiece: XiangqiPiece, col: Int, row: Int) -> Bool {
        return movingPiece.isRed == pieceAt(col: col, row: row)?.isRed
    }
    
    func isValidRookMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        return (toRow == fromRow || toCol == fromCol) && numberOfPiecesBetween(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow) == 0
    }
    
    // func thereIsOnePieceBetween(..) -> Bool  x
    
    // func numberOfPiecesBetween(..) -> Int  √ ÷ ∆ (Opt + J)
    
    func isValidCannonMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        let numberOfPieces = numberOfPiecesBetween(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        if numberOfPieces > 1 {
            return false
        }
        if numberOfPieces == 0 {
            return isValidRookMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow) && pieceAt(col: toCol, row: toRow) == nil
        }
        
        guard let toPiece = pieceAt(col: toCol, row: toRow), let fromPiece = pieceAt(col: fromCol, row: fromRow) else {
            return false
        }
        
        return toPiece.isRed != fromPiece.isRed
    }
    
    func numberOfPiecesBetween(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Int {
        var number = 0
        if fromCol < toCol && fromRow == toRow {
            for i in fromCol + 1 ..< toCol {
                if pieceAt(col: i, row: fromRow) != nil {
                    number = number + 1
                }
            }
        } else if fromCol > toCol && fromRow == toRow {
            for i in toCol + 1 ..< fromCol {
                if pieceAt(col: i, row: fromRow) != nil {
                    number = number + 1
                }
            }
        } else if fromRow < toRow && fromCol == toCol {
            for i in fromRow + 1 ..< toRow {
                if pieceAt(col: fromCol, row: i) != nil {
                    number = number + 1
                }
            }
        } else if fromRow > toRow && fromCol == toCol {
            for i in toRow + 1 ..< fromRow {
                if pieceAt(col: fromCol, row: i) != nil {
                    number = number + 1
                }
            }
        }
        return number
    }
    
    func isValidKnightMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        if abs(toCol - fromCol) == 1 && abs(toRow - fromRow) == 2 {
            return pieceAt(col: fromCol, row: (fromRow + toRow) / 2) == nil
        } else if abs(toCol - fromCol) == 2 && abs(toRow - fromRow) == 1 {
            return pieceAt(col: (fromCol + toCol) / 2, row: fromRow) == nil
        }
        return false
    }
    
    func isValidBishopMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        guard let movingPiece = pieceAt(col: fromCol, row: fromRow) else {
            return false
        }
        let noBlocker = pieceAt(col: (toCol + fromCol) / 2, row: (toRow + fromRow) / 2) == nil
        let diagonalStep = abs(toCol - fromCol) == 2 && abs(toRow - fromRow) == 2
        return isInHome(row: toRow, isRed: movingPiece.isRed) && diagonalStep && noBlocker
    }
    
    func isValidKingMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        return isInPalace(col: toCol, row: toRow) && (abs(toCol - fromCol) == 1 && toRow == fromRow || abs(toRow - fromRow) == 1 && toCol == fromCol)
    }
    
    func isValidWarriorMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        return isInPalace(col: toCol, row: toRow) && abs(toCol - fromCol) == 1 && abs(toRow - fromRow) == 1
    }
    
    func isValidPawnMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        if pieceAt(col: fromCol, row: fromRow)!.isRed && fromRow < 5 && fromCol == toCol && toRow - fromRow == 1 || !pieceAt(col: fromCol, row: fromRow)!.isRed && fromRow > 4 && fromRow - toRow == 1 && fromCol == toCol {
            return true
        } else if (pieceAt(col: fromCol, row: fromRow)!.isRed && fromRow >= 5 && (abs(toCol - fromCol) == 1 && toRow == fromRow || toRow - fromRow == 1 || toRow == fromRow && toCol == fromCol)) || !pieceAt(col: fromCol, row: fromRow)!.isRed && fromRow <= 4 && (abs(toCol - fromCol) == 1 && toRow == fromRow || fromRow - toRow == 1 || toRow == fromRow && toCol == fromCol) {
            return true
        }
        return false
    }
    
    private func isInPalace(col: Int, row: Int) -> Bool {
        let isInRedPalace = col >= 3 && col <= 5 && row >= 0 && row <= 2
        let isInBlackPalace = col >= 3 && col <= 5 && row >= 7 && row <= 9
        return isInRedPalace || isInBlackPalace
    }
    
    private func isInHome(row: Int, isRed: Bool) -> Bool {
        return isRed && row < 5 || !isRed && row > 4
    }
    
    var description: String {
        var brdStr = ""
        
        brdStr += "+"
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
