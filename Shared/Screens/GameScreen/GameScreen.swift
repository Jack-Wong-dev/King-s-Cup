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
    @StateObject private var brain = GameViewModel()
    
    var gameState: GameState { brain.gameState }
    var showMenu: Bool { gameState == .menu }
        
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.lighting, Color.background]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                if gameState == .finished {
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
                            CurrentCardDetail(titleSize: 30, descriptionSize: 24)
                            
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
        .disabled(showMenu)
        .blur(radius: showMenu ? 50 : 0)
        .overlay(
            GeometryReader { proxy in
                ZStack(alignment: .center) {
                    if gameState == .menu {
                        MenuScreen(proxy: proxy)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .transition(.scale)
                    }
                }
            }
        )
        .environmentObject(brain)
    }
}

//struct GameScreen_Previews: PreviewProvider {
//    @StateObject static private var vm = UsedCardsViewModel()
//
//    static var previews: some View {
//        GameScreen()
//            .environmentObject(vm)
////            .preferredColorScheme(.dark)
//    }
//}
