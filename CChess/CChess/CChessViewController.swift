//
//  CChessViewController.swift
//  CChess
//
//  Created by Zhijun Sheng on 2020-07-14.
//

import UIKit
import AVFoundation

class CChessViewController: UIViewController {
    let nearbyService = NearbyService(serviceType: "gt-cchess")
    
    let whoseTurnColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
    let waitingColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    
    var cchess = CChess()
    
    @IBOutlet weak var boardView: BoardView!
    @IBOutlet weak var upperPlayerView: UIView!
    @IBOutlet weak var upperPlayerLabel: UILabel!
    @IBOutlet weak var upperPlayerColorView: UIView!
    
    @IBOutlet weak var lowerPlayerView: UIView!
    @IBOutlet weak var lowerPlayerLabel: UILabel!
    @IBOutlet weak var lowerPlayerColorView: UIView!
    
    var audioPlayer: AVAudioPlayer!
    
    private var isolated = true
    private var isWhiteDevice = true
    private var firstMoveMade = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = Bundle.main.url(forResource: "drop", withExtension: "wav")!
        audioPlayer = try? AVAudioPlayer(contentsOf: url)
        
        boardView.cchessDelegate = self
        nearbyService.nearbyServiceDelegate = self
        
        resetLocally()
    }

    @IBAction func reset(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func flipPieceImages(_ sender: UIBarButtonItem) {
    }
    
    private func resetLocally() {
        cchess.initializeGame()
        boardView.shadowPieces = cchess.pieces
        boardView.blackAtTop = true
        boardView.sharingDevice = false
        isWhiteDevice = true
        upperPlayerColorView.backgroundColor = .black
        lowerPlayerColorView.backgroundColor = .white
        firstMoveMade = false
//        updateWhoseTurnColorsLocally(whiteTurn: cchess.redTurn)
        boardView.isUserInteractionEnabled = true
        boardView.setNeedsDisplay()
    }
}

extension CChessViewController: NearbyServiceDelegate {
    func didReceive(msg: String) {
        
    }
    
    func connectedWith(peer: String) {
        
    }
    
    func disconnectedFrom(peer: String) {
        
    }
}

extension CChessViewController: CChessDelegate {
    func play(with move: Move) {
        
    }
    
    func pieceAt(col: Int, row: Int) -> CChessPiece? {
        return cchess.pieceAt(col: col, row: row)
    }
}
