import XCTest

@testable import xiangqi

class PiecesGoRulesTests: XCTestCase {
    
    func testRookPieceRules() {
        let rule = PiecesGoRules()
        XCTAssertTrue(rule.isValidRookMove(frX: 0, frY: 0, toX: 0, toY: 2))
        XCTAssertFalse(rule.isValidRookMove(frX: 0, frY: 0, toX: 7, toY: 2))
    }
    
    func testKnightPieceRules() {
        let rule = PiecesGoRules()
        XCTAssertTrue(rule.isValidKnightMove(frX: 1, frY: 0, toX: 2, toY: 2))
        XCTAssertFalse(rule.isValidKnightMove(frX: 0, frY: 0, toX: 8, toY: 9))
    }
    
    func testPiecesGoRules() {
        
        var rls = PiecesGoRules()
        
        
        rls.piecesRoom()
        
        
        
        print("\(rls)")
        
    }
}
