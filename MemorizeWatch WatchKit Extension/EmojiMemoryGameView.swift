//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Bradley Black on 5/26/21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 30))]){
                    ForEach(game.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fill)
                            .onTapGesture {
                                game.choose(card)
                            }
                    }
                }
                Divider()
                HStack {
                    Button("New Game") {
                        game.newMemoryGame()
                    }
                    Spacer()
                    Text("Score: \(game.score)")
                    Spacer()
                    Text("Max Score: \(game.cards.count)")
                }
                .font(.footnote)
            }
        }
        .foregroundColor(game.themeColor)
        .padding(.horizontal)
    }
}


struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        GeometryReader(content: { geometry in
            ZStack {
                let emojiSize = min(geometry.size.width, geometry.size.height) * 0.8
                let shape = RoundedRectangle(cornerRadius: 10)
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: 3)
                    Text(card.content).font(Font.system(size: emojiSize))
                } else if card.isMatched {
                    shape.opacity(0)
                } else {
                    shape.fill()
                }
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
            .previewDevice("Apple Watch Series 6 - 44mm")
            .preferredColorScheme(.light)
    }
}
