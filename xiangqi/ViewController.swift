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
    
    // piece image files:
    // https://github.com/geeeeeeeeek/IntelligentChineseChessSystem/tree/master/res/img
    
//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        super.viewWillTransition(to: size, with: coordinator)
//
//        boardView.setNeedsDisplay()
//        print("1111111111111111")
//        for subView in boardView.subviews {
//            subView.removeFromSuperview()
//        }
//        addPieces()
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//       print("000000000000000000")
//        addPieces()
//    }
    
    func addPiece(piece: UIImage, col: Int, row: Int) {
        let pieceImageView = UIImageView(frame: CGRect(x: boardView.originX + boardView.cellSide * (CGFloat(col) - 0.5) , y: boardView.originY + boardView.cellSide * (CGFloat(row) - 0.5), width: boardView.cellSide, height: boardView.cellSide))
        pieceImageView.image = piece
        boardView.addSubview(pieceImageView)
        
//        pieceImageView.frame.origin.x = boardView.originX + boardView.cellSide * (CGFloat(col) - 0.5)
//        pieceImageView.frame.origin.y = boardView.originY + boardView.cellSide * (CGFloat(row) - 0.5)
    }
    
//    func addPieces() {
//        addPiece(piece: UIImage(named: "bb")!, col: 4, row: 0)
//
//        addPiece(piece: UIImage(named: "rb")!, col: 4, row: 9)
//
//        for i in 0 ..< 2 {
//            addPiece(piece: UIImage(named: "bm")!, col: 1 + i * 6, row: 0)
//            addPiece(piece: UIImage(named: "bp")!, col: 1 + i * 6, row: 2)
//            addPiece(piece: UIImage(named: "bx")!, col: 2 + i * 4, row: 0)
//            addPiece(piece: UIImage(named: "bj")!, col: 0 + i * 8, row: 0)
//            addPiece(piece: UIImage(named: "bs")!, col: 3 + i * 2, row: 0)
//
//            addPiece(piece: UIImage(named: "rx")!, col: 2 + i * 4, row: 9)
//            addPiece(piece: UIImage(named: "rp")!, col: 1 + i * 6, row: 7)
//            addPiece(piece: UIImage(named: "rs")!, col: 3 + i * 2, row: 9)
//            addPiece(piece: UIImage(named: "rm")!, col: 1 + i * 6, row: 9)
//            addPiece(piece: UIImage(named: "rj")!, col: 0 + i * 8, row: 9)
//        }
//
//        for i in 0 ..< 5 { // a typo
//            addPiece(piece: UIImage(named: "bz")!, col: 0 + i * 2, row: 3)
//            addPiece(piece: UIImage(named: "rz")!, col: 0 + i * 2, row: 6)
//        }
//    }


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

