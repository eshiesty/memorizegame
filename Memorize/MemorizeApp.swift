//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Ellis O'Dowd on 4/5/25.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
