import Foundation

struct XiangqiBoard: CustomStringConvertible {
    
    /*
     
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
        var boardString : String = ""
        for _ in 1...10 {
            for _ in 1...9 {
                boardString.append(". ")
            }
            boardString.append("\n")
        }
        
        
        
        
        
        return boardString
    }
    
    
}
