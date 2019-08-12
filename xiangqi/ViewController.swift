//
//  ViewController.swift
//  xiangqi
//
//  Created by Donald Sheng on 2018-03-02.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, XiangqiDelegate {
    
    func movePiece(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) {
        board.movePiece(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        boardView.pieces = board.pieces
        boardView.setNeedsDisplay()
        
    }
    
    @IBOutlet weak var boardView: BoardView!
    var board = XiangqiBoard()
    var fromCol: Int? = nil
    var fromRow: Int? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        board.initializeBoard()
        boardView.pieces = board.pieces
        boardView.xiangqiDelegate = self
    }
}

