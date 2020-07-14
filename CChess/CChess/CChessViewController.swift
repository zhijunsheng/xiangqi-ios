//
//  CChessViewController.swift
//  CChess
//
//  Created by Zhijun Sheng on 2020-07-14.
//

import UIKit

class CChessViewController: UIViewController {

    @IBOutlet weak var boardView: BoardView!
    @IBOutlet weak var upperPlayerView: UIView!
    @IBOutlet weak var upperPlayerLabel: UILabel!
    @IBOutlet weak var upperPlayerColorView: UIView!
    
    @IBOutlet weak var lowerPlayerView: UIView!
    @IBOutlet weak var lowerPlayerLabel: UILabel!
    @IBOutlet weak var lowerPlayerColorView: UIView!
    
    var cchess = CChess()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cchess.reset()
        boardView.shadowPieces = cchess.pieces
    }

    @IBAction func reset(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func flipPieceImages(_ sender: UIBarButtonItem) {
    }
}

