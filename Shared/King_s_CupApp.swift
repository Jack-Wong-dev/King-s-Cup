//
//  King_s_CupApp.swift
//  Shared
//
//  Created by Jack Wong on 3/5/21.
//

import SwiftUI

@main
struct King_s_CupApp: App {
    @StateObject private var usedCards = UsedCardsViewModel()
    
    var body: some Scene {
        WindowGroup {
//            GameScreen()
            TabScreen()
                .environmentObject(usedCards)
        }
    }
}
