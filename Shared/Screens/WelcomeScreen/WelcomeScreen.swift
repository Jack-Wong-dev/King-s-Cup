//
//  WelcomeScreen.swift
//  King's Cup (iOS)
//
//  Created by Jack Wong on 3/8/21.
//

import SwiftUI

struct WelcomeScreen: View {
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 20) {
                Button(action: play) {
                    Text("Play")
                        .frame(maxWidth: proxy.size.width * 0.5)
                }
                
                Button(action: openOptionsMenu) {
                    Text("Options")
                        .frame(maxWidth: proxy.size.width * 0.5)
                }
                
                Button(action: showTutorial) {
                    Text("How to play")
                        .frame(maxWidth: proxy.size.width * 0.5)
                    
                }
            }
            .frame(
                width: proxy.frame(in: .global).width,
                height: proxy.frame(in: .global).height
            )
        }
    }
    
    private func play() {
        
    }
    
    private func openOptionsMenu() {
        
    }
    
    private func showTutorial() {
        
    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WelcomeScreen()
                
            WelcomeScreen()
                .preferredColorScheme(.dark)
        }
        .buttonStyle(SelectionButtonStyle())
    }
}

