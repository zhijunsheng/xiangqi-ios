import XCTest

@testable import xiangqi

class XiangqiBoardTests: XCTestCase {
    
    
    func testXiangqiBoard() {
        var board = XiangqiBoard()
        let rook1 = XiangqiBoardPiece(col: 0, row: 0, rank: "R")
        board.piecesBox.insert(rook1)
        print(board)
    }
    
    
}
