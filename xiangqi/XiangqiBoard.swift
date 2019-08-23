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
        guard let movingPiece = pieceAt(col: fromCol, row: fromRow) else {
            return false
        }
        if movingPiece.rank == "K" {
            return isValidKnightMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        }else if movingPiece.rank == "B" {
            return isValidBishopMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        }
        
        return false
    }
    
    func isValidGuardMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        
        if toCol < 3
        || toCol > 5
        || toRow > 2
        {
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
        
        if toCol < 3
        || toCol > 5
        || toRow > 2
        {
            return false
        }
        if fromRow + 1 == toRow && fromCol == toCol
        || fromCol - 1 == toCol && fromRow == toRow
        || fromRow - 1 == toRow && fromCol == toCol
        || fromCol + 1 == toCol && fromCol == toCol
        {
            return true
        }
        return false
    }
    
    func isValidBishopMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        
        if fromRow > 4
        {
            return false
        }
        if fromCol - 2 == toCol && fromRow - 2 == toRow
        || fromCol - 2 == toCol && fromRow + 2 == toRow
        || fromCol + 2 == toCol && fromRow - 2 == toRow
        || fromCol + 2 == toCol && fromRow + 2 == toRow
        {
            return true
        }
        return false
    }
    
    func isValidKnightMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        
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
    func isValidPawnMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        
        if toRow <= 4 {
            if toRow == 0
                || toRow == 1
                || toRow == 2
            {
                return false
            }
            if fromRow + 1 == toRow && fromCol == toCol
            {
                return true
            }
        }else if toRow >= 5
        {
            if fromRow + 1 == toRow && fromCol == toCol
                || fromCol - 1 == toCol && fromRow == toRow
                || fromCol + 1 == toCol && fromCol == toCol
            {
                return true
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
        
        piecesBox.remove(movingPiece)
        let newPiece = XiangqiBoardPiece(col: toCol, row: toRow, rank: movingPiece.rank, isRed: movingPiece.isRed, imageName: movingPiece.imageName)
        piecesBox.insert(newPiece)
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
