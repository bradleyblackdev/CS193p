//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Bradley Black on 5/31/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Theme = MemoryGame<String>.Theme
    
    static private var cityscapeEmojis = ["🌁", "🌉", "🌌", "🌃", "🏙", "🌆", "🎆", "🎇", "🌠", "🌄", "🌅", "🏞", "🎑", "🗾", "🌇"]
    
    static private var plantEmojis = ["🌵", "🌲", "🌳", "🌴", "🌱", "🌿", "☘️", "🍀", "🎍", "🪴", "🎋", "🍃"]
    
    static private var fruitEmojis = ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐", "🍈", "🍒", "🍑", "🥭", "🍍", "🥥", "🥝"]
    
    static private var themes = [
        Theme(name: "Cityscapes", emojiArray: cityscapeEmojis, size: 6, color: "blue"),
        Theme(name: "Plants", emojiArray: plantEmojis, size: 6, color: "green"),
        Theme(name: "Fruit", emojiArray: fruitEmojis, size: 6, color: "purple")
    ]
    
    static private func createMemoryGame(theme: Theme) ->
    MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCards: theme.size) { pairIndex in
            theme.emojiArray[pairIndex]
        }
    }
    
    init () {
        let randomTheme = EmojiMemoryGame.themes[Int.random(in: 0..<EmojiMemoryGame.themes.count)]
        themeColor = EmojiMemoryGame.generateThemeColor(randomTheme.color)
        themeTitle = randomTheme.name
        model = EmojiMemoryGame.createMemoryGame(theme: randomTheme)
    }
    
    func newMemoryGame() {
        let randomTheme = EmojiMemoryGame.themes[Int.random(in: 0..<EmojiMemoryGame.themes.count)]
        themeColor = EmojiMemoryGame.generateThemeColor(randomTheme.color)
        themeTitle = randomTheme.name
        model = EmojiMemoryGame.createMemoryGame(theme: randomTheme)
    }
    
    
    @Published private var model: MemoryGame<String>
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    var score: Int {
        model.score
    }
    
    static private func generateThemeColor(_ color: String) -> Color {
        switch color {
        case "blue":
            return Color.blue
        case "green":
            return Color.green
        case "purple":
            return Color.purple
        default:
            return Color.red
        }
    }
    
    var themeColor: Color
    
    var themeTitle: String
    
    
    
    
    
}

