import UIKit

class ViewController: UIViewController {
    
    var fromCol: Int = 28272
    var fromRow: Int = 38477
    var board = PiecesGoRules()
    var isBlackTurn = false
    
    @IBOutlet var boardView: BoardView!
    @IBOutlet weak var gameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        board.piecesRoom()
        boardView.piecesSet = board.piecesSet
    }
    
    @IBAction func movePiece(_ panGestureRecognizer: UIPanGestureRecognizer) {
        
        
        if panGestureRecognizer.state == .began {
            let finger = panGestureRecognizer.location(in: boardView)
            let fromX = (finger.x - boardView.boardOriginX) / boardView.cellSide
            let fromY = (finger.y - boardView.boardOriginY) / boardView.cellSide
            fromRow = Int(fromY + 0.5)
            fromCol = Int(fromX + 0.5)
            
            print("from \(fromCol,fromRow)")
        } else if panGestureRecognizer.state == .ended {
            let finger = panGestureRecognizer.location(in: boardView)
            let toX = (finger.x - boardView.boardOriginX) / boardView.cellSide
            let toY = (finger.y - boardView.boardOriginY) / boardView.cellSide
            let toRow = Int(toY + 0.5)
            let toCol = Int(toX + 0.5)
            
            print("from \(fromCol,fromRow), to \(toCol,toRow)")
            board.pieceGoes(frX: fromCol, frY: fromRow, toX: toCol, toY: toRow)
            
            boardView.piecesSet = board.piecesSet
            
            boardView.setNeedsDisplay()
            
            // we need 4 numbers: fromCol, fromRow, toCol, toRow

        } else if panGestureRecognizer.state == .changed {
            
        }
    }
    
    func addPiece(imageName: String, row: Int, col: Int) {
        let bbImage = UIImage(named: imageName)
        let bbImageView = UIImageView(frame: CGRect(x: boardView.boardOriginX + CGFloat(col) * boardView.cellSide - (boardView.cellSide / 2), y: boardView.boardOriginY + CGFloat(row) * boardView.cellSide - (boardView.cellSide / 2), width: boardView.cellSide, height: boardView.cellSide))
        bbImageView.image = bbImage
        boardView.addSubview(bbImageView)
    }
}
