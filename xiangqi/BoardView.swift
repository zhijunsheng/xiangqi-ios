import UIKit

class BoardView: UIView {
    
    var originX: CGFloat = 78
    var originY: CGFloat = 30
    let cellSide: CGFloat = 74
    let gap: CGFloat = 15
    
    override func draw(_ rect: CGRect) {
        originX = (bounds.width - cellSide * 8) / 2
        originY = (bounds.height - cellSide * 9) / 2

        drawBoard()
        drawFrame()
        drawFlowers()
        drawPieces()
    }
    
    func drawRightHalfFlower(flowerX: Int, flowerY: Int) {
        
        let flowerGap: CGFloat = cellSide / 8
        let flowerLength: CGFloat = cellSide / 3
        
        let pen = UIBezierPath()
    
        pen.move(to: CGPoint(x: CGFloat(flowerX) * cellSide + originX + flowerGap, y: CGFloat(flowerY) * cellSide + originY - flowerLength))
        pen.addLine(to: CGPoint(x: CGFloat(flowerX) * cellSide + originX + flowerGap, y: CGFloat(flowerY) * cellSide + originY - flowerGap))
        
        pen.move(to: CGPoint(x: CGFloat(flowerX) * cellSide + originX + flowerLength, y: CGFloat(flowerY) * cellSide + originY - flowerGap))
        pen.addLine(to: CGPoint(x: CGFloat(flowerX) * cellSide + originX + flowerGap, y: CGFloat(flowerY) * cellSide + originY - flowerGap))
        
        pen.move(to: CGPoint(x: CGFloat(flowerX) * cellSide + originX + flowerLength, y: CGFloat(flowerY) * cellSide + originY + flowerGap))
        pen.addLine(to: CGPoint(x: CGFloat(flowerX) * cellSide + originX + flowerGap, y: CGFloat(flowerY) * cellSide + originY + flowerGap))
        
        pen.move(to: CGPoint(x: CGFloat(flowerX) * cellSide + originX + flowerGap, y: CGFloat(flowerY) * cellSide + originY + flowerLength))
        pen.addLine(to: CGPoint(x: CGFloat(flowerX) * cellSide + originX + flowerGap, y: CGFloat(flowerY) * cellSide + originY + flowerGap))
        
        pen.lineWidth = 0.5
        pen.stroke()
    }
    
    func drawLeftHalfFlower(flowerX: Int, flowerY: Int) {
        
        let flowerGap: CGFloat = cellSide / 8
        let flowerLength: CGFloat = cellSide / 3
        
        let pen = UIBezierPath()
        
        pen.move(to: CGPoint(x: CGFloat(flowerX) * cellSide + originX - flowerGap, y: CGFloat(flowerY) * cellSide + originY - flowerLength))
        pen.addLine(to: CGPoint(x: CGFloat(flowerX) * cellSide + originX - flowerGap, y: CGFloat(flowerY) * cellSide + originY - flowerGap))
        
        pen.move(to: CGPoint(x: CGFloat(flowerX) * cellSide + originX - flowerLength, y: CGFloat(flowerY) * cellSide + originY - flowerGap))
        pen.addLine(to: CGPoint(x: CGFloat(flowerX) * cellSide + originX - flowerGap, y: CGFloat(flowerY) * cellSide + originY - flowerGap))
        
        pen.move(to: CGPoint(x: CGFloat(flowerX) * cellSide + originX - flowerGap, y: CGFloat(flowerY) * cellSide + originY + flowerLength))
        pen.addLine(to: CGPoint(x: CGFloat(flowerX) * cellSide + originX - flowerGap, y: CGFloat(flowerY) * cellSide + originY + flowerGap))
        
        pen.move(to: CGPoint(x: CGFloat(flowerX) * cellSide + originX - flowerLength, y: CGFloat(flowerY) * cellSide + originY + flowerGap))
        pen.addLine(to: CGPoint(x: CGFloat(flowerX) * cellSide + originX - flowerGap, y: CGFloat(flowerY) * cellSide + originY + flowerGap))
        
        pen.lineWidth = 0.5
        pen.stroke()
    }
   
    func drawFlower(flowerX: Int, flowerY: Int) {
        drawRightHalfFlower(flowerX: flowerX, flowerY: flowerY)
        drawLeftHalfFlower(flowerX: flowerX, flowerY: flowerY)
    }
    
    func drawFlowers() {
        drawFlower(flowerX: 1, flowerY: 2)
        drawFlower(flowerX: 6, flowerY: 6)
        drawFlower(flowerX: 7, flowerY: 2)
        drawFlower(flowerX: 2, flowerY: 3)
        drawFlower(flowerX: 4, flowerY: 3)
        drawFlower(flowerX: 6, flowerY: 3)
        drawFlower(flowerX: 4, flowerY: 6)
        drawFlower(flowerX: 1, flowerY: 7)
        drawFlower(flowerX: 7, flowerY: 7)
        drawFlower(flowerX: 2, flowerY: 6)
        
        drawLeftHalfFlower(flowerX: 8, flowerY: 3)
        drawLeftHalfFlower(flowerX: 8, flowerY: 6)
        
        drawRightHalfFlower(flowerX: 0, flowerY: 3)
        drawRightHalfFlower(flowerX: 0, flowerY: 6)
    }
    
    func drawFrame() {
        let pen = UIBezierPath()
        
        pen.move(to: CGPoint(x: originX - gap, y: originY - gap))
        pen.addLine(to: CGPoint(x: originX + 8 * cellSide + gap, y: originY - gap))
        
        pen.move(to: CGPoint(x: originX + 8 * cellSide + gap, y: originY - gap))
        pen.addLine(to: CGPoint(x: originX + 8 * cellSide + gap, y: originY + 9 * cellSide + gap))
        
        pen.move(to: CGPoint(x: originX - gap, y: originY - gap))
        pen.addLine(to: CGPoint(x: originX - gap, y: originY + 9 * cellSide + gap))
        
        pen.move(to: CGPoint(x: originX - gap, y: originY + 9 * cellSide + gap))
        pen.addLine(to: CGPoint(x: originX + 8 * cellSide + gap, y: originY + 9 * cellSide + gap))
        
        pen.lineWidth = 3
        
        pen.stroke()
    }
    
    func drawPieces() {
        
        //black
        
        let bbImg = UIImage(named: "bb")
        bbImg?.draw(in: CGRect(x: originX + 4 * cellSide - 0.5 * cellSide, y: originY + 9 * cellSide - 0.5 * cellSide, width: cellSide, height: cellSide))
        
        let bsImg = UIImage(named: "bs")
        let bxImg = UIImage(named: "bx")
        let bmImg = UIImage(named: "bm")
        let bjImg = UIImage(named: "bj")
        let bpImg = UIImage(named: "bp")
        for i in 0..<2 {
            bsImg?.draw(in: CGRect(x: originX + CGFloat(3 + 2 * i) * cellSide - 0.5 * cellSide, y: originY + 9 * cellSide - 0.5 * cellSide, width: cellSide, height: cellSide))
            bxImg?.draw(in: CGRect(x: originX + CGFloat(2 + 4 * i) * cellSide - 0.5 * cellSide, y: originY + 9 * cellSide - 0.5 * cellSide, width: cellSide, height: cellSide))
            bmImg?.draw(in: CGRect(x: originX + CGFloat(1 + 6 * i) * cellSide - 0.5 * cellSide, y: originY + 9 * cellSide - 0.5 * cellSide, width: cellSide, height: cellSide))
            bjImg?.draw(in: CGRect(x: originX + CGFloat(8 * i) * cellSide - 0.5 * cellSide, y: originY + 9 * cellSide - 0.5 * cellSide, width: cellSide, height: cellSide))
            bpImg?.draw(in: CGRect(x: originX + CGFloat(1 + 6 * i) * cellSide - 0.5 * cellSide, y: originY + 7 * cellSide - 0.5 * cellSide, width: cellSide, height: cellSide))
        }
        
        let bzImg = UIImage(named: "bz")
        for i in 0..<5 {
            bzImg?.draw(in: CGRect(x: originX + CGFloat(2 * i) * cellSide - 0.5 * cellSide, y: originY + 6 * cellSide - 0.5 * cellSide, width: cellSide, height: cellSide))
        }
        
        //red
        
        let rbImg = UIImage(named: "rb")
        rbImg?.draw(at: CGPoint(x: originX + 4 * cellSide - 0.5 * cellSide, y: originY + 0 * cellSide - 0.5 * cellSide))
        
        let rsImg = UIImage(named: "rs")
        let rxImg = UIImage(named: "rx")
        let rmImg = UIImage(named: "rm")
        let rjImg = UIImage(named: "rj")
        let rpImg = UIImage(named: "rp")
        for i in 0..<2 {
            rsImg?.draw(in: CGRect(x: originX + CGFloat(3 + 2 * i) * cellSide - 0.5 * cellSide, y: originY + 0 * cellSide - 0.5 * cellSide, width: cellSide, height: cellSide))
            rxImg?.draw(in: CGRect(x: originX + CGFloat(2 + 4 * i) * cellSide - 0.5 * cellSide, y: originY + 0 * cellSide - 0.5 * cellSide, width: cellSide, height: cellSide))
            rmImg?.draw(in: CGRect(x: originX + CGFloat(1 + 6 * i) * cellSide - 0.5 * cellSide, y: originY + 0 * cellSide - 0.5 * cellSide, width: cellSide, height: cellSide))
            rjImg?.draw(in: CGRect(x: originX + CGFloat(8 * i) * cellSide - 0.5 * cellSide, y: originY + 0 * cellSide - 0.5 * cellSide, width: cellSide, height: cellSide))
            rpImg?.draw(in: CGRect(x: originX + CGFloat(1 + 6 * i) * cellSide - 0.5 * cellSide, y: originY + 2 * cellSide - 0.5 * cellSide, width: cellSide, height: cellSide))
        }
        
        let rzImg = UIImage(named: "rz")
        for i in 0..<5 {
            rzImg?.draw(in: CGRect(x: originX + CGFloat(2 * i) * cellSide - 0.5 * cellSide, y: originY + 3 * cellSide - 0.5 * cellSide, width: cellSide, height: cellSide))
        }
    }
    
    func drawBoard() {
        let pen = UIBezierPath()
        
        for i in 0..<10 {
            pen.move(to: CGPoint(x: originX, y: CGFloat(i) * cellSide + originY))
            pen.addLine(to: CGPoint(x: 8 * cellSide + originX, y: CGFloat(i) * cellSide + originY))
        }
        
        for i in 0..<9 {
            pen.move(to: CGPoint(x: CGFloat(i) * cellSide + originX, y: originY))
            pen.addLine(to: CGPoint(x: CGFloat(i) * cellSide + originX, y: 4 * cellSide + originY))
        }
        
        for i in 0..<9 {
            pen.move(to: CGPoint(x: CGFloat(i) * cellSide + originX, y: 5 * cellSide + originY))
            pen.addLine(to: CGPoint(x: CGFloat(i) * cellSide + originX, y: 9 * cellSide + originY))
        }
        
        // 2 Xs
        
        pen.move(to: CGPoint(x: 3 * cellSide + originX, y: originY))
        pen.addLine(to: CGPoint(x: 5 * cellSide + originX, y: 2 * cellSide + originY))
        
        pen.move(to: CGPoint(x: 5 * cellSide + originX, y: originY))
        pen.addLine(to: CGPoint(x: 3 * cellSide + originX, y: 2 * cellSide + originY))
        
        pen.move(to: CGPoint(x: 3 * cellSide + originX, y: 7 * cellSide + originY))
        pen.addLine(to: CGPoint(x: 5 * cellSide + originX, y: 9 * cellSide + originY))
        
        pen.move(to: CGPoint(x: 5 * cellSide + originX, y: 7 * cellSide + originY))
        pen.addLine(to: CGPoint(x: 3 * cellSide + originX, y: 9 * cellSide + originY))
        
        // river
        
        pen.move(to: CGPoint(x: originX, y: originY + 4 * cellSide))
        pen.addLine(to: CGPoint(x: originX, y: originY + 5 * cellSide))
        
        pen.move(to: CGPoint(x: originX + 8 * cellSide, y: originY + 4 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 8 * cellSide, y: originY + 5 * cellSide))
        
        pen.lineWidth = 0.5
        
        pen.stroke()
    }
    
}
