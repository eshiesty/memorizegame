//
//  MemoryGame.swift
//  Memorize
//
//  Created by Ellis O'Dowd on 4/7/25.
//

struct MemoryGame<CardContent> where CardContent:Equatable {
    private(set) var cards: Array<Card>
    private(set) var score = 0
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    mutating func choose(_ card: Card){
        
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}), !cards[chosenIndex].isMatched,!cards[chosenIndex].isFaceUp {
          
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                } else {
                    if(cards[potentialMatchIndex].beenSeen == true){
                        score -= 1
                    } else {
                        cards[potentialMatchIndex].beenSeen = true
                    }
                    if(cards[chosenIndex].beenSeen == true){
                        score -= 1
                    } else {
                        cards[chosenIndex].beenSeen = true
                    }
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                for index in  cards.indices{
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                //second card been seen
               
                //first card been seen
//                if(cards[indexOfTheOneAndOnlyFaceUpCard!].beenSeen == true){
//                    score -= 1
//                } else {
//                    cards[indexOfTheOneAndOnlyFaceUpCard!].beenSeen = true
//                }
            }
        cards[chosenIndex].isFaceUp.toggle()
        }
        print("\(cards)")
    }
    func index(of card: Card) -> Int? {
        for index in  0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return nil
    }
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent){
        cards = Array<Card>()
        
       
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards.shuffle()
        //add numberOfPairsOfCards x 2 to cards array
    }
    struct Card:Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var beenSeen: Bool = false
        var content: CardContent
        var id: Int
    }
}
