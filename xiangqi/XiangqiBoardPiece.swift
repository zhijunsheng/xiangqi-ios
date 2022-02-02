import Foundation

struct XiangqiBoardPiece: Hashable {
    var col       : Int
    var row       : Int
    var rank      : xiangqiRank
    var isRed     : Bool
    var imageName : String
}
