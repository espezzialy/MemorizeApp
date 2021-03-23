//
//  EmojiMemoryGame.swift
//  MemorizeApp
//
//  Created by Espezzialy Raphael Oliveira Souza on 19/03/21.
//

import SwiftUI

class EmojiMemoryGame {
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() ->  MemoryGame<String> {
        let emojis: Array<String> = ["👻","🎃", "🕷", "👺", "💀"]
        let randomNumber = Int.random(in: 2...5)
        return MemoryGame<String>(numberOfPairsOfCards: randomNumber) { pairIndex in
            return emojis[pairIndex]
        }
    }
//    MARK: - Access to the model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
//    MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
