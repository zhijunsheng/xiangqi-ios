import UIKit

class BoardView: UIView {
    
    let boardOriginX: CGFloat = 30
    let boardOriginY: CGFloat = 60
    let cellSide: CGFloat = 45
    let gapA: CGFloat = 2
    let gapB: CGFloat = 4
    let shortLine: CGFloat = 7
    
    
    func drawTopLeftL(pointX: CGFloat, pointY: CGFloat) {
        let l15 = UIBezierPath()
        l15.move(to: CGPoint(x: pointX - gapB, y: pointY - gapB - shortLine))
        l15.addLine(to: CGPoint(x: pointX - gapB, y: pointY - gapB))
        l15.addLine(to: CGPoint(x: pointX - gapB - shortLine, y: pointY - gapB))
        l15.stroke()
    }
    
    func drawTopLeftLs() {
        drawTopLeftL(pointX: boardOriginX + cellSide, pointY: boardOriginY + 2 * cellSide)
        drawTopLeftL(pointX: boardOriginX + cellSide, pointY: boardOriginY + 7 * cellSide)
        drawTopLeftL(pointX: boardOriginX + 7 * cellSide, pointY: boardOriginY + 2 * cellSide)
        drawTopLeftL(pointX: boardOriginX + 7 * cellSide, pointY: boardOriginY + 7 * cellSide)
        for i in 1...4 {
            drawTopLeftL(pointX: boardOriginX + (CGFloat(i) * 2) * cellSide, pointY: boardOriginY + 3 * cellSide)
            drawTopLeftL(pointX: boardOriginX + (CGFloat(i) * 2) * cellSide, pointY: boardOriginY + 6 * cellSide)
        }
    }
    
    func drawTopRightL(pointX: CGFloat, pointY: CGFloat) {
        let m16 = UIBezierPath()
        m16.move(to: CGPoint(x: pointX + gapB, y: pointY - gapB - shortLine))
        m16.addLine(to: CGPoint(x: pointX + gapB, y: pointY - gapB))
        m16.addLine(to: CGPoint(x: pointX + gapB + shortLine, y: pointY - gapB))
        m16.stroke()
    }
    func drawTopRightLs() {
        drawTopRightL(pointX: boardOriginX + cellSide, pointY: boardOriginY + 2 * cellSide)
        drawTopRightL(pointX: boardOriginX + cellSide, pointY: boardOriginY + 7 * cellSide)
        drawTopRightL(pointX: boardOriginX + 7 * cellSide, pointY: boardOriginY + 2 * cellSide)
        drawTopRightL(pointX: boardOriginX + 7 * cellSide, pointY: boardOriginY + 7 * cellSide)
        for i in 0...3 {
            drawTopRightL(pointX: boardOriginX + (CGFloat(i) * 2) * cellSide, pointY: boardOriginY + 3 * cellSide)
            drawTopRightL(pointX: boardOriginX + (CGFloat(i) * 2) * cellSide, pointY: boardOriginY + 6 * cellSide)
        }
    }
    
    func drawBottomLeftL(pointX: CGFloat, pointY: CGFloat) {
        let m16 = UIBezierPath()
        m16.move(to: CGPoint(x: pointX - gapB, y: pointY + gapB + shortLine))
        m16.addLine(to: CGPoint(x: pointX - gapB, y: pointY + gapB))
        m16.addLine(to: CGPoint(x: pointX - gapB - shortLine, y: pointY + gapB))
        m16.stroke()
    }
    func drawBottomLeftLs() {
        drawBottomLeftL(pointX: boardOriginX + cellSide, pointY: boardOriginY + 2 * cellSide)
        drawBottomLeftL(pointX: boardOriginX + cellSide, pointY: boardOriginY + 7 * cellSide)
        drawBottomLeftL(pointX: boardOriginX + 7 * cellSide, pointY: boardOriginY + 2 * cellSide)
        drawBottomLeftL(pointX: boardOriginX + 7 * cellSide, pointY: boardOriginY + 7 * cellSide)
        for i in 1...4 {
            drawBottomLeftL(pointX: boardOriginX + (CGFloat(i) * 2) * cellSide, pointY: boardOriginY + 3 * cellSide)
            drawBottomLeftL(pointX: boardOriginX + (CGFloat(i) * 2) * cellSide, pointY: boardOriginY + 6 * cellSide)
        }
    }
    
    func drawBottomRightL(pointX: CGFloat, pointY: CGFloat) {
        let m16 = UIBezierPath()
        m16.move(to: CGPoint(x: pointX + gapB, y: pointY + gapB + shortLine))
        m16.addLine(to: CGPoint(x: pointX + gapB, y: pointY + gapB))
        m16.addLine(to: CGPoint(x: pointX + gapB + shortLine, y: pointY + gapB))
        m16.stroke()
    }
    func drawBottomRightLs() {
        drawBottomRightL(pointX: boardOriginX + cellSide, pointY: boardOriginY + 2 * cellSide)
        drawBottomRightL(pointX: boardOriginX + cellSide, pointY: boardOriginY + 7 * cellSide)
        drawBottomRightL(pointX: boardOriginX + 7 * cellSide, pointY: boardOriginY + 2 * cellSide)
        drawBottomRightL(pointX: boardOriginX + 7 * cellSide, pointY: boardOriginY + 7 * cellSide)
        for i in 0...3 {
            drawBottomRightL(pointX: boardOriginX + (CGFloat(i) * 2) * cellSide, pointY: boardOriginY + 3 * cellSide)
            drawBottomRightL(pointX: boardOriginX + (CGFloat(i) * 2) * cellSide, pointY: boardOriginY + 6 * cellSide)
        }
    }
    
    
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        drawTopLeftLs()
        drawTopRightLs()
        drawBottomLeftLs()
        drawBottomRightLs()
        
        let k14 = UIBezierPath()
        k14.move(to: CGPoint(x: boardOriginX - gapA, y: boardOriginY - gapA))
        k14.addLine(to: CGPoint(x: boardOriginX + 8 * cellSide + gapA, y: boardOriginY - gapA))
        k14.addLine(to: CGPoint(x: boardOriginX + 8 * cellSide + gapA, y: boardOriginY + 9 * cellSide + gapA))
        k14.addLine(to: CGPoint(x: boardOriginX - gapA, y: boardOriginY + 9 * cellSide + gapA))
        k14.close()
        k14.stroke()
        
        for i in 0..<10 {
            let h11 = UIBezierPath()
            h11.move(to: CGPoint(x: boardOriginX, y: boardOriginY + CGFloat(i) * cellSide))
            h11.addLine(to: CGPoint(x: boardOriginX + 8 * cellSide, y: boardOriginY + CGFloat(i) * cellSide))
            h11.stroke()
        }
        
        for i in 0...8 {
            let h11 = UIBezierPath()
            h11.move(to: CGPoint(x: boardOriginX + CGFloat(i) * cellSide, y: boardOriginY))
            h11.addLine(to: CGPoint(x: boardOriginX + CGFloat(i) * cellSide, y: boardOriginY + 4 * cellSide))
            h11.stroke()
        }
        
        for i in 0...8 {
            let h11 = UIBezierPath()
            h11.move(to: CGPoint(x: boardOriginX + CGFloat(i) * cellSide, y: boardOriginY + 5 * cellSide))
            h11.addLine(to: CGPoint(x: boardOriginX + CGFloat(i) * cellSide, y: boardOriginY + 9 * cellSide))
            h11.stroke()
        }
        
        let i12 = UIBezierPath()
        i12.move(to: CGPoint(x: boardOriginX, y: boardOriginY + 4 * cellSide))
        i12.addLine(to: CGPoint(x: boardOriginX, y: boardOriginY + 5 * cellSide))
        
        i12.move(to: CGPoint(x: boardOriginX + 8 * cellSide, y: boardOriginY + 4 * cellSide))
        i12.addLine(to: CGPoint(x: boardOriginX + 8 * cellSide, y: boardOriginY + 5 * cellSide))
        i12.stroke()
        
        let j13 = UIBezierPath()
        j13.move(to: CGPoint(x: boardOriginX + 3 * cellSide, y: boardOriginY))
        j13.addLine(to: CGPoint(x: boardOriginX + 5 * cellSide, y: boardOriginY + 2 * cellSide))
        
        j13.move(to: CGPoint(x: boardOriginX + 5 * cellSide, y: boardOriginY))
        j13.addLine(to: CGPoint(x: boardOriginX + 3 * cellSide, y: boardOriginY + 2 * cellSide))
        
        j13.move(to: CGPoint(x: boardOriginX + 3 * cellSide, y: boardOriginY + 7 * cellSide))
        j13.addLine(to: CGPoint(x: boardOriginX + 5 * cellSide, y: boardOriginY + 9 * cellSide))
        
        j13.move(to: CGPoint(x: boardOriginX + 5 * cellSide, y: boardOriginY + 7 * cellSide))
        j13.addLine(to: CGPoint(x: boardOriginX + 3 * cellSide, y: boardOriginY + 9 * cellSide))
        
        j13.stroke()
    }
    

}




















