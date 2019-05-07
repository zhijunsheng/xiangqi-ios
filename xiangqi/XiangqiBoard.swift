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
    /*
     红 = k
     黑 = K
     r n b g k g b n r
     . . . . . . . . .
     . c . . . . . c .
     p . p . p . p . p
     . . . . . . . . .
     . . . . . . . . .
     P . P . P . P . P
     . C . . . . . C .
     . . . . . . . . .
     R N B G K G B N R
     
       0 1 2 3 4 5 6 7 8
     0 . . . . . . . . .
     1 . . . . . . . . .
     2 . . . . . . . . .
     3 . . . . . . . . .
     4 . . . . . . . . .
     5 . . . . . . . . .
     6 . . . . . . . . .
     7 . . . . . . . . .
     8 . . . . . . . . .
     9 . . . . . . . . .
     
     
     */
    var description: String { // "\n"
        var boardString : String = ""
        boardString.append("  0 1 2 3 4 5 6 7 8")
        boardString.append("\n")
        for y in 0..<10 {
            boardString.append("\(y)")
            for x in 1...9 {
                let piece = pieceAt(col: x, row: y)
                
                boardString.append(" .")
                
            }
            boardString.append("\n")
        }

        return boardString
    }
    
    
}
