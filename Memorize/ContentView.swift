//
//  ContentView.swift
//  Memorize
//
//  Created by Emiliano on 05/02/24.
//

import SwiftUI

struct ContentView: View {
    // let emojis: Array<String> = ["👻", "🎃", "🕷️", "😈"]
    let emojis: [String] = ["👻", "🎃", "🕷️", "👹", "💀", "🧙‍♀️", "🍭", "🙀", "☠️", "🕸️"]
    
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    var cards: some View {
//      HStack {
//          ForEach (emojis.shuffled(), id: \.self) { emoji in
//              CardView(content: emoji)
//          }
//      }
//      HStack {
//          ForEach (emojis.indices, id: \.self) { index in
//              CardView(content: emojis[index])
//          }
//      }
//        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach (0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
            //(cardCount == 1) ? (cardCount = cardCount) : (cardCount -= 1)
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
//        Button(action: {
//            (cardCount == 1) ? (cardCount = cardCount) : (cardCount -= 1)
//        }, label: {
//            Image(systemName: "rectangle.stack.badge.minus.fill")
//        })
//      Button("Remove Card") {
//          (cardCount == 1) ? (cardCount = cardCount) : (cardCount -= 1)
//      }
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
//        Button(action: {
//            (cardCount == emojis.count) ? (cardCount = cardCount) : (cardCount += 1)
//        }, label: {
//            Image(systemName: "rectangle.stack.badge.plus.fill")
//        })
//      Button("Add Card") {
//          (cardCount == emojis.count) ? (cardCount = cardCount) : (cardCount += 1)
//      }
    }
    
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
