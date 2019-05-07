import Foundation

struct PiecesGoRules: CustomStringConvertible {
    
    var piecesSet = Set<XiangqiPiece>()
    
    /*
     
       0 1 2 3 4 5 6 7 8
     0 r . . . . . . . .
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
    var description: String {
        var bodStrg = ""
        
        for j in 0..<10 {
            bodStrg.append("\n")
            for i in 0..<9 {
                let piece = pieceAt(x: i, y: j)
                if piece == nil {
                    bodStrg.append(". ")
                } else {
                    switch piece!.rnk{
                    case .rook:
                        bodStrg.append("r ")
                    case .knight:
                        bodStrg.append("k ")
                    case .bishop:
                        bodStrg.append("b ")
                    case .warrior:
                        bodStrg.append("w ")
                    case .king:
                        bodStrg.append("👑 ")
                    case .cannon:
                        bodStrg.append("c ")
                    case .pawn:
                        bodStrg.append("p ")
                    }
                }
            }
        }
        
        return "\(bodStrg)"
    }
    
    func pieceAt(x: Int, y: Int) -> XiangqiPiece? {
        for piece in piecesSet {
            if piece.x == x && piece.y == y {
                return piece
            }
        }
        
        return nil
    }
}

