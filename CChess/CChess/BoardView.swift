//
//  BoardView.swift
//  CChess
//
//  Created by Zhijun Sheng on 2020-07-14.
//

import UIKit

class BoardView: UIView {
    let cols: Int = 9
    let rows: Int = 10

    private let boardRatio: CGFloat = 1.1
    private var pieceRatio: CGFloat = 1.0
    private var movingPieceRatio: CGFloat = 1.3
    var originX: CGFloat = -10
    var originY: CGFloat = -10
    var cellSide: CGFloat = -10
    
    var shadowPieces: Set<CChessPiece> = [] {
        didSet {
            backgroundImage = nil
        }
    }
    private var backgroundImage: UIImage?
    
    var cchessDelegate: CChessDelegate? = nil
    
    var movingPieceFromCol: Int? = nil
    var movingPieceFromRow: Int? = nil
    
    var movingImage: UIImage? = nil
    var movingPieceX: CGFloat = -1
    var movingPieceY: CGFloat = -1
    
    var blackAtTop = true
    
    var imageByName: [String: UIImage] = [:]
    var sharingDevice = false {
        didSet {
            imageByName.removeAll()
            backgroundImage = nil
        }
    }

    override func draw(_ rect: CGRect) {
        if UIDevice.current.userInterfaceIdiom == .phone {
            pieceRatio = 1.2
            movingPieceRatio = 1.5
        } else {
            pieceRatio = 1.1
            movingPieceRatio = 1.2
        }
        
        cellSide = bounds.width * boardRatio / 10
        originX = (bounds.width - 8 * cellSide) / 2
        originY = (bounds.height - 9 * cellSide) / 2
        
        drawBoard()
        drawPieces()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let first = touches.first!
        let fingerLocation = first.location(in: self)
        let fromCol = p2pX(Int((fingerLocation.x - originX) / cellSide + 0.5))
        let fromRow = p2pY(Int((fingerLocation.y - originY) / cellSide + 0.5))
        movingPieceFromCol = fromCol
        movingPieceFromRow = fromRow
        
        if let movingPiece = cchessDelegate?.pieceAt(col: fromCol, row: fromRow) {
            movingImage = image(named: movingPiece.imageName)
        }
        backgroundImage = createBackgroundImage()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let first = touches.first!
        let fingerLocation = first.location(in: self)
        movingPieceX = fingerLocation.x
        movingPieceY = fingerLocation.y
        setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let first = touches.first!
        let fingerLocation = first.location(in: self)
        
        let toCol: Int = p2pX(Int((fingerLocation.x - originX) / cellSide + 0.5))
        let toRow: Int = p2pY(Int((fingerLocation.y - originY) / cellSide + 0.5))
        
        if let fromCol = movingPieceFromCol, let fromRow = movingPieceFromRow, fromCol != toCol || fromRow != toRow {
            cchessDelegate?.play(with: Move(fC: fromCol, fR: fromRow, tC: toCol, tR: toRow))
        }
        movingImage = nil
        movingPieceFromCol = nil
        movingPieceFromRow = nil
        backgroundImage = createBackgroundImage()
        setNeedsDisplay()
    }
    
    private func drawBoard() {
        let margin = cellSide/15
        UIBezierPath(rect: CGRect(x: originX - margin, y: originY - margin, width: CGFloat(cols - 1) * cellSide + 2 * margin, height: CGFloat(rows - 1) * cellSide + 2 * margin)).stroke()
        
        path(in: bounds).stroke()
        
        for i in 0..<2 {
            drawStarAt(col: 1 + i * 6, row: 2)
            drawStarAt(col: 1 + i * 6, row: 7)
            drawHalfStarAt(col: 0, row: 3, left: false)
            drawHalfStarAt(col: 0, row: 6, left: false)
            drawHalfStarAt(col: 8, row: 3, left: true)
            drawHalfStarAt(col: 8, row: 6, left: true)
        }
        for i in 0..<3 {
            drawStarAt(col: 2 + i * 2, row: 3)
            drawStarAt(col: 2 + i * 2, row: 6)
        }
    }
    
    private func drawHalfStarAt(col: Int, row: Int, left: Bool) {
        let gap = cellSide / 9
        let bar = cellSide / 4
        let hSign: CGFloat = left ? -1 : 1;
        let tipX = originX + CGFloat(col) * cellSide + hSign * gap
        let path = UIBezierPath()
        for i in 0..<2 {
            let vSign: CGFloat = CGFloat(-1 + i * 2)
            let tipY = originY + CGFloat(row) * cellSide + vSign * gap
            path.move(to: CGPoint(x: tipX, y: tipY))
            path.addLine(to: CGPoint(x: tipX + hSign * bar, y: tipY))
            path.move(to: CGPoint(x: tipX, y: tipY))
            path.addLine(to: CGPoint(x: tipX , y: tipY + vSign * bar))
        }
        path.stroke()
    }
    
    private func drawStarAt(col: Int, row: Int) {
        drawHalfStarAt(col: col, row: row, left: true)
        drawHalfStarAt(col: col, row: row, left: false)
    }
    
    @available(iOS 10.0, *)
    func animate(move: Move, _ completion: @escaping (UIViewAnimatingPosition) -> Void) {
        guard let cchess = cchessDelegate, let piece = cchess.pieceAt(col: move.fC, row: move.fR) else {
            return
        }
        let pieceImageView = UIImageView(image: image(named: piece.imageName))
        addSubview(pieceImageView)
        let normalBeginningFrame =
            CGRect(x: originX + CGFloat(p2pX(piece.col)) * cellSide - cellSide/2,
                   y: originY + CGFloat(p2pY(piece.row)) * cellSide - cellSide/2,
                   width: cellSide,
                   height: cellSide)
        pieceImageView.frame = imageRect(normalRect: normalBeginningFrame, ratio: pieceRatio)
        let moveAnimator = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut) {
            let normalEnddingFrame =
                CGRect(x: self.originX + CGFloat(self.p2pX(move.tC)) * self.cellSide - self.cellSide/2,
                       y: self.originY + CGFloat(self.p2pY(move.tR)) * self.cellSide - self.cellSide/2,
                       width: self.cellSide,
                       height: self.cellSide)
            pieceImageView.frame = self.imageRect(normalRect: normalEnddingFrame, ratio: self.movingPieceRatio)
        }
        moveAnimator.addCompletion { animPos in
            pieceImageView.removeFromSuperview()
            completion(animPos)
        }
        moveAnimator.startAnimation()
    }
    
    private func drawPieces() {
        if backgroundImage == nil {
            backgroundImage = createBackgroundImage()
        }
        backgroundImage?.draw(at: CGPoint.zero)
        
        if let movingImage = movingImage {
            drawCrosshair(x: movingPieceX, y: movingPieceY)
            movingImage.draw(in: imageRect(center: CGPoint(x: movingPieceX, y: movingPieceY), normalSize: CGSize(width: cellSide, height: cellSide), ratio: movingPieceRatio))
        }
    }
    
    private func drawCrosshair(x: CGFloat, y: CGFloat) {
        #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1).setStroke()
        let radius = 1.5 * cellSide
        let circle = UIBezierPath(arcCenter: CGPoint(x: x, y: y), radius: radius, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        circle.lineWidth = 3
        circle.stroke()
        
        let cross = UIBezierPath()
        let half = 1.3 * radius
        cross.move(to: CGPoint(x: x - half, y: y))
        cross.addLine(to: CGPoint(x: x + half, y: y))
        cross.move(to: CGPoint(x: x, y: y - half))
        cross.addLine(to: CGPoint(x: x, y: y + half))
        cross.lineWidth = 3
        cross.stroke()
    }
    
    private func imageRect(normalRect: CGRect, ratio: CGFloat) -> CGRect {
        let center = CGPoint(x: normalRect.midX, y: normalRect.midY)
        let normalSize = CGSize(width: normalRect.width, height: normalRect.height)
        return imageRect(center: center, normalSize: normalSize, ratio: ratio)
    }
    
    private func imageRect(center: CGPoint, normalSize: CGSize, ratio: CGFloat) -> CGRect {
        let w = ratio * normalSize.width
        let h = ratio * normalSize.height
        return CGRect(x: center.x - w/2, y: center.y - h/2, width: w, height: h)
    }
    
    private func image(named name: String) -> UIImage? {
        if let stored = imageByName[name] {
            return stored
        }
        
        var img = UIImage(named: name)
        if name.first == "b", let actualImg = img, let cgImg = actualImg.cgImage {
            img = UIImage(cgImage: cgImg, scale: 1.0, orientation: sharingDevice ? .down : .up)
        }
        
        imageByName[name] = img
        return img
    }

    private func path(in rect: CGRect) -> UIBezierPath {
        let path = UIBezierPath()
        let origX = originX
        let origY = originY
        let cellWidth = cellSide
        let cellHeight = cellSide

        for row in 0..<rows {
            path.move(to: CGPoint(x: origX, y: origY + CGFloat(row) * cellHeight ))
            path.addLine(to: CGPoint(x: origX + CGFloat(cols - 1) * cellWidth, y: origY + CGFloat(row) * cellHeight))
        }

        for col in 0..<cols {
            path.move(to: CGPoint(x: origX + CGFloat(col) * cellWidth, y: origY))
            path.addLine(to: CGPoint(x: origX + CGFloat(col) * cellWidth, y: origY + 4 * cellHeight))

            path.move(to: CGPoint(x: origX + CGFloat(col) * cellWidth, y: origY + 5 * cellHeight))
            path.addLine(to: CGPoint(x: origX + CGFloat(col) * cellWidth, y: origY + 9 * cellHeight))
        }

        for i in 0..<2 {
            path.move(to: CGPoint(x: origX + 3 * cellWidth, y: origY + CGFloat(i) * 7 * cellHeight))
            path.addLine(to: CGPoint(x: origX + 5 * cellWidth, y: origY + CGFloat(2 + i * 7) * cellHeight))
            path.move(to: CGPoint(x: origX + 5 * cellWidth, y: origY + CGFloat(i) * 7 * cellHeight))
            path.addLine(to: CGPoint(x: origX + 3 * cellWidth, y: origY + CGFloat(2 + i * 7) * cellHeight))

            path.move(to: CGPoint(x: origX + CGFloat(i) * 8 * cellWidth, y: origY + 4 * cellHeight))
            path.addLine(to: CGPoint(x: origX + CGFloat(i) * 8 * cellWidth, y: origY + 5 * cellHeight))
        }
        return path
    }
    
    private func p2pX(_ col: Int) -> Int { // p2p: peer to peer
        return blackAtTop ? col : cols - 1 - col
    }

    private func p2pY(_ row: Int) -> Int {
        return blackAtTop ? row : rows - 1 - row
    }
    
    private func drawPiece(piece: CChessPiece) {
        let normalRect = CGRect(x: originX + CGFloat(p2pX(piece.col)) * cellSide - cellSide/2, y: originY + CGFloat(p2pY(piece.row)) * cellSide - cellSide/2, width: cellSide, height: cellSide)
        let imgRect = imageRect(normalRect: normalRect, ratio: pieceRatio)
        image(named: piece.imageName)?.draw(in: imgRect)
    }
    
    private func createBackgroundImage() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(bounds.size, true, 0)
        UIColor.white.setFill()
        UIBezierPath(rect: bounds).fill()
        drawBoard()
        for piece in shadowPieces where movingPieceFromCol != piece.col || movingPieceFromRow != piece.row {
            drawPiece(piece: piece)
        }
        let backgroundImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return backgroundImage
    }
}
