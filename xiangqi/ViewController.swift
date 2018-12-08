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
        
        addPiece(image: #imageLiteral(resourceName: "bb"), row: 0, col: 0)
    }
    
    func addPiece(image: UIImage, row: Int, col: Int) {
        let piece: UIImageView = UIImageView(frame: CGRect(x: boardX + boardView.originX + boardView.side * CGFloat(col), y: boardY + boardView.originY + boardView.side * CGFloat(row), width: boardView.side, height: boardView.side))
        piece.image = image
        view.addSubview(piece)
    }
}

