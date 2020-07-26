//
//  BoardView.swift
//  xiangqi
//
//  Created by Halwong on 2018/11/29.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {
    let rows = 10
    let cols = 9
    let percent: CGFloat = 0.95
    let panningMargin: CGFloat = 0.0
    
    var originX: CGFloat = -100000.0
    var originY: CGFloat = -100000.0
    var cellSide: CGFloat = 28
    let gap: CGFloat = 5
    let outerFrameLineWidth: CGFloat = 3
    var intervalGap: CGFloat = 9
    var shortLine: CGFloat = 18
    var pieces: Set<XiangqiPiece> = Set<XiangqiPiece>()
    var xiangqiDelegate: XiangqiDelegate?
    var touchesBeganLocation: CGPoint?
//    var fromCol: Int
//    var fromRow: Int
    
    var movingPieceLocation: CGPoint?
    var movingPieceImage: UIImage?

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first!
        touchesBeganLocation = touch.location(in: self)
//        fromCol = Utils.xyToColRow(xy: touchesBeganLocation.x, orgXY: originX - cellSide / 2, cellSide: cellSide, margin: panningMargin)
//        fromRow
        guard
            let touchesBeganLocation = touchesBeganLocation,
            let fromCol = Utils.xyToColRow(xy: touchesBeganLocation.x, orgXY: originX - cellSide / 2, cellSide: cellSide, margin: panningMargin),
            let fromRow = Utils.xyToColRow(xy: touchesBeganLocation.y, orgXY: originY - cellSide / 2, cellSide: cellSide, margin: panningMargin) else {
            return
        }
        
        guard let piece = xiangqiDelegate?.pieceAt(col: fromCol, row: fromRow) else {
            return
        }
        
        movingPieceImage = image(piece: piece)
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchesBeganLocation = touchesBeganLocation else {
            return
        }
        
        let touch = touches.first!
        let touchesEndedLocation = touch.location(in: self)
        print(touchesEndedLocation)
        
        guard
            let fromCol = Utils.xyToColRow(xy: touchesBeganLocation.x, orgXY: originX - cellSide / 2, cellSide: cellSide, margin: panningMargin),
            let fromRow = Utils.xyToColRow(xy: touchesBeganLocation.y, orgXY: originY - cellSide / 2, cellSide: cellSide, margin: panningMargin),
            let toCol = Utils.xyToColRow(xy: touchesEndedLocation.x, orgXY: originX - cellSide / 2, cellSide: cellSide, margin: panningMargin),
            let toRow = Utils.xyToColRow(xy: touchesEndedLocation.y, orgXY: originY - cellSide / 2, cellSide: cellSide, margin: panningMargin) else {
                return
        }
        
        xiangqiDelegate?.movePiece(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        movingPieceImage = nil
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        movingPieceLocation = touch.location(in: self)
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        var smaller = bounds.width
        if bounds.width > bounds.height {
            smaller = bounds.height
        }
        
        cellSide = smaller * percent / CGFloat(rows - 1)
        originX = (bounds.width - cellSide * CGFloat(cols - 1)) / 2
        originY = (bounds.height - cellSide * CGFloat(rows - 1)) / 2
        
        drawBoard(orgX: originX, orgY: originY)
        drawPieces(orgX: originX, orgY: originY)
    }
    
    func drawPieces(orgX: CGFloat, orgY: CGFloat) {
        for piece in pieces {
            drawPiece(orgX: orgX, orgY: orgY, piece: piece)
        }
        
        guard let movingPieceLocation = movingPieceLocation else {
            return
        }
        
        
        
        movingPieceImage?.draw(in: CGRect(x: movingPieceLocation.x - cellSide / 2, y: movingPieceLocation.y - cellSide / 2, width: cellSide, height: cellSide))
    }
    
    func drawPiece(orgX: CGFloat, orgY: CGFloat, piece: XiangqiPiece) {
        
        image(piece: piece)?.draw(in: CGRect(x: orgX + cellSide * CGFloat(piece.col) - cellSide / 2, y: orgY + cellSide * CGFloat(piece.row) - cellSide / 2, width: cellSide, height: cellSide))
    }
    
    func image(piece: XiangqiPiece) -> UIImage? {
        guard let pieceImage = UIImage(named: piece.imgName), let cgImg = pieceImage.cgImage else {
            return nil
        }
        var image: UIImage
        
        if piece.isRed {
            image = UIImage(cgImage: cgImg, scale: 1, orientation: .down)
        } else {
            image = pieceImage
        }
        return image
    }
    
    func drawQuarterStar(orgX: CGFloat, orgY: CGFloat, locationX: Int, locationY: Int, isLeftHalf: Bool, isUpperHalf: Bool) {
        var sign0: CGFloat
        var sign1: CGFloat
        if isLeftHalf && isUpperHalf {
            sign0 = -1
            sign1 = -1
        } else if isLeftHalf && !isUpperHalf {
            sign0 = 1
            sign1 = -1
        } else if !isLeftHalf && isUpperHalf {
            sign0 = -1
            sign1 = 1
        } else {
            sign0 = 1
            sign1 = 1
        }
        
        let pencil = UIBezierPath()
        pencil.move(to: CGPoint(x: orgX + cellSide * CGFloat(locationX) + intervalGap * sign1, y: orgY + cellSide * CGFloat(locationY) + shortLine * sign0 + intervalGap * sign0))
        pencil.addLine(to: CGPoint(x: orgX + cellSide * CGFloat(locationX) + intervalGap * sign1, y: orgY + cellSide * CGFloat(locationY) + intervalGap * sign0))
        pencil.addLine(to: CGPoint(x: orgX + cellSide * CGFloat(locationX) + shortLine * sign1 + intervalGap * sign1, y: orgY + cellSide * CGFloat(locationY) + intervalGap * sign0))
        
        pencil.stroke()
    }
    
    func drawHalfStar(orgX: CGFloat, orgY: CGFloat, locationX: Int, locationY: Int, isLeftHalf: Bool) {
        let pencil = UIBezierPath()
        if isLeftHalf {
            drawQuarterStar(orgX: orgX, orgY: orgY, locationX: locationX, locationY: locationY, isLeftHalf: true, isUpperHalf: true)
            drawQuarterStar(orgX: orgX, orgY: orgY, locationX: locationX, locationY: locationY, isLeftHalf: true, isUpperHalf: false)
        } else {
            drawQuarterStar(orgX: orgX, orgY: orgY, locationX: locationX, locationY: locationY, isLeftHalf: false, isUpperHalf: true)
            drawQuarterStar(orgX: orgX, orgY: orgY, locationX: locationX, locationY: locationY, isLeftHalf: false, isUpperHalf: false)
        }
        
        pencil.stroke()
    }
    
    func drawLines(orgX: CGFloat, orgY: CGFloat) {
        for i in 0 ..< rows {
            let pencil = UIBezierPath()
            pencil.move(to: CGPoint(x: orgX, y: orgY + cellSide * CGFloat(i)))
            pencil.addLine(to: CGPoint(x: orgX + cellSide * CGFloat(cols - 1), y: orgY + cellSide * CGFloat(i)))

            pencil.stroke()
        }
    }
    
    func drawOuterFrame(orgX: CGFloat, orgY: CGFloat) {
        let pen = UIBezierPath()
        pen.move(to: CGPoint(x: orgX - gap, y: orgY - gap))
        pen.addLine(to: CGPoint(x: orgX + cellSide * CGFloat(cols - 1) + gap, y: orgY - gap))
        pen.addLine(to: CGPoint(x: orgX + cellSide * CGFloat(cols - 1) + gap, y: orgY + cellSide * CGFloat(rows - 1) + gap))
        pen.addLine(to: CGPoint(x: orgX - gap, y: orgY + cellSide * CGFloat(rows - 1) + gap))
        pen.close()
        pen.lineWidth = outerFrameLineWidth
        pen.stroke()
    }
    
    func drawVerticalLines(orgX: CGFloat, orgY: CGFloat, isUpperHalf: Bool) {
        let pen = UIBezierPath()
        var verticalOffset = 0
        if !isUpperHalf {
            verticalOffset = 5
        }
        for i in 0 ..< cols {
            if i == 0 || i == 8 {
                pen.move(to: CGPoint(x: orgX + cellSide * CGFloat(i), y: orgY))
                pen.addLine(to: CGPoint(x: orgX + cellSide * CGFloat(i), y: orgY + cellSide * 9))
            } else {
                pen.move(to: CGPoint(x: orgX + cellSide * CGFloat(i), y: orgY + cellSide * CGFloat(verticalOffset)))
                pen.addLine(to: CGPoint(x: orgX + cellSide * CGFloat(i), y: orgY + cellSide * CGFloat((rows - 2) / 2 + verticalOffset)))
            }
            pen.stroke()
        }
    }
    
    func drawBoard(orgX: CGFloat, orgY: CGFloat) {
        
        drawLines(orgX: orgX, orgY: orgY)
        drawOuterFrame(orgX: orgX, orgY: orgY)
        drawVerticalLines(orgX: orgX, orgY: orgY, isUpperHalf: true)
        drawVerticalLines(orgX: orgX, orgY: orgY, isUpperHalf: false)

        for i in 0 ..< 2 {
            drawHalfStar(orgX: orgX, orgY: orgY, locationX: 1 + i * 6, locationY: 2, isLeftHalf: true)
            drawHalfStar(orgX: orgX, orgY: orgY, locationX: 1 + i * 6, locationY: 2, isLeftHalf: false)
            drawHalfStar(orgX: orgX, orgY: orgY, locationX: 1 + i * 6, locationY: 7, isLeftHalf: true)
            drawHalfStar(orgX: orgX, orgY: orgY, locationX: 1 + i * 6, locationY: 7, isLeftHalf: false)
        }
        
        for i in 0 ..< 4 {
            drawHalfStar(orgX: orgX, orgY: orgY, locationX: (i + 1) * 2, locationY: 3, isLeftHalf: true)
            drawHalfStar(orgX: orgX, orgY: orgY, locationX: (i + 1) * 2, locationY: 6, isLeftHalf: true)
            drawHalfStar(orgX: orgX, orgY: orgY, locationX: i * 2, locationY: 3, isLeftHalf: false)
            drawHalfStar(orgX: orgX, orgY: orgY, locationX: i * 2, locationY: 6, isLeftHalf: false)
        }
        
        let pen = UIBezierPath()
        pen.move(to: CGPoint(x: orgX + cellSide * 5, y: orgY))
        pen.addLine(to: CGPoint(x: orgX + cellSide * 3, y: orgY + cellSide * 2))
        
        pen.move(to: CGPoint(x: orgX + cellSide * 3, y: orgY))
        pen.addLine(to: CGPoint(x: orgX + cellSide * 5, y: orgY + cellSide * 2))
        
        pen.move(to: CGPoint(x: orgX + cellSide * 5, y: orgY + cellSide * 7))
        pen.addLine(to: CGPoint(x: orgX + cellSide * 3, y: orgY + cellSide * 9))
        
        pen.move(to: CGPoint(x: orgX + cellSide * 3, y: orgY + cellSide * 7))
        pen.addLine(to: CGPoint(x: orgX + cellSide * 5, y: orgY + cellSide * 9))
        
        pen.stroke()
    }
}
