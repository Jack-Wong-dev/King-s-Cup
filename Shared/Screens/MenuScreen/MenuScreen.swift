//
//  MenuScreen.swift
//  King's Cup (iOS)
//
//  Created by Jack Wong on 3/8/21.
//

import SwiftUI

struct MenuScreen: View {
    enum HelpAction: Int, Identifiable {
        var id: Int { self.rawValue }
        
        case showUsedCards
        case showGuide
    }
    
    @EnvironmentObject var brain: GameViewModel
    @State private var helpAction: HelpAction?
    
    var proxy: GeometryProxy
    
    var body: some View {
        VStack {
            Button(action: resume) {
                Text("Resume")
                    .frame(maxWidth: proxy.size.width * 0.5)
            }
            
            Button(action: restart) {
                Text("Restart")
                    .frame(maxWidth: proxy.size.width * 0.5)
            }
            
            Button(action: showUsedCards) {
                Text("Cards used so far")
                    .frame(maxWidth: proxy.size.width * 0.5)
                
            }
            
            Button(action: showTutorial) {
                Text("How to play")
                    .frame(maxWidth: proxy.size.width * 0.5)
                
            }
            
            Button(action: exit) {
                Text("Exit")
                    .frame(maxWidth: proxy.size.width * 0.5)
                
            }
        }
        .padding()
        .sheet(item: $helpAction) { help in
            switch help {
            case .showUsedCards:
                UsedCardsView()
            case .showGuide:
                HowToPlayScreen()
            }
        }
    }
    
    
    private func resume() {
        brain.gameState = .resume
    }
    
    private func restart() {
        withAnimation {
            brain.gameState = .start
        }
    }
    
    private func showUsedCards() {
        withAnimation {
            helpAction = .showUsedCards
        }
    }
    
    private func showTutorial() {
        withAnimation {
            helpAction = .showGuide
        }
    }
    
    private func exit() {
        
    }
}

//struct MenuScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        MenuScreen()
//    }
//}
