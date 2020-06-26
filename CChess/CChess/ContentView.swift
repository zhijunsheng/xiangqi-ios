//
//  ContentView.swift
//  CChess
//
//  Created by Zhijun Sheng on 2020-06-23.
//  Copyright © 2020 Gold Thumb Inc. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        BoardView()
        
    }
}

struct BoardView: View {
    @State private var movingPieceLocation = CGPoint(x: 200, y: 300)
    
    var body: some View {
        ZStack {
            BoardGrid()
            .stroke(Color.black)
            
            Image("rb")
                .position(movingPieceLocation)
                .gesture(DragGesture().onChanged({ value in
                    self.movingPieceLocation = value.location
                }))
        }
    }
}

struct BoardGrid: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let cols: Int = 9
        let rows: Int = 10
        let originX: CGFloat = 40
        let originY: CGFloat = 47
        let cellWidth: CGFloat = 41
        let cellHeight: CGFloat = 41

        for row in 0..<rows {
            path.move(to: CGPoint(x: originX, y: originY + CGFloat(row) * cellHeight ))
            path.addLine(to: CGPoint(x: originX + CGFloat(cols - 1) * cellWidth, y: originY + CGFloat(row) * cellHeight))
        }

        for col in 0..<cols {
            path.move(to: CGPoint(x: originX + CGFloat(col) * cellWidth, y: originY))
            path.addLine(to: CGPoint(x: originX + CGFloat(col) * cellWidth, y: originY + 4 * cellHeight))

            path.move(to: CGPoint(x: originX + CGFloat(col) * cellWidth, y: originY + 5 * cellHeight))
            path.addLine(to: CGPoint(x: originX + CGFloat(col) * cellWidth, y: originY + 9 * cellHeight))
        }

        for i in 0..<2 {
            path.move(to: CGPoint(x: originX + 3 * cellWidth, y: originY + CGFloat(i) * 7 * cellHeight))
            path.addLine(to: CGPoint(x: originX + 5 * cellWidth, y: originY + CGFloat(2 + i * 7) * cellHeight))
            path.move(to: CGPoint(x: originX + 5 * cellWidth, y: originY + CGFloat(i) * 7 * cellHeight))
            path.addLine(to: CGPoint(x: originX + 3 * cellWidth, y: originY + CGFloat(2 + i * 7) * cellHeight))

            path.move(to: CGPoint(x: originX + CGFloat(i) * 8 * cellWidth, y: originY + 4 * cellHeight))
            path.addLine(to: CGPoint(x: originX + CGFloat(i) * 8 * cellWidth, y: originY + 5 * cellHeight))
        }
        return path
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
