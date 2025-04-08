//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Ellis O'Dowd on 4/7/25.
//

import Foundation
import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let vehicleEmojis = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🚚", "🚛", "🚜", "🛻", "🚲", "🛴", "🏍", "🛵", "🚤", "✈️", "🚁", "🚂", "🚆", "🚇"].shuffled()
    
    static let animalEmojis = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵", "🐔", "🐧", "🐦", "🐤", "🐺", "🦄", "🐝", "🐛", "🦋"].shuffled()
    static let valueableEmojis = ["💎", "💰", "🪙", "🏆", "🎖", "🥇", "💵", "💴", "💶", "💷", "📈", "📉", "💳", "🏦", "💸", "💲", "🤑", "💼", "⚖️", "🔑", "🏠", "🚗", "🛥", "🚀"].shuffled()
    
    static func createMemoryGame()->MemoryGame<String>{
        return MemoryGame<String>(numberOfPairsOfCards: 4){pairIndex in EmojiMemoryGame.vehicleEmojis[pairIndex]
        }
    }
    
    
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose (_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
}
