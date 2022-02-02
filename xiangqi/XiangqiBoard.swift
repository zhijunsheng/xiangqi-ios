import Foundation

struct XiangqiBoard: CustomStringConvertible {
    
    var piecesBox = Set<XiangqiBoardPiece>()
    
    func pieceAt(col: Int, row: Int) -> XiangqiBoardPiece? {
        for piece in piecesBox {
            if piece.col == col && piece.row == row {
                return piece
            }
        }
        return nil
    }
    
    mutating func addPiece(pieceName : String, row: Int, col: Int, rank: xiangqiRank, isRed: Bool) {
        piecesBox.insert(XiangqiBoardPiece(col: col, row: row, rank: rank, isRed: isRed, imageName: pieceName))
    }
    
    func threaten() -> Bool {
        for piece in piecesBox {
            switch piece.rank {
            case .Soldier:
                if isSoldierThreaten(fromCol: piece.col, fromRow: piece.row, isRed: piece.isRed) {
                    return true
                }
            case .Cannon:
                if isCannonThreaten(fromCol: piece.col, fromRow: piece.row, isRed: piece.isRed) {
                    return true
                }
            case .Car:
                if isCarThreaten(fromCol: piece.col, fromRow: piece.row, isRed: piece.isRed) {
                    return true
                }
            case .Horse:
                if isHorseThreaten(fromCol: piece.col, fromRow: piece.row, isRed: piece.isRed) {
                    return true
                }
            case .Elephant:
                return false
            case .Guard:
                return false
            case .King:
                return false
            }
        }
        return false
    }
    
    func isSoldierThreaten(fromCol: Int, fromRow: Int, isRed: Bool) -> Bool {
        if isRed == true {
            for piece in piecesBox {
                if piece.imageName == "bx" {
                    if isValidSoldierMove(fromCol: fromCol, fromRow: fromRow, toCol: piece.col, toRow: piece.row) {
                        return true
                    }
                }
            }
        }else{
            for piece in piecesBox {
                if piece.imageName == "rx" {
                    if isValidSoldierMove(fromCol: fromCol, fromRow: fromRow, toCol: piece.col, toRow: piece.row) {
                        return true
                    }
                }
            }
        }
        return false
    }
    
    func isCannonThreaten(fromCol: Int, fromRow: Int, isRed: Bool) -> Bool {
        if isRed == true {
            for piece in piecesBox {
                if piece.imageName == "bx" {
                    if isValidCannonMove(fromCol: fromCol, fromRow: fromRow, toCol: piece.col, toRow: piece.row) {
                        return true
                    }
                }
            }
        }else{
            for piece in piecesBox {
                if piece.imageName == "rx" {
                    if isValidCannonMove(fromCol: fromCol, fromRow: fromRow, toCol: piece.col, toRow: piece.row) {
                        return true
                    }
                }
            }
        }
        return false
    }
    
    func isCarThreaten(fromCol: Int, fromRow: Int, isRed: Bool) -> Bool {
        if isRed == true {
            for piece in piecesBox {
                if piece.imageName == "bx" {
                    if isValidCarMove(fromCol: fromCol, fromRow: fromRow, toCol: piece.col, toRow: piece.row) {
                        return true
                    }
                }
            }
        }else{
            for piece in piecesBox {
                if piece.imageName == "rx" {
                    if isValidCarMove(fromCol: fromCol, fromRow: fromRow, toCol: piece.col, toRow: piece.row) {
                        return true
                    }
                }
            }
        }
        return false
    }
    
    func isHorseThreaten(fromCol: Int, fromRow: Int, isRed: Bool) -> Bool {
        if isRed == true {
            for piece in piecesBox {
                if piece.imageName == "bx" {
                    if isValidHorseMove(fromCol: fromCol, fromRow: fromRow, toCol: piece.col, toRow: piece.row) {
                        return true
                    }
                }
            }
        }else{
            for piece in piecesBox {
                if piece.imageName == "rx" {
                    if isValidHorseMove(fromCol: fromCol, fromRow: fromRow, toCol: piece.col, toRow: piece.row) {
                        return true
                    }
                }
            }
        }
        return false
    }
    
    func isKingThreaten(fromCol: Int, fromRow: Int, isRed: Bool) -> Bool {
        var redKing: XiangqiBoardPiece? = nil
        var blackKing: XiangqiBoardPiece? = nil
        for piece in piecesBox {
            if piece.imageName == "bb" {
                blackKing = piece
            }else if piece.imageName == "rb" {
                redKing = piece
            }
        }
        if redKing?.col == blackKing?.col {
            for i in 0..<10 where i != redKing?.row && i != blackKing?.row {
                if pieceAt(col: redKing!.col, row: i) != nil {
                    return false
                }
            }
            return true
        }
        return false
    }
    
    func isValidMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        
        if toCol < 0 || toCol > 8
        || toRow < 0 || toRow > 9 {
            return false
        }
        
        guard let movingPiece = pieceAt(col: fromCol, row: fromRow) else {
            return false
        }
        
        if movingPiece.rank == .Horse {
            return isValidHorseMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        } else if movingPiece.rank == .Elephant {
            return isValidElephantMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        } else if movingPiece.rank == .Guard {
            return isValidGuardMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        } else if movingPiece.rank == .King {
            return isValidKingMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        } else if movingPiece.rank == .Soldier {
            return isValidSoldierMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        } else if movingPiece.rank == .Car {
            return isValidCarMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        } else if movingPiece.rank == .Cannon {
            return isValidCannonMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        }
        
        return true
    }
    
    func isValidGuardMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        if toCol < 3
        || toCol > 5
        || toRow < 7 && toRow > 2 {
            return false
        }
        if fromCol + 1 == toCol && fromRow + 1 == toRow
        || fromCol + 1 == toCol && fromRow - 1 == toRow
        || fromCol - 1 == toCol && fromRow + 1 == toRow
        || fromCol - 1 == toCol && fromRow - 1 == toRow
        {
            return true
        }
        return false
    }
    
    func isValidKingMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        
        let movingPiece = pieceAt(col: fromCol, row: fromRow)
        
        if movingPiece?.isRed == true {
            if toCol == 3 && toRow == 9
            || toCol == 4 && toRow == 9
            || toCol == 5 && toRow == 9
            || toCol == 3 && toRow == 8
            || toCol == 4 && toRow == 8
            || toCol == 5 && toRow == 8
            || toCol == 3 && toRow == 7
            || toCol == 4 && toRow == 7
            || toCol == 5 && toRow == 7 {
                return true
            }
        }else{
            if toCol == 3 && toRow == 2
            || toCol == 4 && toRow == 2
            || toCol == 5 && toRow == 2
            || toCol == 3 && toRow == 1
            || toCol == 4 && toRow == 1
            || toCol == 5 && toRow == 1
            || toCol == 3 && toRow == 0
            || toCol == 4 && toRow == 0
            || toCol == 5 && toRow == 0 {
                return true
            }
        }
        
        return false
        
    }
    
    func isValidElephantMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        
        let movingPiece = pieceAt(col: fromCol, row: fromRow)
    
        if movingPiece?.isRed == true {
            if toRow >= 5 {
                if fromCol + 2 == toCol && fromRow + 2 == toRow && pieceAt(col: fromCol + 1, row: fromRow + 1) == nil
                || fromCol - 2 == toCol && fromRow + 2 == toRow && pieceAt(col: fromCol - 1, row: fromRow + 1) == nil
                || fromCol + 2 == toCol && fromRow - 2 == toRow && pieceAt(col: fromCol + 1, row: fromRow - 1) == nil
                || fromCol - 2 == toCol && fromRow - 2 == toRow && pieceAt(col: fromCol - 1, row: fromRow - 1) == nil
                {
                    return true
                }
            }
        }else{
            if toRow <= 4 {
                if fromCol + 2 == toCol && fromRow + 2 == toRow && pieceAt(col: fromCol + 1, row: fromRow + 1) == nil
                || fromCol - 2 == toCol && fromRow + 2 == toRow && pieceAt(col: fromCol - 1, row: fromRow + 1) == nil
                || fromCol + 2 == toCol && fromRow - 2 == toRow && pieceAt(col: fromCol + 1, row: fromRow - 1) == nil
                || fromCol - 2 == toCol && fromRow - 2 == toRow && pieceAt(col: fromCol - 1, row: fromRow - 1) == nil
                {
                    return true
                }
            }
        }
        
        return false
        
    }
    
    func isValidHorseMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        
        if fromCol - 1 == toCol && fromRow - 2 == toRow && pieceAt(col: fromCol, row: fromRow - 1) == nil // ([1]1)
        || fromCol - 2 == toCol && fromRow - 1 == toRow && pieceAt(col: fromCol - 1, row: fromRow) == nil // ([1]2)
        || fromCol + 1 == toCol && fromRow - 2 == toRow && pieceAt(col: fromCol, row: fromRow - 1) == nil // ([2]1)
        || fromCol + 2 == toCol && fromRow - 1 == toRow && pieceAt(col: fromCol + 1, row: fromRow) == nil // ([2]2)
        || fromCol + 2 == toCol && fromRow + 1 == toRow && pieceAt(col: fromCol + 1, row: fromRow) == nil // ([3]1)
        || fromCol + 1 == toCol && fromRow + 2 == toRow && pieceAt(col: fromCol, row: fromRow + 1) == nil // ([3]2)
        || fromCol - 1 == toCol && fromRow + 2 == toRow && pieceAt(col: fromCol, row: fromRow + 1) == nil // ([4]1)
        || fromCol - 2 == toCol && fromRow + 1 == toRow && pieceAt(col: fromCol - 1, row: fromRow) == nil // ([4]2)
        {
            return true
        }
        return false
    }
    
    func isValidSoldierMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        
        guard let movingPiece = pieceAt(col: fromCol, row: fromRow) else {
            return false
        }
        if movingPiece.isRed {
            if fromRow + 1 == toRow {
                return false
            }
            if fromRow == 6
            || fromRow == 5 {
                if fromRow - 1 == toRow && fromCol == toCol {
                    return true
                }
            }else if fromRow < 5{
                if fromRow - 1 == toRow && fromCol == toCol
                    || fromCol - 1 == toCol && fromRow == toRow
                    || fromCol + 1 == toCol && fromRow == toRow {
                    return true
                }
            }
        } else {
            if fromRow - 1 == toRow {
                return false
            }
            if fromRow == 3
            || fromRow == 4 {
                if fromRow + 1 == toRow && fromCol == toCol {
                    return true
                }
            }else if fromRow > 4{
                if fromRow + 1 == toRow && fromCol == toCol
                || fromCol - 1 == toCol && fromRow == toRow
                || fromCol + 1 == toCol && fromRow == toRow {
                    return true
                }
            }
        }
        
        
        return false
    }
    
    mutating func move(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) {
        guard let movingPiece = pieceAt(col: fromCol, row: fromRow) else {
            return
        }
        
        if !isValidMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow) {
            return
        }
        
        let targetPiece = pieceAt(col: toCol, row: toRow)
        if targetPiece != nil {
            piecesBox.remove(targetPiece!)
        }
        
        piecesBox.remove(movingPiece)
        let newPiece = XiangqiBoardPiece(col: toCol, row: toRow, rank: movingPiece.rank, isRed: movingPiece.isRed, imageName: movingPiece.imageName)
        piecesBox.insert(newPiece)
    }
    
    func isValidCarMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        if fromCol == toCol {
            if fromRow < toRow {
                for i in 1..<toRow - fromRow {
                    if pieceAt(col: fromCol, row: fromRow + i) != nil {
                        return false
                    }
                }
                return true
            }else if fromRow > toRow {
                for i in 1..<fromRow - toRow {
                    if pieceAt(col: fromCol, row: fromRow - i) != nil {
                        return false
                    }
                }
                return true
            }
        }else if fromRow == toRow {
            if fromCol < toCol {
                for i in 1..<toCol - fromCol {
                    if pieceAt(col: fromCol + i, row: fromRow) != nil {
                        return false
                    }
                }
                return true
            }else if fromCol > toCol {
                for i in 1..<fromCol - toCol {
                    if pieceAt(col: fromCol - i, row: fromRow) != nil {
                        return false
                    }
                }
                return true
            }
        }
        return false
    }
    
    func isValidCannonMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        var stuck = 0
        
        if fromCol == toCol {
            if fromRow < toRow {
                for i in 1..<toRow - fromRow {
                    if pieceAt(col: fromCol, row: fromRow + i) != nil {
                        stuck += 1
                    }
                }
                if stuck > 1
                || stuck == 1 && pieceAt(col: toCol, row: toRow) == nil {
                    return false
                }
                return true
            }else if fromRow > toRow {
                for i in 1..<fromRow - toRow {
                    if pieceAt(col: fromCol, row: fromRow - i) != nil {
                        stuck += 1
                    }
                }
                if stuck > 1
                || stuck == 1 && pieceAt(col: toCol, row: toRow) == nil {
                    return false
                }
                return true
            }
        }else if fromRow == toRow {
            if fromCol < toCol {
                for i in 1..<toCol - fromCol {
                    if pieceAt(col: fromCol + i, row: fromRow) != nil {
                        stuck += 1
                    }
                }
                if stuck > 1
                || stuck == 1 && pieceAt(col: toCol, row: toRow) == nil {
                    return false
                }
                return true
            }else if fromCol > toCol {
                for i in 1..<fromCol - toCol {
                    if pieceAt(col: fromCol - i, row: fromRow) != nil {
                        stuck += 1
                    }
                }
                if stuck > 1
                || stuck == 1 && pieceAt(col: toCol, row: toRow) == nil {
                    return false
                }
                return true
            }
        }
        return false
    }
    
    mutating func resetGame() {
        piecesBox.removeAll()
        for i in 0..<5 {
            addPiece(pieceName: "bz", row: 3, col: i * 2, rank: .Soldier, isRed: false)
            addPiece(pieceName: "rz", row: 6, col: i * 2, rank: .Soldier, isRed: true)
        }
        for i in 0..<2 {
            addPiece(pieceName: "bs", row: 0, col: 3 + i * 2, rank: .Guard, isRed: false)
            addPiece(pieceName: "rs", row: 9, col: 3 + i * 2, rank: .Guard, isRed: true)
            addPiece(pieceName: "rx", row: 9, col: 2 + i * 4, rank: .Elephant, isRed: true)
            addPiece(pieceName: "bp", row: 2, col: 1 + i * 6, rank: .Cannon, isRed: false)
            addPiece(pieceName: "rp", row: 7, col: 1 + i * 6, rank: .Cannon, isRed: true)
            addPiece(pieceName: "bm", row: 0, col: 1 + i * 6, rank: .Horse, isRed: false)
            addPiece(pieceName: "bx", row: 0, col: 2 + i * 4, rank: .Elephant, isRed: false)
            addPiece(pieceName: "rj", row: 9, col: i * 8, rank: .Car, isRed: true)
            addPiece(pieceName: "bj", row: 0, col: i * 8, rank: .Car, isRed: false)
            addPiece(pieceName: "rm", row: 9, col: 1 + i * 6, rank: .Horse, isRed: true)
        }
        addPiece(pieceName: "bb", row: 0, col: 4, rank: .King, isRed: false)
        addPiece(pieceName: "rb", row: 9, col: 4, rank: .King, isRed: true)
    }
    
    var description: String {
        var boardString : String = ""
        boardString.append("  0 1 2 3 4 5 6 7 8")
        boardString.append("\n")
        for y in 0..<10 {
            boardString.append("\(y)")
            for x in 0...8 {
                let piece = pieceAt(col: x, row: y)
                if piece == nil {
                    boardString.append(" .")
                } else {
                    switch piece!.rank {
                    case .Car : boardString.append(piece!.isRed ? " r" : " R")// car
                    case .Horse : boardString.append(piece!.isRed ? " k" : " K")// horse
                    case .Elephant : boardString.append(piece!.isRed ? " b" : " B")// elephant
                    case .Guard : boardString.append(piece!.isRed ? " g" : " G")// guard
                    case .King : boardString.append(piece!.isRed ? " q" : " Q")// king
                    case .Cannon : boardString.append(piece!.isRed ? " c" : " C")// cannon
                    case .Soldier : boardString.append(piece!.isRed ? " p" : " P")// soldier
                    }
                }
            }
            boardString.append("\n")
        }
        return boardString
    }
 
}
