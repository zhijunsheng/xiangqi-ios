import XCTest

@testable import xiangqi

class PiecesGoRulesTests: XCTestCase {
    
    func testPiecesGoRules() {
        var rls = PiecesGoRules()
    
        for i in 0..<2 {
            rls.piecesSet.insert(XiangqiPiece(x: i * 8 + 0, y: 0, rnk: Rank.rook, isRed: true))
            rls.piecesSet.insert(XiangqiPiece(x: i * 6 + 1, y: 0, rnk: Rank.knight, isRed: true))
            rls.piecesSet.insert(XiangqiPiece(x: i * 4 + 2, y: 0, rnk: Rank.bishop, isRed: true))
            rls.piecesSet.insert(XiangqiPiece(x: i * 2 + 3, y: 0, rnk: Rank.warrior, isRed: true))
            rls.piecesSet.insert(XiangqiPiece(x: i * 6 + 1, y: 2, rnk: Rank.cannon, isRed: true))
            
            rls.piecesSet.insert(XiangqiPiece(x: i * 8 + 0, y: 9, rnk: Rank.rook, isRed: false))
            rls.piecesSet.insert(XiangqiPiece(x: i * 6 + 1, y: 9, rnk: Rank.knight, isRed: false))
            rls.piecesSet.insert(XiangqiPiece(x: i * 4 + 2, y: 9, rnk: Rank.bishop, isRed: false))
            rls.piecesSet.insert(XiangqiPiece(x: i * 2 + 3, y: 9, rnk: Rank.warrior, isRed: false))
            rls.piecesSet.insert(XiangqiPiece(x: i * 6 + 1, y: 7, rnk: Rank.cannon, isRed: false))
        }
        
        for i in 0..<5 {
            rls.piecesSet.insert(XiangqiPiece(x: i * 2, y: 3, rnk: Rank.pawn, isRed: true))
            rls.piecesSet.insert(XiangqiPiece(x: i * 2, y: 6, rnk: Rank.pawn, isRed: false))
        }
        
        rls.piecesSet.insert(XiangqiPiece(x: 4, y: 0, rnk: Rank.king, isRed: true))
        rls.piecesSet.insert(XiangqiPiece(x: 4, y: 9, rnk: Rank.king, isRed: false))
        
        print("\(rls)")
        
    }
}
