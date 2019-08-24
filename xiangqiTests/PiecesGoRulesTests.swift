import XCTest

@testable import xiangqi

class PiecesGoRulesTests: XCTestCase {
    func testNumberOfPiecesBetween() {

        
        /*
           0 1 2 3 4 5 6 7 8
         0 . . . . . . . . .
         1 . . . . . . . . r
         2 . . . . . . . . .
         3 . . . . . . . . .
         4 . . . . . . . . .
         5 . . . . . . . . .
         6 . . . . . . . . .
         7 . . . . . . . . .
         8 . . . . . . . . R
         9 . . . . . . . . .
         */
        var rule = PiecesGoRules()

        rule.piecesSet.insert(XiangqiPiece(x: 8, y: 1, rnk: Rank.rook, isRed: true, imgNm: "rj"))
        rule.piecesSet.insert(XiangqiPiece(x: 8, y: 8, rnk: Rank.rook, isRed: false, imgNm: "bj"))
        print(rule)
        XCTAssertEqual(0, rule.numberOfPiecesBetween(frX: 8, frY: 1, toX: 6, toY: 1))
        XCTAssertEqual(1, rule.numberOfPiecesBetween(frX: 8, frY: 1, toX: 8, toY: 9))
        XCTAssertEqual(2, rule.numberOfPiecesBetween(frX: 8, frY: 0, toX: 8, toY: 9))
        XCTAssertEqual(2, rule.numberOfPiecesBetween(frX: 8, frY: 9, toX: 8, toY: 0))
        
        
        /*
         . . . . . . . . .
         . . . . . . . . .
         . . . . . . . . .
         . . . . . . . . .
         . . . . . . . . .
         . . . . . . . . .
         . . . . . . . . .
         . . . . . . . . .
         . . . . . . . . .
         . . . . . . . . .
         */
        rule = PiecesGoRules()
        
    }
    
    func testRookPieceRules() {
        let rule = PiecesGoRules()
        XCTAssertTrue(rule.isValidRookMove(frX: 0, frY: 0, toX: 0, toY: 2))
        XCTAssertFalse(rule.isValidRookMove(frX: 0, frY: 0, toX: 7, toY: 2))
        print(rule)
    }
    
    func testKnightPieceRules() {
        let rule = PiecesGoRules()
        XCTAssertTrue(rule.isValidKnightMove(frX: 1, frY: 0, toX: 2, toY: 2))
        XCTAssertFalse(rule.isValidKnightMove(frX: 0, frY: 0, toX: 8, toY: 9))
    }
    
    func testBishopPieceRules() {
        let rule = PiecesGoRules()
        XCTAssertTrue(rule.isValidBishopMove(frX: 2, frY: 0, toX: 4, toY: 2))
        XCTAssertFalse(rule.isValidBishopMove(frX: 2, frY: 0, toX: 6, toY: 9))
    }
    
    func testWarriorPieceRules() {
        let rule = PiecesGoRules()
        XCTAssertTrue(rule.isValidWarriorMove(frX: 3, frY: 0, toX: 4, toY: 1))
        XCTAssertFalse(rule.isValidWarriorMove(frX: 3, frY: 0, toX: 2, toY: 1))
    }
    
    func testKingPieceRules() {
        let rule = PiecesGoRules()
        XCTAssertTrue(rule.isValidKingMove(frX: 4, frY: 0, toX: 4, toY: 1))
        XCTAssertFalse(rule.isValidKingMove(frX: 4, frY: 0, toX: 3, toY: 1))
    }
    
    func testCannonPieceRules() {
        let rule = PiecesGoRules()
        XCTAssertTrue(rule.isValidCannonMove(frX: 2, frY: 3, toX: 2, toY: 5))
        XCTAssertFalse(rule.isValidCannonMove(frX: 2, frY: 3, toX: 3, toY: 1))
    }
    
    
    
    func testPiecesGoRules() {
        
        var rls = PiecesGoRules()
        
        
        rls.piecesRoom()
        
        
        
        print("\(rls)")
        
    }
}
