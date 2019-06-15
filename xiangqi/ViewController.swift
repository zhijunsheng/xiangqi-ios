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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        board.initializeBoard()
        boardView.pieces = board.pieces
        
    }
    
    @IBAction func moveFinger(_ panGestureRecognizer: UIPanGestureRecognizer) {
        
        
        let fingerLocation = panGestureRecognizer.location(in: boardView)
        if panGestureRecognizer.state == .began {
            let (fromCol, fromRow) = xyToColRow(x: fingerLocation.x, y: fingerLocation.y)
            
        } else if panGestureRecognizer.state == .ended {
            let (toCol, toRow) = xyToColRow(x: fingerLocation.x, y: fingerLocation.y)
            
            
        } else if panGestureRecognizer.state == .changed {
            //            print("1234567890")
        }
    }
    
    func xyToColRow(x: CGFloat, y: CGFloat) -> (Int, Int) {
        let fromColRaw: CGFloat = (x - boardView.originX) / boardView.cellSide
        let fromRowRaw: CGFloat = (y - boardView.originY) / boardView.cellSide
        let fromCol = Int(fromColRaw + 0.5)
        let fromRow = Int(fromRowRaw + 0.5)
        print("(\(fromCol), \(fromRow))")
        return (fromCol, fromRow)
    }
}

