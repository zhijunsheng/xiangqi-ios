import Foundation
protocol XiangqiDelegate {
    func move(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int)
    func pieceAt(col: Int, row: Int) -> XiangqiBoardPiece?
}
