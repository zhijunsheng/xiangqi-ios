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
    
    mutating func move(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) {
        guard let movingPiece = pieceAt(col: fromCol, row: fromRow) else {
            return
        }
        
        piecesBox.remove(movingPiece)
        let newPiece = XiangqiBoardPiece(col: toCol, row: toRow, rank: movingPiece.rank, isRed: movingPiece.isRed)
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
                    case "R" : boardString.append(piece!.isRed ? " r" : " R")
                    case "K" : boardString.append(piece!.isRed ? " k" : " K")
                    case "B" : boardString.append(piece!.isRed ? " b" : " B")
                    case "G" : boardString.append(piece!.isRed ? " g" : " G")
                    case "Q" : boardString.append(piece!.isRed ? " q" : " G")
                    case "C" : boardString.append(piece!.isRed ? " c" : " C")
                    case "P" : boardString.append(piece!.isRed ? " r" : " P")
                        
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

