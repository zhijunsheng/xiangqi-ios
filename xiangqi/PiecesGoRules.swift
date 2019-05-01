import Foundation

struct PiecesGoRules: CustomStringConvertible {
    
    /*
 
     . . . . . . . . .
     . . . . . . . . .
     . . . . . . . . .
     . . . . . . . . .
     . . . . . . . . .
     . . . . . . . . .
     . . . . . . . . .
     . . . . . . . . .
     . . . . . . . . .
     . . . . . . . . .
     
     r n b g k g b n r
     . . . . . . . . .
     . c . . . . . c .
     p . p . p . p . p
     . . . . . . . . .
     . . . . . . . . .
     P . P . P . P . P
     . C . . . . . C .
     . . . . . . . . .
     R N B G K G B N R
     
    */
    
    var description: String { // "\n"
        var bodStrg = ""
        
        for _ in 1...10 {
            bodStrg.append("\n")
            for _ in 1...9 {
                bodStrg.append(". ")
                
            }
        }
        
        
        
        return "\(bodStrg)"
    }
}
