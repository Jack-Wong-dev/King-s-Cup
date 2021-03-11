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
                
                if brain.cards.isEmpty {
                    ZStack {
                        VStack {
                            Text("No more cards. Play again?")
                            Button {
                                brain.restart()
                            } label: {
                                Image(systemName: "play")
                            }
                        }
                    }
                }
                
                if verticalSizeClass == .compact ||
                    (horizontalSizeClass == .regular && verticalSizeClass == .regular && proxy.size.width > proxy.size.height)
                    {
                    HStack {
                        CardPile()
                            .frame(width: proxy.size.width / 2)
                            .zIndex(10)
                        
                        VStack {                            
                            CurrentCardDetail()
                            
                            Spacer(minLength: 0)
                            
                            GameHUD()
                        }
                        .frame(width: proxy.size.width / 2)
                    }
                } else {
                    VStack {
                        CardPile()
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
