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
        
        //black
     // regular pieces
        addPiece(image: #imageLiteral(resourceName: "bj"), row: 0, col: 0)
        addPiece(image: #imageLiteral(resourceName: "bm"), row: 0, col: 1)
        addPiece(image: #imageLiteral(resourceName: "bx"), row: 0, col: 2)
        addPiece(image: #imageLiteral(resourceName: "bs"), row: 0, col: 3)
        addPiece(image: #imageLiteral(resourceName: "bb"), row: 0, col: 4)
        addPiece(image: #imageLiteral(resourceName: "bs"), row: 0, col: 5)
        addPiece(image: #imageLiteral(resourceName: "bx"), row: 0, col: 6)
        addPiece(image: #imageLiteral(resourceName: "bm"), row: 0, col: 7)
        addPiece(image: #imageLiteral(resourceName: "bj"), row: 0, col: 8)
        
     // c= *  *  *
        addPiece(image: #imageLiteral(resourceName: "bp"), row: 2, col: 1)
        addPiece(image: #imageLiteral(resourceName: "bp"), row: 2, col: 7)
     
     //
        addPiece(image: #imageLiteral(resourceName: "bz"), row: 3, col: 0)
        addPiece(image: #imageLiteral(resourceName: "bz"), row: 3, col: 2)
        addPiece(image: #imageLiteral(resourceName: "bz"), row: 3, col: 4)
        addPiece(image: #imageLiteral(resourceName: "bz"), row: 3, col: 6)
        addPiece(image: #imageLiteral(resourceName: "bz"), row: 3, col: 8)
        
        //red
     // regular pieces
        addPiece(image: #imageLiteral(resourceName: "rj"), row: 9, col: 0)
        addPiece(image: #imageLiteral(resourceName: "rm"), row: 9, col: 1)
        addPiece(image: #imageLiteral(resourceName: "rx"), row: 9, col: 2)
        addPiece(image: #imageLiteral(resourceName: "rs"), row: 9, col: 3)
        addPiece(image: #imageLiteral(resourceName: "rb"), row: 9, col: 4)
        addPiece(image: #imageLiteral(resourceName: "rs"), row: 9, col: 5)
        addPiece(image: #imageLiteral(resourceName: "rx"), row: 9, col: 6)
        addPiece(image: #imageLiteral(resourceName: "rm"), row: 9, col: 7)
        addPiece(image: #imageLiteral(resourceName: "rj"), row: 9, col: 8)
        
     // c=__*__*__*__*__*__*__*__*__*__*__*__*_______________________________________________________________________
        addPiece(image: #imageLiteral(resourceName: "rp"), row: 7, col: 1)
        addPiece(image: #imageLiteral(resourceName: "rp"), row: 7, col: 7)
        
     //
        addPiece(image: #imageLiteral(resourceName: "rz"), row: 6, col: 0)
        addPiece(image: #imageLiteral(resourceName: "rz"), row: 6, col: 2)
        addPiece(image: #imageLiteral(resourceName: "rz"), row: 6, col: 4)
        addPiece(image: #imageLiteral(resourceName: "rz"), row: 6, col: 6)
        addPiece(image: #imageLiteral(resourceName: "rz"), row: 6, col: 8)
        
    }
    @IBAction func panAction(_ sender: UIPanGestureRecognizer) {
        let uncheckedCol0 = (sender.location(in: boardView).x - boardView.originX) / boardView.side
        let uncheckedRow0 = (sender.location(in: boardView).y - boardView.originY) / boardView.side
        let col = Int(uncheckedCol0) + (uncheckedCol0 < floor(uncheckedCol0) + 0.5 ? 0 : 1)
        let row = Int(uncheckedRow0) + (uncheckedRow0 < floor(uncheckedRow0) + 0.5 ? 0 : 1)
        print("row is........................\(row)!, and col is.........................\(col)!")
    }
    
    func addPiece(image: UIImage, row: Int, col: Int) {
        let piece: UIImageView = UIImageView(frame: CGRect(x: boardX + boardView.originX + boardView.side * (CGFloat(col) - 0.5), y: boardY + boardView.originY + boardView.side * (CGFloat(row) - 0.5), width: boardView.side, height: boardView.side))
        piece.image = image
        view.addSubview(piece)
    }
}

