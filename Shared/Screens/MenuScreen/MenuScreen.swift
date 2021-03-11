//
//  MenuScreen.swift
//  King's Cup (iOS)
//
//  Created by Jack Wong on 3/8/21.
//

import SwiftUI

struct MenuScreen: View {
    @EnvironmentObject var brain: GameViewModel
    
    var body: some View {
        GeometryReader { proxy in
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
            .frame(
                width: proxy.frame(in: .global).width,
                height: proxy.frame(in: .global).height
            )
        }
    }
    
    private func resume() {
        brain.gameState = .resume
    }
    
    private func restart() {
        brain.gameState = .start
    }
    
    private func showUsedCards() {
        
    }
    
    private func showTutorial() {
        
    }
    
    private func exit() {
        
    }
}

struct MenuScreen_Previews: PreviewProvider {
    static var previews: some View {
        MenuScreen()
    }
}
