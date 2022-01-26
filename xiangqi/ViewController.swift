import UIKit

class ViewController: UIViewController, XiangqiDelegate {
    var board = PiecesGoRules()
    
    @IBOutlet var boardView: BoardView!
    
    @IBOutlet weak var jiangImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jiangImageView.isHidden = true
        board.piecesRoom()
        boardView.piecesSet = board.piecesSet
        boardView.xiangqiDelegate = self
    }
    
    
    
    func movePiece(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) {
        
        if board.blackWins(toX: toCol, toY: toRow) {
            print("red dead")
        } else if board.redWins(toX: toCol, toY: toRow) {
            print("black dead")
        }
        
        board.pieceGoes(frX: fromCol, frY: fromRow, toX: toCol, toY: toRow)
        
        boardView.piecesSet = board.piecesSet
        
        boardView.setNeedsDisplay()
        
        if board.isChecked() {
            jiangImageView.isHidden = false

        }
    }
}
