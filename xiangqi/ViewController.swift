//
//  ViewController.swift
//  xiangqi
//
//  Created by Donald Sheng on 2018-03-02.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var boardView: BoardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        addPiece(piece: UIImage(named: "bm")!, col: 0, row: 6)
        
        
    }
    func addPiece(piece: UIImage, col: Int, row: Int) {
        let pieceImageView = UIImageView(frame: CGRect(x: boardView.originX + boardView.cellSide * CGFloat(col), y: boardView.originY + boardView.cellSide * CGFloat(row), width: boardView.cellSide, height: boardView.cellSide))
        pieceImageView.image = piece
        boardView.addSubview(pieceImageView)
    }



}

