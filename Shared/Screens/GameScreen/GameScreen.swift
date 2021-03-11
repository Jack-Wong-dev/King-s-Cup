//
//  GameScreen.swift
//  King's Cup (iOS)
//
//  Created by Jack Wong on 3/6/21.
//

import SwiftUI

struct GameScreen: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @EnvironmentObject var usedCards: UsedCardsViewModel
    @StateObject private var brain = GameViewModel()
    
    @State private var showMenu = false
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color.background.ignoresSafeArea()
                
                if verticalSizeClass == .compact {
                    HStack {
                        ZStack {
                            if brain.cards.count > 1 {
                                CardBackView()
                            }
                                                
                            ForEach(brain.cards.suffix(1)) { card in
                                PlayingCard(card: card)
                            }
                        }
                        .frame(width: proxy.size.width / 2)
                        .zIndex(10)
                        
                        VStack {
                            Spacer(minLength: 0)
                            CurrentCardDetail()
                            Spacer(minLength: 0)
                            GameHUD()
                        }
                        .frame(width: proxy.size.width / 2)
                    }
                } else {
                    VStack {
                        ZStack {
                            if brain.cards.count > 1 {
                                CardBackView()
                            }
                                                
                            ForEach(brain.cards.suffix(1)) { card in
                                PlayingCard(card: card)
                            }
                        }
                        .zIndex(10)
                        
                        VStack {
                            CurrentCardDetail()
                            Spacer(minLength: 0)
                            GameHUD()
                        }
                    }
                }
            }
        }
        .environmentObject(brain)
    }
}

struct GameScreen_Previews: PreviewProvider {
    @StateObject static private var vm = UsedCardsViewModel()

    static var previews: some View {
        GameScreen()
            .environmentObject(vm)
//            .preferredColorScheme(.dark)
    }
}
