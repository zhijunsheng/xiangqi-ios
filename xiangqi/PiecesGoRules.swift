import Foundation

struct PiecesGoRules: CustomStringConvertible {
    
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
    
    mutating func pieceGoes(frX: Int, frY: Int, toX: Int, toY: Int) {
        guard let movingPiece = pieceAt(x: frX, y: frY) else {
            return
        }
        
        piecesSet.remove(movingPiece)
//        let newPiece = XiangqiPiece(x: toX, y: toY, rnk: movingPiece.rnk, isRed: movingPiece.isRed)
        //piecesSet.insert(newPiece)
    }
    
    func isValidRookMove(frX: Int, frY: Int, toX: Int, toY: Int) -> Bool {
        return frX == toX && frY != toY || frY == toY && frX != toX
    }
    
    func isValidKnightMove(frX: Int, frY: Int, toX: Int, toY: Int) -> Bool {
        return toX == frX + 2 && toY == frY + 1 ||
            toX == frX + 1 && toY == frY + 2 ||
            toX == frX - 2 && toY == frY - 1 ||
            toX == frX - 1 && toY == frY - 2
        
    }
    
    func isValidBishopMove(frX: Int, frY: Int, toX: Int, toY: Int) -> Bool {
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
            toX == frX + 1 && toY == frY + 1 ||
            toX == frX + 1 && toY == frY + 1 ||
            toX == frX + 1 && toY == frY + 1
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
    
    func ifValidPawnMove(frX: Int, frY: Int, toX: Int, toY: Int) -> Bool {
        return false
    }
    
    
    
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

