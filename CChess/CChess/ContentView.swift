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
        Path { path in
            path.move(to: CGPoint(x: 23, y: 47))
            path.addLine(to: CGPoint(x: 300, y: 47))
        }.stroke(Color.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
