//
//  ViewController.swift
//  xiangqi
//
//  Created by Donald Sheng on 2018-03-02.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    var board = Board()
    var boardX: CGFloat = 0
    var boardY: CGFloat = 0
    
    //var activePiececol: Int = 0
    //var row0: Int = 0
    var activePiece: Piece?
    
    var keyPieceValueImageView: [Piece: UIImageView] = [:]
    
    var startCol: Int = -10
    var startRow: Int = -10
    
    @IBOutlet weak var boardView: BoardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        boardX = boardView.frame.origin.x
        boardY = boardView.frame.origin.y
        
//        print(boardView)
        
        addInitPieces()
    }
    
   
    
    @IBAction func panAction(_ sender: UIPanGestureRecognizer) {
        if sender.state == UIGestureRecognizerState.began {
            let uncheckedCol0 = (sender.location(in: boardView).x - boardView.originX) / boardView.side
            let uncheckedRow0 = (sender.location(in: boardView).y - boardView.originY) / boardView.side
            
            let col = Int(floor(uncheckedCol0 + 0.5))
            let row = Int(floor(uncheckedRow0 + 0.5))
            print("row is........................\(row)!, and col is.........................\(col)!")
            
            print(board.pieces.count)
            
            if let activePieceCandiate = board.pieceAt(col: col, row: row) {
                activePiece = activePieceCandiate
            }
            
        }
        
        if sender.state == UIGestureRecognizerState.changed {
        }
        
        if sender.state == UIGestureRecognizerState.ended {
            let uncheckedCol0 = (sender.location(in: boardView).x - boardView.originX) / boardView.side
            let uncheckedRow0 = (sender.location(in: boardView).y - boardView.originY) / boardView.side
            let col = Int(uncheckedCol0) + (uncheckedCol0 < floor(uncheckedCol0) + 0.5 ? 0 : 1)
            let row = Int(uncheckedRow0) + (uncheckedRow0 < floor(uncheckedRow0) + 0.5 ? 0 : 1)
            print("row is_____________________\(row)!, and col is________________\(col)!")
            
            if board.canMove车(startCol: activePiece!.col, startRow: activePiece!.row, destCol: col, destRow: row) {
                print("access granted")
                // call board.movePiece(..)
            } else {
                print("access denied")
            }

            if var actualActivePiece = activePiece {
                if let pieceImageView = keyPieceValueImageView[actualActivePiece] {
                    let pointAtColRow = CGPoint(x: boardX + boardView.originX + CGFloat(col) * boardView.side, y: boardY + boardView.originY + CGFloat(row) * boardView.side)

                    actualActivePiece.col = col
                    actualActivePiece.row = row

                    pieceImageView.center = pointAtColRow
                    view.bringSubview(toFront: pieceImageView)
                }
                activePiece = nil
            }

            if let piece = board.pieceAt(col: col, row: row) {
                print(piece)
                if let pieceImageView = keyPieceValueImageView[piece] {
                    let pointAtColRow = CGPoint(x: boardX + boardView.originX + CGFloat(col) * boardView.side, y: boardY + boardView.originY + CGFloat(row) * boardView.side)
                    pieceImageView.center = pointAtColRow
                    view.bringSubview(toFront: pieceImageView)
                }

            } else {
                print("I'm the creeper. Catch me if you can!")
            }
            
            let lastPieceView = view.subviews.last!
            let pointAtColRow = CGPoint(x: boardX + boardView.originX + CGFloat(col) * boardView.side, y: boardY + boardView.originY + CGFloat(row) * boardView.side)
            lastPieceView.center = pointAtColRow
        }
        
    }
    
    func addPiece(image: String, row: Int, col: Int, rank: String, isRed: Bool) {
        let piece = Piece(col: col, row: row, imageName: image, rank: rank, isRed: isRed)
        board.pieces.append(piece)
        
        let pieceImage = UIImage(named: image)
        let pieceImageView: UIImageView = UIImageView(frame: CGRect(x: boardX + boardView.originX + boardView.side * (CGFloat(col) - 0.5), y: boardY + boardView.originY + boardView.side * (CGFloat(row) - 0.5), width: boardView.side, height: boardView.side))
        pieceImageView.image = pieceImage
        view.addSubview(pieceImageView)
        
        keyPieceValueImageView[piece] = pieceImageView
    }
    
    func addInitPieces() {
        //black
        // regular pieces
        addPiece(image: "bj", row: 0, col: 0, rank: "j", isRed: false)
        addPiece(image: "bm", row: 0, col: 1, rank: "m", isRed: false)
        addPiece(image: "bx", row: 0, col: 2, rank: "x", isRed: false)
        addPiece(image: "bs", row: 0, col: 3, rank: "s", isRed: false)
        addPiece(image: "bb", row: 0, col: 4, rank: "b", isRed: false)
        addPiece(image: "bs", row: 0, col: 5, rank: "s", isRed: false)
        addPiece(image: "bx", row: 0, col: 6, rank: "x", isRed: false)
        addPiece(image: "bm", row: 0, col: 7, rank: "m", isRed: false)
        addPiece(image: "bj", row: 0, col: 8, rank: "j", isRed: false)

        // c= *  *  *
        addPiece(image: "bp", row: 2, col: 1, rank: "p", isRed: false)
        addPiece(image: "bp", row: 2, col: 7, rank: "p", isRed: false)

        //
        addPiece(image: "bz", row: 3, col: 0, rank: "z", isRed: false)
        addPiece(image: "bz", row: 3, col: 2, rank: "z", isRed: false)
        addPiece(image: "bz", row: 3, col: 4, rank: "z", isRed: false)
        addPiece(image: "bz", row: 3, col: 6, rank: "z", isRed: false)
        addPiece(image: "bz", row: 3, col: 8, rank: "z", isRed: false)

        //red
        // regular pieces
        addPiece(image: "rj", row: 9, col: 0, rank: "j", isRed: true)
        addPiece(image: "rm", row: 9, col: 1, rank: "m", isRed: true)
        addPiece(image: "rx", row: 9, col: 2, rank: "x", isRed: true)
        addPiece(image: "rs", row: 9, col: 3, rank: "s", isRed: true)
        addPiece(image: "rb", row: 9, col: 4, rank: "b", isRed: true)
        addPiece(image: "rs", row: 9, col: 5, rank: "s", isRed: true)
        addPiece(image: "rx", row: 9, col: 6, rank: "x", isRed: true)
        addPiece(image: "rm", row: 9, col: 7, rank: "m", isRed: true)
        addPiece(image: "rj", row: 9, col: 8, rank: "j", isRed: true)

        // c= *  *  *
        addPiece(image: "rp", row: 7, col: 1, rank: "p", isRed: true)
        addPiece(image: "rp", row: 7, col: 7, rank: "p", isRed: true)

        //
        addPiece(image: "rz", row: 6, col: 0, rank: "z", isRed: true)
        addPiece(image: "rz", row: 6, col: 2, rank: "z", isRed: true)
        addPiece(image: "rz", row: 6, col: 4, rank: "z", isRed: true)
        addPiece(image: "rz", row: 6, col: 6, rank: "z", isRed: true)
        addPiece(image: "rz", row: 6, col: 8, rank: "z", isRed: true)
    }
}
