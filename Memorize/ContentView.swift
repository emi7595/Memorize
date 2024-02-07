//
//  ContentView.swift
//  Memorize
//
//  Created by Emiliano on 05/02/24.
//

import SwiftUI

struct ContentView: View {
    // let emojis: Array<String> = ["👻", "🎃", "🕷️", "😈"]
    let emojis: [String] = ["👻", "🎃", "🕷️", "😈"]
    
    var body: some View {
        VStack {
            HStack {
                ForEach (emojis, id: \.self) { emoji in
                    CardView(content: emoji)
                }
            }
            HStack {
                ForEach (emojis.indices, id: \.self) { index in
                    CardView(content: emojis[index])
                }
            }
            HStack {
                ForEach (0..<4, id: \.self) { index in
                    CardView(content: emojis[index])
                }
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
}

#Preview {
    ContentView()
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                base
            }
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}
