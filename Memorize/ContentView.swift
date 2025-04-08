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
            Text("Memorize!")
            ScrollView{
                LazyVGrid(columns:[GridItem(.adaptive(minimum: 70))]) {
                    ForEach(viewModel.cards){ card in
                        CardView(card:card).aspectRatio(2/3, contentMode: .fit).onTapGesture {
                            viewModel.choose(card)
                        }
                    }
                }.padding().foregroundColor(.red)
                Spacer()
//            ThemeView
//            HStack{
//                
//                
//                remove
//                Spacer()
//                add
//            }.padding(.horizontal).font(.largeTitle)
        }
    }
    
//    
//        var remove: some View {
//            Button{ emojiCount -= 1}
//            label:{
//                Image(systemName: "minus.circle")
//            }
//        }
//        var add: some View {
//            Button{ emojiCount += 1}
//            label:{
//                Image(systemName: "plus.circle")
//            }
//        }
//    var ThemeView: some View{
//        
//            HStack{
//              
//                Button{ currentTheme = vehicleEmojis}
//                label:{
//                    Image(systemName: "car.circle")
//                }
//                Button{ currentTheme = animalEmojis}
//                label:{
//                    Image(systemName: "person.circle")
//                }
//                Button{ currentTheme = valueableEmojis}
//                label:{
//                    Image(systemName: "bag.circle")
//                }
//                
//               
//            }.padding(.horizontal).font(.largeTitle)
//
//        
//    }
}

struct CardView: View{
    var card:MemoryGame<String>.Card
//    var content: String
//    @State var isFaceUp: Bool = true
    var body: some View{
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp{
                
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else {
                shape.fill()
                
            }
        }
    }
}





#Preview {
    let game = EmojiMemoryGame()
    ContentView(viewModel: game)
        
}
