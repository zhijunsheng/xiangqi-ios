//
//  ViewController.swift
//  xiangqi
//
//  Created by Donald Sheng on 2018-03-02.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var cchessGame = CChessGame()
    
    @IBOutlet weak var boardView: BoardView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cchessGame.resetGame()
        boardView.shadowPieces = cchessGame.pieces
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

