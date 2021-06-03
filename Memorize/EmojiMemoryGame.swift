//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Bradley Black on 5/31/21.
//

import SwiftUI

//func makeCardContent(index: Int) -> String {
//    return "⛩"
//}

class EmojiMemoryGame {
    static let emojis = ["🌁", "🌉", "🌌", "🌃", "🏙", "🌆", "🎆", "🎇", "🌠", "🌄", "🌅", "🏞", "🎑"]
    
    private var model: MemoryGame<String> =
//           MemoryGame<String>(numberOfPairsOfCards: 4, createCardContent: makeCardContent)
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }

}
