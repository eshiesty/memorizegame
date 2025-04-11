//
//  ContentView.swift
//  Memorize
//
//  Created by Ellis O'Dowd on 4/5/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel:EmojiMemoryGame
    var body: some View {
        Text(viewModel.getThemeName())
        ScrollView{
            LazyVGrid(columns:[GridItem(.adaptive(minimum: 70))]) {
                ForEach(viewModel.cards){ card in
                    CardView(card:card, viewModel:viewModel).aspectRatio(2/3, contentMode: .fit).onTapGesture {
                        viewModel.choose(card)
                    }
                }
            }.padding().foregroundColor(.red)
            Spacer()
        }
        HStack{
            Text("Score: \(viewModel.getScore())")
            Spacer()
            Button(action: {
                viewModel.changeTheme()
            }){
                Text("New game")
            }
        }.padding(20)
    }
}

struct CardView: View{
    var card:MemoryGame<String>.Card
    var viewModel: EmojiMemoryGame
//    var content: String
//    @State var isFaceUp: Bool = true
    func getColor()->Color{
        switch(viewModel.getCardColor()){
        case "blue":
            return Color.blue
        case "red":
                return Color.red
        case "yellow":
                return Color.yellow
        case "orange":
                return Color.orange
        default:
           return Color.gray
        }
    }
    var body: some View{
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp{
                
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3).foregroundColor(getColor())
                Text(card.content).font(.largeTitle)
            } else if (card.isMatched){
                shape.opacity(0)
                
            }
            else{
                shape.fill().foregroundColor(getColor())
               
                
            }
        }
    }
}





#Preview {
    let game = EmojiMemoryGame()
    ContentView(viewModel: game)
        
}
