//
//  MemorizeApp.swift
//  MemorizeWatch WatchKit Extension
//
//  Created by Bradley Black on 6/9/21.
//

import SwiftUI

let game = EmojiMemoryGame()
let ContentView = EmojiMemoryGameView(game: game)

@main
struct MemorizeApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
