//
//  CChessView.swift
//  CChess
//
//  Created by Golden Thumb on 2023-08-04.
//  Copyright © 2023 Gold Thumb Inc. All rights reserved.
//

import SwiftUI

struct CChessView: View {
    var body: some View {
        VStack {
            Text("Donald")
            
            CChessBoardView()
            
            Text("Cindy")
        }
    }
}

struct CChessBoardView: View {
    @State private var movingPieceLocation = CGPoint(x: 200, y: 300)
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                CChessBoard(bounds: geo.frame(in: .local))
                    .stroke(.black)
                
                Image("bm")
                    .position(movingPieceLocation)
                    .gesture(DragGesture().onChanged({ value in
                        movingPieceLocation = value.location
                    }))
            }
        }
    }
}

struct CChessBoard: Shape {
    let bounds: CGRect
    
    var cellSide: CGFloat {
        min(bounds.size.width, bounds.size.height) / CGFloat(CChess.rows + 1)
    }
    
    var gridX: CGFloat {
        (bounds.size.width - CGFloat(CChess.cols - 1) * cellSide) / 2
    }
    
    var gridY: CGFloat {
        (bounds.size.height - CGFloat(CChess.rows - 1) * cellSide) / 2
    }
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
        
        for r in 0..<CChess.rows {
            p.move(to: CGPoint(x: gridX, y: gridY + CGFloat(r) * cellSide))
            p.addLine(to: CGPoint(x: gridX + CGFloat(CChess.cols - 1) * cellSide, y: gridY + CGFloat(r) * cellSide))
        }
        
        for c in 0..<CChess.cols {
            p.move(to: CGPoint(x: gridX + CGFloat(c) * cellSide, y: gridY))
            p.addLine(to: CGPoint(x: gridX + CGFloat(c) * cellSide, y: gridY + CGFloat(4) * cellSide))
            
            p.move(to: CGPoint(x: gridX + CGFloat(c) * cellSide, y: gridY + CGFloat(5) * cellSide))
            p.addLine(to: CGPoint(x: gridX + CGFloat(c) * cellSide, y: gridY + CGFloat(9) * cellSide))
        }
        
        for i: CGFloat in [0, 7] {
            p.move(to: CGPoint(x: gridX + 3 * cellSide, y: gridY + i * cellSide))
            p.addLine(to: CGPoint(x: gridX + 5 * cellSide, y: gridY + (i + 2) * cellSide))
            p.move(to: CGPoint(x: gridX + 5 * cellSide, y: gridY + i * cellSide))
            p.addLine(to: CGPoint(x: gridX + 3 * cellSide, y: gridY + (i + 2) * cellSide))
        }
        
        for i: CGFloat in [0, 8] {
            p.move(to: CGPoint(x: gridX + i * cellSide, y: gridY + 4 * cellSide))
            p.addLine(to: CGPoint(x: gridX + i * cellSide, y: gridY + 5 * cellSide))
        }
        
        return p
    }
}

struct CChessView_Previews: PreviewProvider {
    static var previews: some View {
        CChessView()
    }
}
