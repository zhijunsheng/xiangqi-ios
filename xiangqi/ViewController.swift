
import UIKit

class ViewController: UIViewController, XiangqiDelegate {
    
    @IBOutlet var boardView: BoardView!
    @IBOutlet weak var infoLabel: UILabel!
    
    var xiangqi = XiangqiBoard(piecesBox: Set<XiangqiBoardPiece>())
    var isRedTurn : Bool = true
    
    func move(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) {
        if fromCol == toCol && fromRow == toRow {
            return
        }
        if !xiangqi.isValidMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow) {
            return
        }
        let movingPiece = xiangqi.pieceAt(col: fromCol, row: fromRow)
        if movingPiece?.isRed != isRedTurn {
            return
        }
        
        xiangqi.move(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        boardView.pieces = xiangqi.piecesBox
        boardView.setNeedsDisplay()
        
        if isRedTurn {
            infoLabel.text = "黑方回合"
            infoLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            isRedTurn = false
        } else {
            infoLabel.text = "红方回合"
            infoLabel.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            isRedTurn = true
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        boardView.xiangqiDelegate = self
            
        xiangqi.resetGame()
        boardView.pieces = xiangqi.piecesBox
        boardView.setNeedsDisplay()
    }
    
    @IBAction func nextGame(_ sender: Any) {
        xiangqi.resetGame()
        infoLabel.text = "红方回合"
        infoLabel.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        isRedTurn = true
        boardView.pieces = xiangqi.piecesBox
        boardView.setNeedsDisplay()
    }
    
    
}
