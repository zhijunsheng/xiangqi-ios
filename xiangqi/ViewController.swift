//
//  ViewController.swift
//  xiangqi
//
//  Created by Donald Sheng on 2018-03-02.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    var boardX: CGFloat = 0
    var boardY: CGFloat = 0
    
    @IBOutlet weak var boardView: BoardView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        boardX = boardView.frame.origin.x
        boardY = boardView.frame.origin.y
        
        print(boardView)
        
        addPiece(image: #imageLiteral(resourceName: "bj"), row: 0, col: 0)
        addPiece(image: #imageLiteral(resourceName: "bm"), row: 0, col: 1)
        addPiece(image: #imageLiteral(resourceName: "bx"), row: 0, col: 2)
        addPiece(image: #imageLiteral(resourceName: "bs"), row: 0, col: 3)
        addPiece(image: #imageLiteral(resourceName: "bb"), row: 0, col: 4)
        addPiece(image: #imageLiteral(resourceName: "bs"), row: 0, col: 5)
        addPiece(image: #imageLiteral(resourceName: "bx"), row: 0, col: 6)
        addPiece(image: #imageLiteral(resourceName: "bm"), row: 0, col: 7)
        addPiece(image: #imageLiteral(resourceName: "bj"), row: 0, col: 8)
        
        addPiece(image: #imageLiteral(resourceName: "bp"), row: 2, col: 1)
        addPiece(image: #imageLiteral(resourceName: "bp"), row: 2, col: 7)
        
        addPiece(image: #imageLiteral(resourceName: "bz"), row: 3, col: 0)
        addPiece(image: #imageLiteral(resourceName: "bz"), row: 3, col: 2)
        addPiece(image: #imageLiteral(resourceName: "bz"), row: 3, col: 4)
        addPiece(image: #imageLiteral(resourceName: "bz"), row: 3, col: 6)
        addPiece(image: #imageLiteral(resourceName: "bz"), row: 3, col: 8)
        
        
        addPiece(image: #imageLiteral(resourceName: "rj"), row: 9, col: 0)
        addPiece(image: #imageLiteral(resourceName: "rm"), row: 9, col: 1)
        addPiece(image: #imageLiteral(resourceName: "rx"), row: 9, col: 2)
        addPiece(image: #imageLiteral(resourceName: "rs"), row: 9, col: 3)
        addPiece(image: #imageLiteral(resourceName: "rb"), row: 9, col: 4)
        addPiece(image: #imageLiteral(resourceName: "rs"), row: 9, col: 5)
        addPiece(image: #imageLiteral(resourceName: "rx"), row: 9, col: 6)
        addPiece(image: #imageLiteral(resourceName: "rm"), row: 9, col: 7)
        addPiece(image: #imageLiteral(resourceName: "rj"), row: 9, col: 8)
        
        addPiece(image: #imageLiteral(resourceName: "rp"), row: 7, col: 1)
        addPiece(image: #imageLiteral(resourceName: "rp"), row: 7, col: 7)
        
        addPiece(image: #imageLiteral(resourceName: "rz"), row: 6, col: 0)
        addPiece(image: #imageLiteral(resourceName: "rz"), row: 6, col: 2)
        addPiece(image: #imageLiteral(resourceName: "rz"), row: 6, col: 4)
        addPiece(image: #imageLiteral(resourceName: "rz"), row: 6, col: 6)
        addPiece(image: #imageLiteral(resourceName: "rz"), row: 6, col: 8)
        
    }
    
    func addPiece(image: UIImage, row: Int, col: Int) {
        let piece: UIImageView = UIImageView(frame: CGRect(x: boardX + boardView.originX + boardView.side * (CGFloat(col) - 0.5), y: boardY + boardView.originY + boardView.side * (CGFloat(row) - 0.5), width: boardView.side, height: boardView.side))
        piece.image = image
        view.addSubview(piece)
    }
}

