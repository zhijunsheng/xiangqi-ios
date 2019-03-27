import UIKit

class BoardView: UIView {
    
    let originX: CGFloat = 10
    let originY: CGFloat = 10
    let cellSide: CGFloat = 31
    
    // refactored 重构
    override func draw(_ rect: CGRect) {
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
        
        pen.move(to: CGPoint(x: 3 * cellSide + originX, y: originY))
        pen.addLine(to: CGPoint(x: 5 * cellSide + originX, y: 2 * cellSide + originY))
        
        pen.move(to: CGPoint(x: 5 * cellSide + originX, y: originY))
        pen.addLine(to: CGPoint(x: 3 * cellSide + originX, y: 2 * cellSide + originY))
        
        pen.move(to: CGPoint(x: 3 * cellSide + originX, y: 7 * cellSide + originY))
        pen.addLine(to: CGPoint(x: 5 * cellSide + originX, y: 9 * cellSide + originY))
        
        pen.move(to: CGPoint(x: 5 * cellSide + originX, y: 7 * cellSide + originY))
        pen.addLine(to: CGPoint(x: 3 * cellSide + originX, y: 9 * cellSide + originY))
        
        pen.move(to: CGPoint(x: originX, y: 4 * cellSide + originY))
        pen.addLine(to: CGPoint(x: originX, y: 5 * cellSide + originY))
        
        pen.stroke()
        
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
    }
    
    // draw a flower, 5: flowerGap, 20: flowerLength
   
    func drawFlower(flowerX: Int, flowerY : Int) {

        let flowerGap: CGFloat = 5
        let flowerLength: CGFloat = 15
        
        let pen = UIBezierPath()
        
        pen.move(to: CGPoint(x: CGFloat(flowerX) * cellSide + originX - flowerGap, y: CGFloat(flowerY) * cellSide + originY - flowerLength))
        
        pen.addLine(to: CGPoint(x: CGFloat(flowerX) * cellSide + originX - flowerGap, y: CGFloat(flowerY) * cellSide + originY - flowerGap))
        
        pen.move(to: CGPoint(x: CGFloat(flowerX) * cellSide + originX - flowerLength, y: CGFloat(flowerY) * cellSide + originY - flowerGap))
        pen.addLine(to: CGPoint(x: CGFloat(flowerX) * cellSide + originX - flowerGap, y: CGFloat(flowerY) * cellSide + originY - flowerGap))
        
        pen.move(to: CGPoint(x: CGFloat(flowerX) * cellSide + originX + flowerGap, y: CGFloat(flowerY) * cellSide + originY - flowerLength))
        pen.addLine(to: CGPoint(x: CGFloat(flowerX) * cellSide + originX + flowerGap, y: CGFloat(flowerY) * cellSide + originY - flowerGap))
        
        pen.move(to: CGPoint(x: CGFloat(flowerX) * cellSide + originX + flowerLength, y: CGFloat(flowerY) * cellSide + originY - flowerGap))
        pen.addLine(to: CGPoint(x: CGFloat(flowerX) * cellSide + originX + flowerGap, y: CGFloat(flowerY) * cellSide + originY - flowerGap))
        
        pen.move(to: CGPoint(x: CGFloat(flowerX) * cellSide + originX - flowerGap, y: CGFloat(flowerY) * cellSide + originY + flowerLength))
        pen.addLine(to: CGPoint(x: CGFloat(flowerX) * cellSide + originX - flowerGap, y: CGFloat(flowerY) * cellSide + originY + flowerGap))
        
        pen.move(to: CGPoint(x: CGFloat(flowerX) * cellSide + originX - flowerLength, y: CGFloat(flowerY) * cellSide + originY + flowerGap))
        pen.addLine(to: CGPoint(x: CGFloat(flowerX) * cellSide + originX - flowerGap, y: CGFloat(flowerY) * cellSide + originY + flowerGap))
        
        pen.move(to: CGPoint(x: CGFloat(flowerX) * cellSide + originX + flowerLength, y: CGFloat(flowerY) * cellSide + originY + flowerGap))
        pen.addLine(to: CGPoint(x: CGFloat(flowerX) * cellSide + originX + flowerGap, y: CGFloat(flowerY) * cellSide + originY + flowerGap))
        
        pen.move(to: CGPoint(x: CGFloat(flowerX) * cellSide + originX + flowerGap, y: CGFloat(flowerY) * cellSide + originY + flowerLength))
        pen.addLine(to: CGPoint(x: CGFloat(flowerX) * cellSide + originX + flowerGap, y: CGFloat(flowerY) * cellSide + originY + flowerGap))
        
        pen.stroke()
    }
    
    
}
