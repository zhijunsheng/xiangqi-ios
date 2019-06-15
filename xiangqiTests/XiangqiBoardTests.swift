import XCTest

@testable import xiangqi

class XiangqiBoardTests: XCTestCase {

    func testMove() {
        var xiangqi = XiangqiBoard()
        xiangqi.piecesBox.insert(XiangqiBoardPiece(col: 0, row: 0, rank: "R", isRed: true))
        print(xiangqi)
        xiangqi.move(fromCol: 0, fromRow: 0, toCol: 0, toRow: 9)
        print(xiangqi)
    }
    // ≠
    func testXiangqiBoard() {
        var board = XiangqiBoard()

        board.piecesBox.insert(XiangqiBoardPiece(col: 4, row: 0, rank: "Q", isRed: true))
        for i in 0...1 {
            board.piecesBox.insert(XiangqiBoardPiece(col: 1 + i * 6, row: 2, rank: "C", isRed: true))
            board.piecesBox.insert(XiangqiBoardPiece(col: 3 + i * 2, row: 0, rank: "G", isRed: true))
            board.piecesBox.insert(XiangqiBoardPiece(col: 2 + i * 4, row: 0, rank: "B", isRed: true))
            board.piecesBox.insert(XiangqiBoardPiece(col: 1 + i * 6, row: 0, rank: "K", isRed: true))
            board.piecesBox.insert(XiangqiBoardPiece(col: 0 + i * 8, row: 0, rank: "R", isRed: true))
        }
        for i in 0..<5 {
            board.piecesBox.insert(XiangqiBoardPiece(col: i * 2, row: 3, rank: "P", isRed: true))
        }
        
        board.piecesBox.insert(XiangqiBoardPiece(col: 4, row: 9, rank: "Q", isRed: false))
        for i in 0...1 {
            board.piecesBox.insert(XiangqiBoardPiece(col: 1 + i * 6, row: 7, rank: "C", isRed: false))
            board.piecesBox.insert(XiangqiBoardPiece(col: 3 + i * 2, row: 9, rank: "G", isRed: false))
            board.piecesBox.insert(XiangqiBoardPiece(col: 2 + i * 4, row: 9, rank: "B", isRed: false))
            board.piecesBox.insert(XiangqiBoardPiece(col: 1 + i * 6, row: 9, rank: "K", isRed: false))
            board.piecesBox.insert(XiangqiBoardPiece(col: 0 + i * 8, row: 9, rank: "R", isRed: false))
        }
        for i in 0..<5 {
            board.piecesBox.insert(XiangqiBoardPiece(col: i * 2, row: 6, rank: "P", isRed: false))
        }
 
        print(board)
    }
    
    func testIsValidGuardMove() {
        let board = XiangqiBoard()
        XCTAssertTrue(board.isValidGuardMove(fromCol: 3, fromRow: 0, toCol: 4, toRow: 1))
        XCTAssertTrue(board.isValidGuardMove(fromCol: 4, fromRow: 1, toCol: 5, toRow: 2))
        XCTAssertFalse(board.isValidGuardMove(fromCol: 4, fromRow: 1, toCol: 6, toRow: 8))
        XCTAssertTrue(board.isValidGuardMove(fromCol: 4, fromRow: 1, toCol: 3, toRow: 2))
        XCTAssertFalse(board.isValidGuardMove(fromCol: 3, fromRow: 0, toCol: 2, toRow: 1))
    }
    func testIsValidKingMove() {
        let board = XiangqiBoard()
        XCTAssertTrue(board.isValidKingMove(fromCol: 4, fromRow: 0, toCol: 4, toRow: 1))
        XCTAssertTrue(board.isValidKingMove(fromCol: 4, fromRow: 1, toCol: 4, toRow: 2))
        XCTAssertFalse(board.isValidKingMove(fromCol: 4, fromRow: 2, toCol: 6, toRow: 8))
        XCTAssertFalse(board.isValidKingMove(fromCol: 4, fromRow: 2, toCol: 5, toRow: 3))
        XCTAssertFalse(board.isValidKingMove(fromCol: 3, fromRow: 0, toCol: 4, toRow: 1))
    }
    func testIsValidBishopMove() {
        let board = XiangqiBoard()
        XCTAssertTrue(board.isValidBishopMove(fromCol: 2, fromRow: 0, toCol: 0, toRow: 2))
        XCTAssertTrue(board.isValidBishopMove(fromCol: 0, fromRow: 2, toCol: 2, toRow: 4))
        XCTAssertFalse(board.isValidBishopMove(fromCol: 4, fromRow: 2, toCol: 6, toRow: 8))
        XCTAssertFalse(board.isValidBishopMove(fromCol: 4, fromRow: 2, toCol: 5, toRow: 3))
    }
    func testIsValidKnightMove() {
        let board = XiangqiBoard()
        XCTAssertTrue(board.isValidKnightMove(fromCol: 0, fromRow: 1, toCol: 1, toRow: 3))
        XCTAssertFalse(board.isValidKnightMove(fromCol: 0, fromRow: 1, toCol: 1, toRow: 2))
    }
    
}
