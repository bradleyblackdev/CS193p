//
//  File.swift
//  Memorize
//
//  Created by Bradley Black on 5/31/21.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    func choose(_ card: Card) {
        
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        //add number of pairsofcards * 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))

        }
    }
    
    struct Card {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent //dont care!
    }
}

