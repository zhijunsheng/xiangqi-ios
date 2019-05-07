import XCTest

@testable import xiangqi

class PiecesGoRulesTests: XCTestCase {
    
    func testPiecesGoRules() {
        var rls = PiecesGoRules()
    
        for i in 0..<2 {
            rls.piecesSet.insert(XiangqiPiece(x: i * 8 + 0, y: 0, rnk: Rank.rook))
            rls.piecesSet.insert(XiangqiPiece(x: i * 6 + 1, y: 0, rnk: Rank.knight))
            rls.piecesSet.insert(XiangqiPiece(x: i * 4 + 2, y: 0, rnk: Rank.bishop))
            rls.piecesSet.insert(XiangqiPiece(x: i * 2 + 3, y: 0, rnk: Rank.warrior))
        }
        
        rls.piecesSet.insert(XiangqiPiece(x: 4, y: 0, rnk: Rank.king))
        
        print("\(rls)")
        
    }
}
