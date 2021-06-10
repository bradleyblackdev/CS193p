//
//  File.swift
//  Memorize
//
//  Created by Bradley Black on 5/31/21.
//

import Foundation

struct MemoryGame<CardContent: Equatable> {
    private(set) var cards: Array<Card>
    
    var score = 0
    
    private var visibleCardIndex: Int? {
        get { cards.indices.filter({ cards[$0].isFaceUp }).oneAndOnly }
        set { cards.indices.forEach { cards[$0].isFaceUp = $0 == newValue} }
    }
    
    mutating func choose(_ card: Card) {
        let index = cards[card.id].id
        if !cards[index].isFaceUp, !cards[index].isMatched {
            if let potentialMatchIndex = visibleCardIndex {
                if cards[index].content == cards[potentialMatchIndex].content {
                    cards[index].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                } else {
                    cards[index].previouslySeen ? score -= 1 : nil
                    cards[potentialMatchIndex].previouslySeen ? score -= 1 : nil
                    cards[index].previouslySeen = true
                    cards[potentialMatchIndex].previouslySeen = true
                }
                cards[index].isFaceUp = true
            } else {
                visibleCardIndex = index
            }
        }
    }
                
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
        cards.shuffle()
        for (n, _) in cards.enumerated() {
            cards[n].id = n
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent //dont care!
        var id = 0
        var previouslySeen = false
    }
    
    struct Theme {
        let name: String
        var emojiArray = [String]()
        let size: Int
        let color: String
    }
}


extension Array {
    var oneAndOnly: Element? {
        if count == 1 {
            return first
        } else {
            return nil
        }
    }
}

