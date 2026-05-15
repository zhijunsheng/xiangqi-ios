//
//  CChessViewController.swift
//  CChess
//
//  Created by Zhijun Sheng on 2020-07-14.
//

import UIKit
import AVFoundation

class CChessViewController: UIViewController {
    
    private var greenGameBoardAspectConstraint: NSLayoutConstraint?
    private let gtButton = UIButton(type: .custom)
    
    private static let serviceType = "gt-cchess"
    let nearbyService = NearbyService(serviceType: serviceType)
    
    let whoseTurnColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
    let waitingColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    
    var cchess = CChess()
    
    @IBOutlet weak var boardView: BoardUIView!
    @IBOutlet weak var peerHomeView: UIView!
    @IBOutlet weak var peerLabel: UILabel!
    @IBOutlet weak var upperPlayerColorView: UIView!
    
    @IBOutlet weak var youHomeView: UIView!
    @IBOutlet weak var youLabel: UILabel!
    @IBOutlet weak var lowerPlayerColorView: UIView!
    
//    @IBOutlet weak var flipImageBarButtonItem: UIBarButtonItem!
    
    var audioPlayer: AVAudioPlayer?
    
    private var isolated = true
    private var isRedDevice = true
    private var firstMoveMade = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = Bundle.main.url(forResource: "drop", withExtension: "wav")!
        audioPlayer = try? AVAudioPlayer(contentsOf: url)
        
        boardView.cchessDelegate = self
        nearbyService.nearbyServiceDelegate = self
        
        resetToSingleDeviceMode()
        updateGreenGameBoardAspectReation()
        setupGTButton()
    }
    
    private func updateGreenGameBoardAspectReation() {
        greenGameBoardAspectConstraint?.isActive = false
        
        let isPad = traitCollection.horizontalSizeClass == .regular &&
                    traitCollection.verticalSizeClass == .regular
        
        let ratio: CGFloat = isPad ? (10.0 / 11.5) : (10.0 / 13.0)
        
        greenGameBoardAspectConstraint = boardView.widthAnchor.constraint(
            equalTo: boardView.heightAnchor,
            multiplier: ratio
        )
        
        greenGameBoardAspectConstraint?.isActive = true
    }
    
    private func setupGTButton() {
        
        gtButton.setImage(UIImage(named: "goldenThumb"), for: .normal)
        gtButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        
        // Position: top-right corner
        gtButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Optional subtle styling
        gtButton.backgroundColor = UIColor.black.withAlphaComponent(0.15)
        gtButton.layer.cornerRadius = 22
        gtButton.clipsToBounds = true
        
        // Action
        gtButton.addTarget(self,
                              action: #selector(gtButtonTapped),
                              for: .touchUpInside)
        
        view.addSubview(gtButton)
        
        NSLayoutConstraint.activate([
            gtButton.widthAnchor.constraint(equalToConstant: 44),
            gtButton.heightAnchor.constraint(equalToConstant: 44),
            
            gtButton.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 12
            ),
            
            gtButton.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -12
            )
        ])
    }
    
    @objc
    private func gtButtonTapped() {
        
        let alert = UIAlertController(
            title: nil,
            message: nil,
            preferredStyle: .actionSheet
        )

        alert.addAction(
            UIAlertAction(
                title: "Reset to Solo Play",
                style: .default,
                handler: { _ in
                    self.resetToSoloPlay()
                }
            )
        )
        
        alert.addAction(
            UIAlertAction(
                title: "Search Nearby",
                style: .default,
                handler: { _ in
                    self.searchNearby()
                }
            )
        )
        
        alert.addAction(
            UIAlertAction(
                title: "Flip",
                style: .default,
                handler: { _ in
                    self.flipPieceImages()
                }
            )
        )
        
        alert.addAction(
            UIAlertAction(
                title: "About",
                style: .default,
                handler: { _ in
                    self.about()
                }
            )
        )
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))

        // iPad safety
        if let popover = alert.popoverPresentationController {
            popover.sourceView = gtButton
            popover.sourceRect = gtButton.bounds
        }

        present(alert, animated: true)
    }
    
    private func searchNearby() { // FIXME: still searching nearby
        guard isolated else { return }
        nearbyService.initService(serviceType: CChessViewController.serviceType)
        peerLabel.text = "Peer"
        youLabel.text = "Searching nearby…"
    }
    
    private func resetToSoloPlay() {
        let alertController = UIAlertController(
            title: "Restart Game?",
            message: "Current progress will be lost.",
            preferredStyle: .alert
        )
        
        alertController.addAction(
            UIAlertAction(title: "Restart", style: .destructive) {_ in
                self.nearbyService.stopService()
                self.resetToSingleDeviceMode()
            }
        )
        alertController.addAction(
            UIAlertAction(title: "Cancel", style: .cancel)
        )
        
        avoidAlertCrashOnPad(alertController: alertController)
        present(alertController, animated: true)
    }
    
    private func flipPieceImages() {
        guard !boardView.sharingDevice && !firstMoveMade else {
            return
        }
        boardView.sharingDevice = true
        peerLabel.text = "Black"
        youLabel.text = "Red"
        peerLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        boardView.setNeedsDisplay()
    }
    
    private func about() {
        let info =
        """

        Version 1.2.1

        Golden Xiangqi is designed for comfortable face-to-face play, nearby multiplayer, teaching, and casual games anywhere.

        Features

        • Shared-device play with reversible board orientation
        • Nearby multiplayer on two devices
        • Smooth piece dragging with touch guidance
        • Full-screen, distraction-free game board
        • Lightweight and easy to use

        Handicap Play

        Before the first move, pieces can be dragged off the board to create handicap games.

        Gameplay Notes

        • Red moves first
        • The board can be flipped for opposite-side viewing
        • Designed for quick local play and instant rematches

        Built for family play, teaching, practice, and friendly competition.

        Designed and developed by Gold Thumb Inc.

        © Gold Thumb Inc.

        """
        let alertController = UIAlertController(
            title: "About",
            message: info,
            preferredStyle: .alert
        )
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        avoidAlertCrashOnPad(alertController: alertController)
        present(alertController, animated: true, completion: nil)
    }
    
    /*
     Don't move this function to model since a button could also trigger withdrawing.
     */
    private func isWithdrawing(move: Move) -> Bool {
        guard let lastMovedPiece = cchess.lastMovedPiece, let movingPiece = pieceAt(col: move.fC, row: move.fR) else {
            return false
        }
        
        return movingPiece == lastMovedPiece && cchess.whoseTurn != movingPiece.player && pieceAt(col: move.tC, row: move.tR) == nil
    }
    
    private func resetToSingleDeviceMode() {
        peerLabel.text = "Black"
        youLabel.text = "Red"
        peerLabel.transform = .identity
//        flipImageBarButtonItem.isEnabled = true
        cchess.initializeGame()
        boardView.shadowPieces = cchess.pieces
        boardView.blackAtTop = true
        
        boardView.sharingDevice = false
        isolated = true
        isRedDevice = true
        firstMoveMade = false

        upperPlayerColorView.backgroundColor = .black
        lowerPlayerColorView.backgroundColor = .red
        updateWhoseTurnColorsLocally(player: cchess.whoseTurn)
        boardView.isUserInteractionEnabled = true
        boardView.setNeedsDisplay()
    }
    
    private func updateWhoseTurnColorsLocally(player: Player) {
        var whoseTurnView: UIView
        var waiterView: UIView
        if isRedDevice {
            whoseTurnView = player == .red ? youHomeView : peerHomeView
            waiterView = player == .red ? peerHomeView : youHomeView
        } else {
            whoseTurnView = player == .red ? peerHomeView : youHomeView
            waiterView = player == .red ? youHomeView : peerHomeView
        }
        
        if #available(iOS 10.0, *) {
            UIViewPropertyAnimator(duration: 1.0, curve: .easeInOut) { // iOS 10
                whoseTurnView.backgroundColor = self.whoseTurnColor
                waiterView.backgroundColor = self.waitingColor
            }.startAnimation()
        } else {
            whoseTurnView.backgroundColor = self.whoseTurnColor
            waiterView.backgroundColor = self.waitingColor
        }
    }
    
    private func updateMoveLocally(move: Move) {
        guard cchess.isHandicap(move: move) || cchess.isValid(mv: move, player: cchess.whoseTurn) else {
            return
        }
        
        cchess.movePiece(move: move)
        boardView.shadowPieces = cchess.pieces
        boardView.setNeedsDisplay()
        
        if !cchess.isHandicap(move: move) {
            updateWhoseTurnColorsLocally(player: cchess.whoseTurn)
        }
        
        audioPlayer?.play()
    }
    
    private func sendMoveToPeers(move: Move) {
        let msg = "\(move.fC):\(move.fR):\(move.tC):\(move.tR)"
        nearbyService.send(msg: msg)
        if !cchess.isHandicap(move: move) {
            firstMoveMade = true
        }
    }
    
    func updateWithdrawLocally() {
        cchess.withdraw()
        boardView.shadowPieces = cchess.pieces
        updateWhoseTurnColorsLocally(player: cchess.whoseTurn)
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
    
    func connectedWith(peer: String) {
//        prepareNewRound() TODO: add this func
        
        isolated = false
//        flipImageBarButtonItem.isEnabled = false
        boardView.isUserInteractionEnabled = true
        peerLabel.text = peer
        youLabel.text = "You"
        
        let info = firstMoveMade ? "" : "The first player will play Red. To create handicap games (让子棋), simply drag pieces off the board before the first move."
        let alertController = UIAlertController(
            title: "\(peer) connected.",
            message: "\(info)",
            preferredStyle: .alert
        )
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        
        avoidAlertCrashOnPad(alertController: alertController)
        present(alertController, animated: true, completion: nil)
    }
    
    func disconnectedFrom(peer: String) {
        isolated = true
        boardView.isUserInteractionEnabled = false
        peerLabel.text = peer
        
        let info = "It may be reconnected in a few seconds."
        let alertController = UIAlertController(title: "\(peer) disconnected.", message: "\(info)", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Got it.", style: .default))
        
        avoidAlertCrashOnPad(alertController: alertController)
        present(alertController, animated: true, completion: nil)
    }
    
    func didReceive(msg: String) {
        DispatchQueue.main.async {
            if msg == "withdraw" {
                self.updateWithdrawLocally()
            } else {
                let moveArr = msg.components(separatedBy: ":")
                if let fromCol = Int(moveArr[0]), let fromRow = Int(moveArr[1]), let toCol = Int(moveArr[2]), let toRow = Int(moveArr[3]) {
                    let move = Move(fC: fromCol, fR: fromRow, tC: toCol, tR: toRow)
                    if !self.firstMoveMade && !self.cchess.isHandicap(move: move) {
                        self.firstMoveMade = true
                        self.boardView.blackAtTop = false
                        self.isRedDevice = false
                        self.upperPlayerColorView.backgroundColor = .red
                        self.lowerPlayerColorView.backgroundColor = .black
                        self.peerHomeView.backgroundColor = self.whoseTurnColor
                        self.youHomeView.backgroundColor = self.waitingColor
                        self.boardView.setNeedsDisplay()
                    }
                    
                    if #available(iOS 10.0, *) {
                        self.boardView.animate(move: move) { _ in
                            self.updateMoveLocally(move: move)
                        }
                    } else {
                        self.updateMoveLocally(move: move)
                    }
                }
            }
        }
    }
}

extension CChessViewController: CChessDelegate {
    func play(with move: Move) {
        guard let movingPiece = cchess.pieceAt(col: move.fC, row: move.fR),
              cchess.isHandicap(move: move) ||
                isWithdrawing(move: move) ||
                movingPiece.player == cchess.whoseTurn else {
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
            } else if isRedDevice == (cchess.whoseTurn == .red) {
                updateMoveLocally(move: move)
                sendMoveToPeers(move: move)
            }
        }
    }
    
    func pieceAt(col: Int, row: Int) -> CChessPiece? {
        return cchess.pieceAt(col: col, row: row)
    }
}
