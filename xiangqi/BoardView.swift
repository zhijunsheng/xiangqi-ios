

import UIKit



class BoardView: UIView {
    let rows     : Int = 10
    let cols     : Int = 9
    var originX  : CGFloat = 25
    var originY  : CGFloat = 25
    let height   : CGFloat = 60
    let width    : CGFloat = 71
    let gapX     : CGFloat = 5
    let gapY     : CGFloat = 5
    let shortLine: CGFloat = 10
    
    override func draw(_ rect: CGRect) {
        originY = (bounds.height - CGFloat(rows - 1) * height) / 2
        originX = (bounds.width - CGFloat(cols - 1) * width) / 2
        print(bounds.width)
        print(bounds.height)
        for i in 0..<rows {
            let b2 = UIBezierPath()
            b2.move(to: CGPoint(x: originX, y: height * CGFloat(i) + originY))
            b2.addLine(to: CGPoint(x: width * CGFloat(cols - 1) + originX, y: height * CGFloat(i) + originY))
            b2.stroke()
        }
        for i in 0..<2  {
            let c3 = UIBezierPath()
            c3.move(to: CGPoint(x: originX + CGFloat(i) * CGFloat(cols - 1) * width, y: originY))
            c3.addLine(to: CGPoint(x: originX + CGFloat(i) * CGFloat(cols - 1) * width, y: height * CGFloat(rows - 1) + originY))
            c3.stroke()
        }
        for i in 1...7  {
            let d4 = UIBezierPath()
            d4.move(to: CGPoint(x: originX + CGFloat(i) * 1 * width, y: originY))
            d4.addLine(to: CGPoint(x: originX + CGFloat(i) * 1 * width, y: height * 4 + originY))
            d4.stroke()
        }
        for i in 1...7  {
            let d4 = UIBezierPath()
            d4.move(to: CGPoint(x: originX + CGFloat(i) * 1 * width, y: height * 5 + originY))
            d4.addLine(to: CGPoint(x: originX + CGFloat(i) * 1 * width, y: height * CGFloat(rows - 1) + originY))
            d4.stroke()
        }
        
        let e5 = UIBezierPath()
        e5.move(to: CGPoint(x: width * 3 + originX, y: originY))
        e5.addLine(to: CGPoint(x: width * 5 + originX, y: height * 2 + originY))
        e5.stroke()
        
        // ================================================
        
        let f6 = UIBezierPath()
        f6.move(to: CGPoint(x: width * 5 + originX, y: originY))
        f6.addLine(to: CGPoint(x: width * 3 + originX, y: height * 2 + originY))
        f6.stroke()
        
        // =================================================
        
        let g7 = UIBezierPath()
        g7.move(to: CGPoint(x: width * 3 + originX, y: height * 7 + originY))
        g7.addLine(to: CGPoint(x: width * 5 + originX, y: height * 9 + originY))
        g7.stroke()
        
        // =================================================
        
        let h8 = UIBezierPath()
        h8.move(to: CGPoint(x: width * 5 + originX, y: height * 7 + originY))
        h8.addLine(to: CGPoint(x: width * 3 + originX, y: height * 9 + originY))
        h8.stroke()
        
        // =================================================
        
        let j10 = UIBezierPath()
        j10.move(to: CGPoint(x: originX, y: originY + height * 4.5))
        j10.addLine(to: CGPoint(x: originX + width * 8, y: originY + height * 4.5))
        #colorLiteral(red: 0, green: 0.6235294118, blue: 0.9176470588, alpha: 1).setStroke()
        j10.stroke()

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
        j10.stroke()
    }
    
    
    
}
