import UIKit

class ViewController: UIViewController {
    @IBOutlet var boardView: BoardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addPiece(imageName: "bb", row: 0, col: 4)
        
        addPiece(imageName: "bj", row: 0, col: 0)
        addPiece(imageName: "bj", row: 0, col: 8)
        
        addPiece(imageName: "rj", row: 9, col: 0)
        addPiece(imageName: "rj", row: 9, col: 8)
        
        for i in 0..<5 {
            addPiece(imageName: "rz", row: 6, col: i * 2)
            addPiece(imageName: "bz", row: 3, col: i * 2)
        }
        
        
        addPiece(imageName: "bp", row: 2, col: 1)
        addPiece(imageName: "bp", row: 2, col: 7)
        
        addPiece(imageName: "rp", row: 7, col: 1)
        addPiece(imageName: "rp", row: 7, col: 7)
        
        addPiece(imageName: "rb", row: 9, col: 4)
        
        addPiece(imageName: "bm", row: 0, col: 1)
        addPiece(imageName: "bm", row: 0, col: 7)
        
        addPiece(imageName: "rm", row: 9, col: 1)
        addPiece(imageName: "rm", row: 9, col: 7)
        
        addPiece(imageName: "bx", row: 0, col: 2)
        addPiece(imageName: "bx", row: 0, col: 6)
        
        addPiece(imageName: "rx", row: 9, col: 2)
        addPiece(imageName: "rx", row: 9, col: 6)
        
        addPiece(imageName: "bs", row: 0, col: 3)
        addPiece(imageName: "bs", row: 0, col: 5)
        
        addPiece(imageName: "rs", row: 9, col: 3)
        addPiece(imageName: "rs", row: 9, col: 5)
        
    }
    
    func addPiece(imageName: String, row: Int, col: Int) {
        let bbImage = UIImage(named: imageName)
        let bbImageView = UIImageView(frame: CGRect(x: boardView.boardOriginX + CGFloat(col) * boardView.cellSide - (boardView.cellSide / 2), y: boardView.boardOriginY + CGFloat(row) * boardView.cellSide - (boardView.cellSide / 2), width: boardView.cellSide, height: boardView.cellSide))
        bbImageView.image = bbImage
        boardView.addSubview(bbImageView)
    }
}
