import Foundation

struct XiangqiBoard: CustomStringConvertible {
    var description: String {
        var desc = ""
        
        for j in 0..<10 {
            for i in 0..<9 {
                desc = desc + " ."
            }
            desc = desc + "\n"
        }
        return desc
    }
    
    
}


