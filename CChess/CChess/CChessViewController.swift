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
    private var isRedDevice = true
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
    
    /*
     Don't move this function to model since a button could also trigger withdrawing.
     */
    private func isWithdrawing(move: Move) -> Bool {
        guard let lastMovedPiece = cchess.lastMovedPiece, let movingPiece = pieceAt(col: move.fC, row: move.fR) else {
            return false
        }
        
        return movingPiece == lastMovedPiece && cchess.redTurn != movingPiece.isRed && pieceAt(col: move.tC, row: move.tR) == nil
    }
    
    private func resetLocally() {
        cchess.initializeGame()
        boardView.shadowPieces = cchess.pieces
        boardView.blackAtTop = true
        boardView.sharingDevice = false
        isRedDevice = true
        upperPlayerColorView.backgroundColor = .black
        lowerPlayerColorView.backgroundColor = .white
        firstMoveMade = false
        updateWhoseTurnColorsLocally(redTurn: cchess.redTurn)
        boardView.isUserInteractionEnabled = true
        boardView.setNeedsDisplay()
    }
    
    private func updateWhoseTurnColorsLocally(redTurn: Bool) {
        var whoseTurnView: UIView
        var waiterView: UIView
        if isRedDevice {
            whoseTurnView = redTurn ? lowerPlayerView : upperPlayerView
            waiterView = redTurn ? upperPlayerView : lowerPlayerView
        } else {
            whoseTurnView = redTurn ? upperPlayerView : lowerPlayerView
            waiterView = redTurn ? lowerPlayerView : upperPlayerView
        }
        
        UIViewPropertyAnimator(duration: 1.0, curve: .easeInOut) { // iOS 10
            whoseTurnView.backgroundColor = self.whoseTurnColor
            waiterView.backgroundColor = self.waitingColor
        }.startAnimation()
    }
    
    private func updateMoveLocally(move: Move) {
        guard cchess.isHandicap(move: move) || cchess.isValid(move: move, isRed: cchess.redTurn) else {
            return
        }
        
        cchess.movePiece(move: move)
        boardView.shadowPieces = cchess.pieces
        boardView.setNeedsDisplay()
        
        if !cchess.isHandicap(move: move) {
            updateWhoseTurnColorsLocally(redTurn: cchess.redTurn)
        }
        
        audioPlayer.play()
    }
    
    private func sendMoveToPeers(move: Move, targetRank: Character? = nil) {
        var promotionPostfix = ""
        if let targetRank = targetRank {
            promotionPostfix = ":\(targetRank)"
        }
        let msg = "\(move.fC):\(move.fR):\(move.tC):\(move.tR)\(promotionPostfix)"
        nearbyService.send(msg: msg)
        if !cchess.isHandicap(move: move) {
            firstMoveMade = true
        }
    }
    
    func updateWithdrawLocally() {
        cchess.withdraw()
        boardView.shadowPieces = cchess.pieces
        updateWhoseTurnColorsLocally(redTurn: cchess.redTurn)
        boardView.setNeedsDisplay()
    }
    
    func sendWithdrawToPeers() {
        nearbyService.send(msg: "withdraw")
    }
    
    private func avoidAlertCrashOnPad(alertController: UIAlertController) {
        if let popoverPresentationController = alertController.popoverPresentationController {
            popoverPresentationController.permittedArrowDirections = .init(rawValue: 0)
            popoverPresentationController.sourceView = self.view
            popoverPresentationController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
        }
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
        guard let movingPiece = cchess.pieceAt(col: move.fC, row: move.fR),
              cchess.isHandicap(move: move) ||
                isWithdrawing(move: move) ||
                movingPiece.isRed == cchess.redTurn else {
            return
        }
        
        if isolated {
            if isWithdrawing(move: move) {
                updateWithdrawLocally()
            } else {
                updateMoveLocally(move: move)
            }
        } else {
            if isWithdrawing(move: move) {
                updateWithdrawLocally()
                sendWithdrawToPeers()
            } else if isRedDevice == cchess.redTurn {
                updateMoveLocally(move: move)
                sendMoveToPeers(move: move)
            }
        }
    }
    
    func pieceAt(col: Int, row: Int) -> CChessPiece? {
        return cchess.pieceAt(col: col, row: row)
    }
}
