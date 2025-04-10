//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Ellis O'Dowd on 4/7/25.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    static let vehicleEmojis = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🚚", "🚛", "🚜", "🛻", "🚲", "🛴", "🏍", "🛵", "🚤", "✈️", "🚁", "🚂", "🚆", "🚇"].shuffled()
    
    static let animalEmojis = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵", "🐔", "🐧", "🐦", "🐤", "🐺", "🦄", "🐝", "🐛", "🦋"].shuffled()
    static let valueableEmojis = ["💎", "💰", "🪙", "🏆", "🎖", "🥇", "💵", "💴", "💶", "💷", "📈", "📉", "💳", "🏦", "💸", "💲", "🤑", "💼", "⚖️", "🔑", "🏠", "🚗", "🛥", "🚀"].shuffled()
    static let halloweenEmojs = ["🎃", "👻", "🧛‍♂️", "👻", "🧟‍♀️","👽","👺"]
    struct Theme {
        let name: String
        let pairAmount: Int
        let color: String
        let emojis: [String]
    }
    static let themes: [Theme] = [
        Theme(name: "Vehicles", pairAmount: 10, color: "blue", emojis: vehicleEmojis),
        Theme(name: "Animals", pairAmount: 8, color: "red", emojis: animalEmojis),
        Theme(name: "Valuables", pairAmount: 6, color: "yellow", emojis: valueableEmojis),
        Theme(name: "Halloween", pairAmount: 4, color: "orange", emojis: halloweenEmojs)
    ]
    static var sampleTheme = themes.randomElement()
    static var currentTheme: Theme = sampleTheme ?? themes[0]
    func changeTheme() {
        print("Changing theme")
        if let newTheme = EmojiMemoryGame.themes.randomElement() {
            EmojiMemoryGame.currentTheme = newTheme
            model = EmojiMemoryGame.createMemoryGame()
            print("New theme is \(EmojiMemoryGame.currentTheme.name)")
        }
    }
    static func createMemoryGame()->MemoryGame<String>{
        
       
        //second part is the createCardContent fucntion
        
        let safePairAmount: Int
        if(currentTheme.emojis.count < currentTheme.pairAmount){
            //bigger pairAmount than emojis
            safePairAmount = currentTheme.emojis.count

        } else {
            //normal case
           safePairAmount = currentTheme.pairAmount
        }
        
        return MemoryGame<String>(numberOfPairsOfCards: safePairAmount
        ){
            pairIndex in currentTheme.emojis[pairIndex]
        }
    }
    func getCardColor()->String{
        return EmojiMemoryGame.currentTheme.color
    }
    func getThemeName()->String{
        return EmojiMemoryGame.currentTheme.name
    }
    
    
    func newGame()->Void{
        changeTheme()
        
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
