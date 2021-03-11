//
//  MenuScreen.swift
//  King's Cup (iOS)
//
//  Created by Jack Wong on 3/8/21.
//

import SwiftUI

struct MenuScreen: View {
    @EnvironmentObject var brain: GameViewModel
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

//struct MenuScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        MenuScreen()
//    }
//}
