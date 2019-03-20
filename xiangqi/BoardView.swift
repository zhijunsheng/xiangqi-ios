import UIKit

class BoardView: UIView {
    
    override func draw(_ rect: CGRect) {
        let pen = UIBezierPath()

        for i in 0..<10 {
            pen.move(to: CGPoint(x: 10, y: i * 31 + 10))
            pen.addLine(to: CGPoint(x: 8 * 31 + 10, y: i * 31 + 10))

        }
        
        for i in 0..<12 {
            pen.move(to: CGPoint(x: i * 31 + 10, y: 10))
            pen.addLine(to: CGPoint(x: i * 31 + 10, y: 4 * 31 + 10))
            
        }
        
        for i in 0..<12 {
            pen.move(to: CGPoint(x: i * 31 + 10, y: 5 * 31 + 10))
            pen.addLine(to: CGPoint(x: i * 31 + 10, y: 9 * 31 + 10))
            
        }
        
        pen.move(to: CGPoint(x: 3 * 31 + 10, y: 10))
        pen.addLine(to: CGPoint(x: 5 * 31 + 10, y: 2 * 31 + 10))
        
        pen.move(to: CGPoint(x: 5 * 31 + 10, y: 10))
        pen.addLine(to: CGPoint(x: 3 * 31 + 10, y: 2 * 31 + 10))
        
        pen.move(to: CGPoint(x: 3 * 31 + 10, y: 7 * 31 + 10))
        pen.addLine(to: CGPoint(x: 5 * 31 + 10, y: 9 * 31 + 10))
        
        pen.move(to: CGPoint(x: 5 * 31 + 10, y: 7 * 31 + 10))
        pen.addLine(to: CGPoint(x: 3 * 31 + 10, y: 9 * 31 + 10))
        
        pen.move(to: CGPoint(x: 10, y: 4 * 31 + 10))
        pen.addLine(to: CGPoint(x: 10, y: 5 * 31 + 10))
        
        pen.move(to: CGPoint(x: 8 * 31 + 10, y: 4 * 31 + 10))
        pen.addLine(to: CGPoint(x: 8 * 31 + 10, y: 5 * 31 + 10))
        
        
        pen.stroke()
        
    }
   

}
