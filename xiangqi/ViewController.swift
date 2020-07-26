//
//  ViewController.swift
//  xiangqi
//
//  Created by Donald Sheng on 2018-03-02.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, XiangqiDelegate {
    
    @IBOutlet weak var boardView: BoardView!
    @IBOutlet weak var whoseTurnLabel: UILabel!
    var board = XiangqiBoard()
    var fromCol: Int? = nil
    var fromRow: Int? = nil
    var isRedTurn: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        whoseTurnLabel.text = "Red's Turn"
        board.initializeBoard()
        boardView.pieces = board.pieces
        boardView.xiangqiDelegate = self
    }
    
    func movePiece(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) {
        if fromCol == toCol && fromRow == toRow {
            return
        }
        
        if board.pieceAt(col: fromCol, row: fromRow)?.isRed != isRedTurn {
            return
        }
        
        if board.pieceAt(col: toCol, row: toRow)?.rank == .king {
            print("game over")
            
        }
        
        isRedTurn = !isRedTurn
        board.movePiece(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        boardView.pieces = board.pieces
        boardView.setNeedsDisplay()
        
        if isRedTurn == true {
            whoseTurnLabel.text = "Red's Turn"
        } else {
            whoseTurnLabel.text = "Black's Turn"
        }
    }
    
    func pieceAt(col: Int, row: Int) -> XiangqiPiece? {
        guard let piece = board.pieceAt(col: col, row: row) else {
            return nil
        }
        return piece
    }
}
