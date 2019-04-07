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
    var isRedTurn: Bool = true
    
    
    //var activePiececol: Int = 0
    //var row0: Int = 0
    var activePiece: Piece?
    
    var keyPieceValueImageView: [Piece: UIImageView] = [:]
    
    var startCol: Int = -10
    var startRow: Int = -10
    
    @IBOutlet weak var boardView: BoardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print(boardView)
        
        addInitPieces()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        boardX = boardView.frame.origin.x + boardView.originX
        boardY = boardView.frame.origin.y + boardView.originY
        boardView.setNeedsDisplay()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        boardX = boardView.frame.origin.x + boardView.originX
        boardY = boardView.frame.origin.y + boardView.originY
    }
    
    func nearestPoint(clicked: CGFloat) -> Int {
        return Int(floor(clicked + 0.5))
    }
    
    @IBAction func panAction(_ sender: UIPanGestureRecognizer) {
        if sender.state == UIGestureRecognizerState.began {
            
            let col = nearestPoint(clicked: (sender.location(in: boardView).x - boardView.originX) / boardView.side)
            let row = nearestPoint(clicked: (sender.location(in: boardView).y - boardView.originY) / boardView.side)
            
            print("row is........................\(row)!, and col is.........................\(col)!")
            
            print(board.pieces.count)
            
            if let activePieceCandiate = board.pieceAt(col: col, row: row) {
                activePiece = activePieceCandiate
            }
        }
        
        if sender.state == UIGestureRecognizerState.changed {
            guard let activePiece = activePiece, let pieceImageView = keyPieceValueImageView[activePiece] else {
                return
            }
            let translation = sender.translation(in: self.view)
            pieceImageView.center = CGPoint(x: pieceImageView.center.x + translation.x, y: pieceImageView.center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: self.view)
        }
        
        if sender.state == UIGestureRecognizerState.ended {
            guard let actualActivePiece = activePiece else {
                return
            }
            let col = nearestPoint(clicked: (sender.location(in: boardView).x - boardView.originX) / boardView.side)
            let row = nearestPoint(clicked: (sender.location(in: boardView).y - boardView.originY) / boardView.side)
            print("row is_____________________\(row)!, and col is________________\(col)!")
            
            let potentialTarget: Piece? = board.pieceAt(col: col, row: row)
            
            if isRedTurn == true {
                if activePiece?.isRed == nil || activePiece?.isRed == false {
                    print("wrong side")
                    isRedTurn = true
                    return
                } else if activePiece?.isRed == true {
                    if board.canMoveTo(piece: actualActivePiece, destCol: col, destRow: row) {
                        print("access granted")
                        board.movePiece(startCol: actualActivePiece.col, startRow: actualActivePiece.row, destCol: col, destRow: row)
                        isRedTurn = false
                    } else {
                        print("access denied")
                        return
                    }
                }
            } else if isRedTurn == false {
                if activePiece?.isRed == nil || activePiece?.isRed == true {
                    print("wrong side")
                    isRedTurn = false
                    return
                } else if activePiece?.isRed == false {
                    if board.canMoveTo(piece: actualActivePiece, destCol: col, destRow: row) {
                        print("access granted")
                        board.movePiece(startCol: actualActivePiece.col, startRow: actualActivePiece.row, destCol: col, destRow: row)
                        isRedTurn = true
                    } else {
                        print("access denied")
                        return
                    }
                }
            }
            
            if let pieceImageView = keyPieceValueImageView[actualActivePiece] {
                let pointAtColRow = CGPoint(x: boardX + boardView.originX + CGFloat(col) * boardView.side, y: boardY + boardView.originY + CGFloat(row) * boardView.side)
                
                pieceImageView.center = pointAtColRow
                let newKey = Piece(col: col, row: row, imageName: actualActivePiece.imageName, rank: actualActivePiece.rank, isRed: actualActivePiece.isRed)
                keyPieceValueImageView[newKey] = pieceImageView
                
                if let potentialTarget = potentialTarget, let viewToRemove = keyPieceValueImageView[potentialTarget] {
                    viewToRemove.removeFromSuperview()
                    
                    keyPieceValueImageView.removeValue(forKey: potentialTarget)
                }
            }
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
