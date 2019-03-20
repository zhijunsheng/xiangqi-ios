import UIKit

class BoardView: UIView {
    
    let originX: CGFloat = 13
    let originY: CGFloat = 39
    let cellSide: CGFloat = 7
    
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
        
        pen.move(to: CGPoint(x: 8 * cellSide + originX, y: 4 * cellSide + originY))
        pen.addLine(to: CGPoint(x: 8 * cellSide + originX, y: 5 * cellSide + originY))
        
        
        pen.stroke()
        
    }
   

}
