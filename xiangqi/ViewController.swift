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
    var board = XiangqiBoard()
    var fromCol: Int? = nil
    var fromRow: Int? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        board.initializeBoard()
        boardView.pieces = board.pieces
        
    }
    
    @IBAction func moveFinger(_ panGestureRecognizer: UIPanGestureRecognizer) {
        
        
        let fingerLocation = panGestureRecognizer.location(in: boardView)
        if panGestureRecognizer.state == .began {
            print("from: (\(fingerLocation.x), \(fingerLocation.y))")
            
            fromCol = Utils.xyToColRow(xy: fingerLocation.x, orgXY: boardView.originX, cellSide: boardView.cellSide, margin: boardView.panningMargin)
            
            fromRow = Utils.xyToColRow(xy: fingerLocation.y, orgXY: boardView.originY, cellSide: boardView.cellSide, margin: boardView.panningMargin)
            
        } else if panGestureRecognizer.state == .ended {
            guard let fromCol = fromCol, let fromRow = fromRow, let toCol = Utils.xyToColRow(xy: fingerLocation.x, orgXY: boardView.originX, cellSide: boardView.cellSide, margin: boardView.panningMargin), let toRow = Utils.xyToColRow(xy: fingerLocation.y, orgXY: boardView.originY, cellSide: boardView.cellSide, margin: boardView.panningMargin) else {
                return
            }
            
            board.movePiece(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
            boardView.pieces = board.pieces
            boardView.setNeedsDisplay()
            print(board)
        } else if panGestureRecognizer.state == .changed {
            //            print("1234567890")
        }
    }
}

