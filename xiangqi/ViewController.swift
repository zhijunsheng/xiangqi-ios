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
    
    func addPiece(imageName: String, row: Int, col: Int) {
        let bbImage = UIImage(named: imageName)
        let bbImageView = UIImageView(frame: CGRect(x: boardView.boardOriginX + CGFloat(col) * boardView.cellSide - (boardView.cellSide / 2), y: boardView.boardOriginY + CGFloat(row) * boardView.cellSide - (boardView.cellSide / 2), width: boardView.cellSide, height: boardView.cellSide))
        bbImageView.image = bbImage
        boardView.addSubview(bbImageView)
    }
}
