import Foundation

struct PiecesGoRules: CustomStringConvertible {
    
    static let xs: Int = 9
    static let ys: Int = 10
    
    var piecesSet = Set<XiangqiPiece>()
    
    mutating func piecesRoom() {
        for i in 0..<2 {
            piecesSet.insert(XiangqiPiece(x: i * 8 + 0, y: 0, rnk: Rank.rook, isRed: true, imgNm: "rj"))
            piecesSet.insert(XiangqiPiece(x: i * 6 + 1, y: 0, rnk: Rank.knight, isRed: true, imgNm: "rm"))
            piecesSet.insert(XiangqiPiece(x: i * 4 + 2, y: 0, rnk: Rank.bishop, isRed: true, imgNm: "rx"))
            piecesSet.insert(XiangqiPiece(x: i * 2 + 3, y: 0, rnk: Rank.warrior, isRed: true, imgNm: "rs"))
            piecesSet.insert(XiangqiPiece(x: i * 6 + 1, y: 2, rnk: Rank.cannon, isRed: true, imgNm: "rp"))

            piecesSet.insert(XiangqiPiece(x: i * 8 + 0, y: 9, rnk: Rank.rook, isRed: false, imgNm: "bj"))
            piecesSet.insert(XiangqiPiece(x: i * 6 + 1, y: 9, rnk: Rank.knight, isRed: false, imgNm: "bm"))
            piecesSet.insert(XiangqiPiece(x: i * 4 + 2, y: 9, rnk: Rank.bishop, isRed: false, imgNm: "bx"))
            piecesSet.insert(XiangqiPiece(x: i * 2 + 3, y: 9, rnk: Rank.warrior, isRed: false, imgNm: "bs"))
            piecesSet.insert(XiangqiPiece(x: i * 6 + 1, y: 7, rnk: Rank.cannon, isRed: false, imgNm: "bp"))
        }

        for i in 0..<5 {
            piecesSet.insert(XiangqiPiece(x: i * 2, y: 6, rnk: Rank.pawn, isRed: false, imgNm: "bz"))
            piecesSet.insert(XiangqiPiece(x: i * 2, y: 3, rnk: Rank.pawn, isRed: true, imgNm: "rz"))
        }

        piecesSet.insert(XiangqiPiece(x: 4, y: 0, rnk: Rank.king, isRed: true, imgNm: "rb"))
        piecesSet.insert(XiangqiPiece(x: 4, y: 9, rnk: Rank.king, isRed: false, imgNm: "bb"))
    }
    
    mutating func eatPiece(x: Int, y: Int) {
        for piece in piecesSet {
            if piece.x == x && piece.y == y {
                piecesSet.remove(piece)
                break
            }
        }
    }
    
    mutating func pieceGoes(frX: Int, frY: Int, toX: Int, toY: Int) {
        guard let movingPiece = pieceAt(x: frX, y: frY) else {
            return
        }
        
        if !isValidPieceMove(frX: frX, frY: frY, toX: toX, toY: toY) {
            return
        }
        
        eatPiece(x: toX, y: toY)

        piecesSet.remove(movingPiece)
        let newPiece = XiangqiPiece(x: toX, y: toY, rnk: movingPiece.rnk, isRed: movingPiece.isRed, imgNm: movingPiece.imgNm)
        piecesSet.insert(newPiece)
    }
    
    func isValidPieceMove(frX: Int, frY: Int, toX: Int, toY: Int) -> Bool {
        if toX >= PiecesGoRules.xs || toY >= PiecesGoRules.ys {
            return false
        }
        
        if toX < 0 || toY < 0 {
            return false
        }
        
        guard let movingPiece = pieceAt(x: frX, y: frY) else {
            return false
        }
        
        let targetPiece = pieceAt(x: toX, y: toY)
        
        if targetPiece != nil && targetPiece!.isRed == movingPiece.isRed {
            return false
        }
        
        switch movingPiece.rnk {
        case .rook:
            return isValidRookMove(frX: frX, frY: frY, toX: toX, toY: toY)
        case .knight:
            return isValidKnightMove(frX: frX, frY: frY, toX: toX, toY: toY)
        case .bishop:
            return isValidBishopMove(frX: frX, frY: frY, toX: toX, toY: toY)
        case .warrior:
            return isValidWarriorMove(frX: frX, frY: frY, toX: toX, toY: toY)
        case .king:
            return isValidKingMove(frX: frX, frY: frY, toX: toX, toY: toY)
        case .cannon:
            return isValidCannonMove(frX: frX, frY: frY, toX: toX, toY: toY)
        case .pawn:
            return isValidPawnMove(frX: frX, frY: frY, toX: toX, toY: toY)
        }
    }
    
    func isValidRookMove(frX: Int, frY: Int, toX: Int, toY: Int) -> Bool {
        
        return frX == toX && frY != toY || frY == toY && frX != toX
    }
    
    func numberOfPiecesBetween(frX: Int, frY: Int, toX: Int, toY: Int) -> Int {
        var noPieces = 0
        
        if frX == toX && frY != toY  { // |
            if toY > frY { // going ⬇️
                if frY + 1 <= toY - 1 {
                    for y in frY + 1 ... toY - 1 {
                        if pieceAt(x: frX, y: y) != nil {
                            noPieces += 1
                        }
                    }
                }
            } else { // going ⬆️
                if toY + 1 <= frY - 1 {
                    for y in toY + 1 ... frY - 1 {
                        if pieceAt(x: frX, y: y) != nil {
                            noPieces += 1
                        }
                    }
                }
            }
        } else if frY == toY && frX != toX { // -
            if toX > frX { // going ⬇️
                if frX + 1 <= toX - 1 {
                    for x in frX + 1 ... toX - 1 {
                        if pieceAt(x: x, y: frY) != nil {
                            noPieces += 1
                        }
                    }
                }
            } else { // going ⬆️
                if toX + 1 <= frX - 1 {
                    for x in toX + 1 ... frX - 1 {
                        if pieceAt(x: x, y: frY) != nil {
                            noPieces += 1
                        }
                    }
                }
            }
        }
        
        return noPieces
    }
    
    func isValidKnightMove(frX: Int, frY: Int, toX: Int, toY: Int) -> Bool {
        if toX == frX + 2 && toY == frY + 1 ||
            toX == frX + 2 && toY == frY - 1 {
            if pieceAt(x: frX + 1, y: frY) != nil {
                return false
            }
        }
        
        if toX == frX + 1 && toY == frY + 2 ||
            toX == frX - 1 && toY == frY + 2 {
            if pieceAt(x: frX, y: frY + 1) != nil {
                return false
            }
        }
        
        if toX == frX - 1 && toY == frY - 2 ||
            toX == frX + 1 && toY == frY - 2 {
            if pieceAt(x: frX, y: frY - 1) != nil {
                return false
            }
        }
        
        if toX == frX - 2 && toY == frY - 1 ||
            toX == frX - 2 && toY == frY + 1 {
            if pieceAt(x: frX + 1, y: frY) != nil {
                return false
            }
        }

        return toX == frX + 2 && toY == frY + 1 ||
            toX == frX + 1 && toY == frY + 2 ||
            toX == frX - 2 && toY == frY - 1 ||
            toX == frX - 1 && toY == frY - 2 ||
            toX == frX + 2 && toY == frY - 1 ||
            toX == frX + 1 && toY == frY - 2 ||
            toX == frX - 2 && toY == frY + 1 ||
            toX == frX - 1 && toY == frY + 2

    }
    
    // |2| = 2
    // |-2| = -(-2) = 2
    // --------------+-2---5---8---->
    // | x - 5 | = 3
    // if x - 5 == 3 || 5 - x == 3
    // abs: absolute
    // abs(x - 5)
    
    // (11 + 15) / 2 = 13; 15, 19 => 17
    func isValidBishopMove(frX: Int, frY: Int, toX: Int, toY: Int) -> Bool {
        let mX = (frX + toX) / 2
        let mY = (frY + toY) / 2
        
        if pieceAt(x: mX, y: mY) != nil {
            return false
        }
        
        return toX == frX + 2 && toY == frY + 2 ||
            toX == frX + 2 && toY == frY - 2 ||
            toX == frX - 2 && toY == frY + 2 ||
            toX == frX - 2 && toY == frY - 2
    }
    
    func isValidWarriorMove(frX: Int, frY: Int, toX: Int, toY: Int) -> Bool {
        
        if toX < 3 || toX > 5 || toY > 2 && toY < 7 {
            return false
        }
        
        return toX == frX + 1 && toY == frY + 1 ||
            toX == frX + 1 && toY == frY - 1 ||
            toX == frX - 1 && toY == frY + 1 ||
            toX == frX - 1 && toY == frY - 1
    }
    
    func isValidKingMove(frX: Int, frY: Int, toX: Int, toY: Int) -> Bool {
        if toX < 3 || toX > 5 || toY > 2 && toY < 7 {
            return false
        }
        
        return toX == frX + 1 && toY == frY ||
            toX == frX - 1 && toY == frY ||
            toX == frX && toY == frY + 1 ||
            toX == frX && toY == frY - 1
    }
    
    func isValidCannonMove(frX: Int, frY: Int, toX: Int, toY: Int) -> Bool {
        
        return frX == toX && frY != toY || frY == toY && frX != toX
    }
    
    func isValidPawnMove(frX: Int, frY: Int, toX: Int, toY: Int) -> Bool {
        guard let movingPiece = pieceAt(x: frX, y: frY) else {
            return false
        }
        
        if movingPiece.isRed {
            if movingPiece.y < 5 {
                return toX == frX && toY == frY + 1
            } else {
                return toX == frX + 1 && toY == frY ||
                    toX == frX - 1 && toY == frY ||
                    toX == frX && toY == frY + 1
            }
        } else {
            if movingPiece.y > 4 {
                return toX == frX && toY == frY - 1
            } else {
                return toX == frX + 1 && toY == frY ||
                toX == frX - 1 && toY == frY ||
                toX == frX && toY == frY - 1

            }
        }
        
 //       return false
    }
    
    
    
    /*
       0 1 2
     0 . . . . . . . . .
     1 . . . . . . . . R
     2 . . . . . . . . .
     . . . . . . . . .
     . . . . . . . . .
     . . . . . . . . .
     . . . . . . . . .
     . . . . . . . . .
     . . . . . . . . r
     . . . . . . . . .
     */
    var description: String {
        var bodStrg = ""
        bodStrg.append("  0 1 2 3 4 5 6 7 8")
        for j in 0..<10 {
            bodStrg.append("\n")
            bodStrg.append("\(j) ")
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
        
        return bodStrg
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
