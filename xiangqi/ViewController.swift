

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var boardView: BoardView!
    @IBOutlet weak var infoLabel: UILabel!
    
    var xiangqi = XiangqiBoard(piecesBox: Set<XiangqiBoardPiece>())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoLabel.text = "红方回合"
        infoLabel.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
//        addPiece(pieceName: "bj", row: 0, col: 0)
//        addPiece(pieceName: "bj", row: 0, col: 8)
//        addPiece(pieceName: "rj", row: 9, col: 0)
//        addPiece(pieceName: "rj", row: 9, col: 8)
        for i in 0..<5 {
            addPiece(pieceName: "bz", row: 3, col: i * 2, rank: "P", isRed: false)
            addPiece(pieceName: "rz", row: 6, col: i * 2, rank: "P", isRed: true)
        }
        for i in 0..<2 {
            addPiece(pieceName: "bs", row: 0, col: 3 + i * 2, rank: "G", isRed: false)
            addPiece(pieceName: "rs", row: 9, col: 3 + i * 2, rank: "G", isRed: true)
            addPiece(pieceName: "rx", row: 9, col: 2 + i * 4, rank: "B", isRed: true)
            addPiece(pieceName: "bp", row: 2, col: 1 + i * 6, rank: "C", isRed: false)
            addPiece(pieceName: "rp", row: 7, col: 1 + i * 6, rank: "C", isRed: true)
            addPiece(pieceName: "bm", row: 0, col: 1 + i * 6, rank: "K", isRed: false)
            addPiece(pieceName: "bx", row: 0, col: 2 + i * 4, rank: "B", isRed: false)
            addPiece(pieceName: "rj", row: 9, col: i * 8, rank: "R", isRed: true)
            addPiece(pieceName: "bj", row: 0, col: i * 8, rank: "R", isRed: false)
            addPiece(pieceName: "rm", row: 9, col: 1 + i * 6, rank: "K", isRed: true)
        }
        addPiece(pieceName: "bb", row: 0, col: 4, rank: "K", isRed: false)
        addPiece(pieceName: "rb", row: 9, col: 4, rank: "K", isRed: false)
        
        boardView.pieces = xiangqi.piecesBox
        
    }
    
    @IBAction func nextGame(_ sender: Any) {
    }
    
    func addPiece(pieceName : String, row: Int, col: Int, rank: String, isRed: Bool) {
        xiangqi.piecesBox.insert(XiangqiBoardPiece(col: col, row: row, rank: rank, isRed: isRed, imageName: pieceName))
        
//////        var side: CGFloat
////        if boardView.width < boardView.height {
////            side = boardView.width
////        } else {
////            side = boardView.height
////        }
////        
////        let pieceImage = UIImage (named: pieceName)
////        let pieceImageView = UIImageView (frame: CGRect(x: boardView.originX - 0.5 * side + CGFloat(col) * boardView.width, y: boardView.originY - 0.5 * side + CGFloat(row) * boardView.height, width: side, height: side))
//        pieceImageView.image = pieceImage
//        boardView.addSubview(pieceImageView)
    }
    
}
