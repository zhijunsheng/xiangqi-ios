import Foundation

struct XiangqiBoard: CustomStringConvertible {
    
    var piecesBox = Set<XiangqiBoardPiece>()
    
    func pieceAt(col: Int, row: Int) -> XiangqiBoardPiece? {
        for piece in piecesBox {
            if piece.col == col && piece.row == row {
                return piece
            }
        }
        return nil
    }
    
    func isValidMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        
        if toCol < 0 || toCol > 8
        || toRow < 0 || toRow > 9 {
            return false
        }
        
        guard let movingPiece = pieceAt(col: fromCol, row: fromRow) else {
            return false
        }
        
        if movingPiece.rank == "K" {
            return isValidHorseMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        } else if movingPiece.rank == "B" {
            return isValidElephantMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        } else if movingPiece.rank == "G" {
            return isValidGuardMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        } else if movingPiece.rank == "Q" {
            return isValidKingMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        } else if movingPiece.rank == "P" {
            return isValidSoldierMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        } else if movingPiece.rank == "R" {
            return isValidCarMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        } else if movingPiece.rank == "C" {
            return isValidCannonMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        }
        
        return true
    }
    
    func isValidGuardMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        if toCol < 3
        || toCol > 5
        || toRow < 7 && toRow > 2 {
            return false
        }
        if fromCol + 1 == toCol && fromRow + 1 == toRow
        || fromCol + 1 == toCol && fromRow - 1 == toRow
        || fromCol - 1 == toCol && fromRow + 1 == toRow
        || fromCol - 1 == toCol && fromRow - 1 == toRow
        {
            return true
        }
        return false
    }
    
    func isValidKingMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        
        let movingPiece = pieceAt(col: fromCol, row: fromRow)
        
        if movingPiece?.isRed == true {
            if toCol == 7 && toRow == 3
            || toCol == 7 && toRow == 4
            || toCol == 7 && toRow == 5
            || toCol == 8 && toRow == 3
            || toCol == 8 && toRow == 4
            || toCol == 8 && toRow == 5
            || toCol == 9 && toRow == 3
            || toCol == 9 && toRow == 4
            || toCol == 9 && toRow == 5 {
                return true
            }
        }else{
            if toCol == 2 && toRow == 3
            || toCol == 2 && toRow == 4
            || toCol == 2 && toRow == 5
            || toCol == 1 && toRow == 3
            || toCol == 1 && toRow == 4
            || toCol == 1 && toRow == 5
            || toCol == 0 && toRow == 3
            || toCol == 0 && toRow == 4
            || toCol == 0 && toRow == 5 {
                return true
            }
        }
        
        return false
        
    }
    
    func isValidElephantMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        
        let movingPiece = pieceAt(col: fromCol, row: fromRow)
    
        if movingPiece?.isRed == true {
            if toCol == 2 && toRow == 9
            || toCol == 0 && toRow == 7
            || toCol == 2 && toRow == 5
            || toCol == 4 && toRow == 7
            || toCol == 6 && toRow == 9
            || toCol == 8 && toRow == 7
            || toCol == 2 && toRow == 5 {
                return true
            }
        }else{
            if toCol == 2 && toRow == 0
            || toCol == 0 && toRow == 2
            || toCol == 2 && toRow == 4
            || toCol == 4 && toRow == 2
            || toCol == 6 && toRow == 0
            || toCol == 8 && toRow == 2
            || toCol == 2 && toRow == 4 {
                return true
            }
        }
        
        return false
        
    }
    
    
    func isValidHorseMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        
        if fromCol - 1 == toCol && fromRow - 2 == toRow // ([1]1)
        || fromCol - 2 == toCol && fromRow - 1 == toRow // ([1]2)
        || fromCol + 1 == toCol && fromRow - 2 == toRow // ([2]1)
        || fromCol + 2 == toCol && fromRow - 1 == toRow // ([2]2)
        || fromCol + 2 == toCol && fromRow + 1 == toRow // ([3]1)
        || fromCol + 1 == toCol && fromRow + 2 == toRow // ([3]2)
        || fromCol - 1 == toCol && fromRow + 2 == toRow // ([4]1)
        || fromCol - 2 == toCol && fromRow + 1 == toRow // ([4]2)
        {
            return true
        }
        return false
    }
    func isValidSoldierMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        
        guard let movingPiece = pieceAt(col: fromCol, row: fromRow) else {
            return false
        }
        if movingPiece.isRed {
            if fromRow + 1 == toRow {
                return false
            }
            if fromRow == 6
                || fromRow == 5 {
                if fromRow - 1 == toRow && fromCol == toCol {
                    return true
                }
            }else if fromRow < 5{
                if fromRow - 1 == toRow && fromCol == toCol
                    || fromCol - 1 == toCol && fromRow == toRow
                    || fromCol + 1 == toCol && fromRow == toRow {
                    return true
                }
            }
        } else {
            if fromRow - 1 == toRow {
                return false
            }
            if fromRow == 3
            || fromRow == 4 {
                if fromRow + 1 == toRow && fromCol == toCol {
                    return true
                }
            }else if fromRow > 4{
                if fromRow + 1 == toRow && fromCol == toCol
                || fromCol - 1 == toCol && fromRow == toRow
                || fromCol + 1 == toCol && fromRow == toRow {
                    return true
                }
            }
        }
        
        
        return false
    }
    mutating func move(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) {
        guard let movingPiece = pieceAt(col: fromCol, row: fromRow) else {
            return
        }
        
        if !isValidMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow) {
            return
        }
        
        let targetPiece = pieceAt(col: toCol, row: toRow)
        if targetPiece != nil {
            piecesBox.remove(targetPiece!)
        }
        
        piecesBox.remove(movingPiece)
        let newPiece = XiangqiBoardPiece(col: toCol, row: toRow, rank: movingPiece.rank, isRed: movingPiece.isRed, imageName: movingPiece.imageName)
        piecesBox.insert(newPiece)
    }
    
    func isValidCarMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        if fromCol == toCol
        || fromRow == toRow {
            return true
        }
        return false
    }
    func isValidCannonMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        return true
    }
    
    var description: String {
        var boardString : String = ""
        boardString.append("  0 1 2 3 4 5 6 7 8")
        boardString.append("\n")
        for y in 0..<10 {
            boardString.append("\(y)")
            for x in 0...8 {
                let piece = pieceAt(col: x, row: y)
                if piece == nil {
                    boardString.append(" .")
                } else {
                    switch piece!.rank {
                    case "R" : boardString.append(piece!.isRed ? " r" : " R")// rook
                    case "K" : boardString.append(piece!.isRed ? " k" : " K")// knight
                    case "B" : boardString.append(piece!.isRed ? " b" : " B")// bishop
                    case "G" : boardString.append(piece!.isRed ? " g" : " G")// guard
                    case "Q" : boardString.append(piece!.isRed ? " q" : " Q")// queen
                    case "C" : boardString.append(piece!.isRed ? " c" : " C")// cellen
                    case "P" : boardString.append(piece!.isRed ? " p" : " P")// pown
                        
                    default:
                        break
                    }
                }
            }
            boardString.append("\n")
        }
        return boardString
    }
 
}
