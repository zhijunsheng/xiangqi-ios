import UIKit

class ViewController: UIViewController, XiangqiDelegate {
    var board = PiecesGoRules()
    
    @IBOutlet var boardView: BoardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        board.piecesRoom()
        boardView.piecesSet = board.piecesSet
        boardView.xiangqiDelegate = self
    }
    
    func movePiece(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) {
        board.pieceGoes(frX: fromCol, frY: fromRow, toX: toCol, toY: toRow)
        
        boardView.piecesSet = board.piecesSet
        
        boardView.setNeedsDisplay()
    }
    
}
