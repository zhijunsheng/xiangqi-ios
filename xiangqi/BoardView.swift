import UIKit

class BoardView   : UIView {
    let rows      : Int                    = 10
    let cols      : Int                    = 9
    var originX   : CGFloat                = 25 // 25
    var originY   : CGFloat                = 25 // 25
    let height    : CGFloat                = 60 // 60
    let width     : CGFloat                = 71 // 71
    let gapX      : CGFloat                = 5
    let gapY      : CGFloat                = 5
    let shortLine : CGFloat                = 10
    var fromCol   : Int                    = -10
    var fromRow   : Int                    = -10
    var pieces    : Set<XiangqiBoardPiece> = Set<XiangqiBoardPiece>()
    
    override func draw(_ rect: CGRect) {
        originY = (bounds.height - CGFloat(rows - 1) * height) / 2
        originX = (bounds.width - CGFloat(cols - 1) * width) / 2
        
        drawStars()
        drawGrid()
        drawPieces()
    }
    func drawPieces() {
        for piece in pieces {
            let pieceImage = UIImage(named: piece.imageName)
            let pieceX = originX + CGFloat(piece.col) * width
            let pieceY = originY + CGFloat(piece.row) * height
            
            pieceImage?.draw(in: CGRect(x: pieceX - height / 2, y: pieceY - height / 2, width: height, height: height))
        }
        
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchOne = touches.first!
        let fingerLocation = touchOne.location(in: self)
        
        
        // try to figure out fromCol and fromRow, e.g (0, 0)
        fromCol = Int((fingerLocation.x - originX + width / 2) / width) // for 8.85，we want 9 instead 8, but how?
        fromRow = Int((fingerLocation.y - originY + height / 2) / height)
        print("from: (\(fromCol), \(fromRow))") // from . . .
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchMore = touches.first!
        let fingerlocation = touchMore.location(in: self)
        
        // try to figure out toCol and toRow, e.g (0, 1)
        let toCol : Int = Int((fingerlocation.x - originX + width / 2) / width)
        let toRow : Int = Int((fingerlocation.y - originY + height / 2) / height)
        print("from: (\(fromCol), \(fromRow)) to: (\(toCol), \(toRow))")
    }
    
    func drawGrid() {
        let b2 = UIBezierPath()
        for i in 0..<rows {
            
            b2.move(to: CGPoint(x: originX, y: height * CGFloat(i) + originY))
            b2.addLine(to: CGPoint(x: width * CGFloat(cols - 1) + originX, y: height * CGFloat(i) + originY))
            b2.stroke()
        }
        for i in 0..<2  {
            
            b2.move(to: CGPoint(x: originX + CGFloat(i) * CGFloat(cols - 1) * width, y: originY))
            b2.addLine(to: CGPoint(x: originX + CGFloat(i) * CGFloat(cols - 1) * width, y: height * CGFloat(rows - 1) + originY))
            b2.stroke()
        }
        for i in 1...7  {
            
            b2.move(to: CGPoint(x: originX + CGFloat(i) * 1 * width, y: originY))
            b2.addLine(to: CGPoint(x: originX + CGFloat(i) * 1 * width, y: height * 4 + originY))
            b2.stroke()
        }
        for i in 1...7  {
            
            b2.move(to: CGPoint(x: originX + CGFloat(i) * 1 * width, y: height * 5 + originY))
            b2.addLine(to: CGPoint(x: originX + CGFloat(i) * 1 * width, y: height * CGFloat(rows - 1) + originY))
            b2.stroke()
        }
        
        
        b2.move(to: CGPoint(x: width * 3 + originX, y: originY))
        b2.addLine(to: CGPoint(x: width * 5 + originX, y: height * 2 + originY))
        b2.stroke()
        
        // ================================================
        
      
        b2.move(to: CGPoint(x: width * 5 + originX, y: originY))
        b2.addLine(to: CGPoint(x: width * 3 + originX, y: height * 2 + originY))
        
        
        // =================================================
        
        
        b2.move(to: CGPoint(x: width * 3 + originX, y: height * 7 + originY))
        b2.addLine(to: CGPoint(x: width * 5 + originX, y: height * 9 + originY))
        
        
        // =================================================
        
        
        b2.move(to: CGPoint(x: width * 5 + originX, y: height * 7 + originY))
        b2.addLine(to: CGPoint(x: width * 3 + originX, y: height * 9 + originY))
       
        
        // =================================================
        
        
        b2.move(to: CGPoint(x: originX, y: originY + height * 4.5))
        b2.addLine(to: CGPoint(x: originX + width * 8, y: originY + height * 4.5))
        #colorLiteral(red: 0, green: 0.6235294118, blue: 0.9176470588, alpha: 1).setStroke()
        b2.stroke()
        
        
        
    }
    
    func drawStars() {
        drawStar(pointX : width + originX, pointY : height + height + originY)
        drawStar(pointX : width * 2 + originX, pointY : height * 3 + originY)
        drawStar(pointX : width * 4 + originX, pointY : height * 3 + originY)
        drawStar(pointX : width * 6 + originX, pointY : height * 3 + originY)
        drawStar(pointX : width * 7 + originX, pointY : height * 2 + originY)
        
        drawStar(pointX : width + originX, pointY : height * 7 + originY)
        drawStar(pointX : width * 2 + originX, pointY : height * 6 + originY)
        drawStar(pointX : width * 4 + originX, pointY : height * 6 + originY)
        drawStar(pointX : width * 6 + originX, pointY : height * 6 + originY)
        drawStar(pointX : width * 7 + originX, pointY : height * 7 + originY)
        
        drawLeftStar(pointX : width * 8 + originX, pointY : height * 3 + originY)
        drawLeftStar(pointX : width * 8 + originX, pointY : height * 6 + originY)
        
        drawRightStar(pointX : originX, pointY : height * 3 + originY)
        drawRightStar(pointX : originX, pointY : height * 6 + originY)
    }
    
    
    func drawStar(pointX : CGFloat, pointY : CGFloat) {
        let j10 = UIBezierPath()
        // bottom right
        j10.move(to: CGPoint(x: gapX + shortLine + pointX, y: gapY + pointY))
        j10.addLine(to: CGPoint(x: gapX + pointX, y: gapY + pointY))
        j10.addLine(to: CGPoint(x: gapX + pointX, y: gapY + shortLine + pointY))
        
        // top right
        j10.move(to: CGPoint(x: gapX + shortLine + pointX, y: -gapY + pointY))
        j10.addLine(to: CGPoint(x: gapX + pointX, y: -gapY + pointY))
        j10.addLine(to: CGPoint(x: gapX + pointX, y: -gapY + -shortLine + pointY))
        
        // bottom left
        j10.move(to: CGPoint(x: -gapX + -shortLine + pointX, y: gapY + pointY))
        j10.addLine(to: CGPoint(x: -gapX + pointX, y: gapY + pointY))
        j10.addLine(to: CGPoint(x: -gapX + pointX, y: gapY + shortLine + pointY))
        
        // top left
        j10.move(to: CGPoint(x: -gapX + -shortLine + pointX, y: -gapY + pointY))
        j10.addLine(to: CGPoint(x: -gapX + pointX, y: -gapY + pointY))
        j10.addLine(to: CGPoint(x: -gapX + pointX, y: -gapY + -shortLine + pointY))
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        j10.stroke()
    }
    
    func drawLeftStar(pointX : CGFloat, pointY : CGFloat) {
        
        let j10 = UIBezierPath()
        // bottom left
        j10.move(to: CGPoint(x: -gapX + -shortLine + pointX, y: gapY + pointY))
        j10.addLine(to: CGPoint(x: -gapX + pointX, y: gapY + pointY))
        j10.addLine(to: CGPoint(x: -gapX + pointX, y: gapY + shortLine + pointY))
        
        // top left
        j10.move(to: CGPoint(x: -gapX + -shortLine + pointX, y: -gapY + pointY))
        j10.addLine(to: CGPoint(x: -gapX + pointX, y: -gapY + pointY))
        j10.addLine(to: CGPoint(x: -gapX + pointX, y: -gapY + -shortLine + pointY))
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        j10.stroke()
    }
        
    func drawRightStar(pointX : CGFloat, pointY : CGFloat) {
        
        let j10 = UIBezierPath()
        // top right
        j10.move(to: CGPoint(x: gapX + shortLine + pointX, y: -gapY + pointY))
        j10.addLine(to: CGPoint(x: gapX + pointX, y: -gapY + pointY))
        j10.addLine(to: CGPoint(x: gapX + pointX, y: -gapY + -shortLine + pointY))
        
        // bottom right
        j10.move(to: CGPoint(x: gapX + shortLine + pointX, y: gapY + pointY))
        j10.addLine(to: CGPoint(x: gapX + pointX, y: gapY + pointY))
        j10.addLine(to: CGPoint(x: gapX + pointX, y: gapY + shortLine + pointY))
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        j10.stroke()
    }
}
