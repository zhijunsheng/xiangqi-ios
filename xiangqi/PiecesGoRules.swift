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
                    case .rook:     bodStrg.append(piece!.isRed ? "r " : "R ")
                    case .knight:   bodStrg.append(piece!.isRed ? "h " : "H ")
                    case .bishop:   bodStrg.append(piece!.isRed ? "b " : "B ")
                    case .warrior:  bodStrg.append(piece!.isRed ? "w " : "W ")
                    case .king:     bodStrg.append(piece!.isRed ? "k " : "K ")
                    case .cannon:   bodStrg.append(piece!.isRed ? "c " : "C ")
                    case .pawn:     bodStrg.append(piece!.isRed ? "p " : "P ")
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

