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
       0 1 2 3 4 5 6 7 8
     0 r n b g q g b n r
     1 . . . . . . . . .
     2 . c . . . . . c .
     3 p . p . p . p . p
     4 . . . . . . . . .
     5 . . . . . . . . .
     6 P . P . P . P . P
     7 . C . . . . . C .
     8 . . . . . . . . .
     9 R N B G Q G B N R
     
     
     */
    var description: String { // "\n"
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
                    if piece!.rank == "R" {
//                        if piece!.isRed {
//                            boardString.append(" r")
//                        }else{
//                            boardString.append(" R")
//                        }
                        boardString.append(piece!.isRed ? " r" : " R")
                    } else if piece!.rank == "K" {
                        boardString.append(piece!.isRed ? " k" : " K")
                    } else if piece!.rank == "B" {
                        boardString.append(piece!.isRed ? " b" : " B")
                    } else if piece!.rank == "G" {
                        boardString.append(piece!.isRed ? " g" : " G")
                    } else if piece!.rank == "Q" {
                        boardString.append(piece!.isRed ? " q" : " Q")
                    } else if piece!.rank == "C" {
                        boardString.append(piece!.isRed ? " c" : " C")
                    } else if piece!.rank == "P" {
                        boardString.append(piece!.isRed ? " p" : " P")
                    }
                }
                
            }
            boardString.append("\n")
        }

        return boardString
    }
    
    
}
/*  if piece?.rank == "R" {
 boardString.append(" r")
 } else if piece?.rank == "K" {
 boardString.append(" k")
 } else if piece?.rank == "B" {
 boardString.append(" b")
 } else if piece?.rank == "G" {
 boardString.append(" g")
 } else if piece?.rank == "Q" {
 boardString.append(" q")
 } else if piece?.rank == "C" {
 boardString.append(" c")
 } else if piece?.rank == "P" {
 boardString.append(" p")
 }
 */
