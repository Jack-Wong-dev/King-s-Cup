//
//  WelcomeScreen.swift
//  King's Cup (iOS)
//
//  Created by Jack Wong on 3/8/21.
//

import SwiftUI

struct WelcomeScreen: View {
    @EnvironmentObject var appContainer: AppStateContainer
    
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 20) {
                Text("King's Cup")
                    .font(.system(Font.TextStyle.largeTitle, design: .rounded))
                    .fontWeight(.bold)
                
                Button(action: play) {
                    Text("Play")
                        .fontWeight(.semibold)
                        .frame(maxWidth: proxy.size.width * 0.5)
                }
                
                Button(action: showTutorial) {
                    Text("How to play")
                        .fontWeight(.semibold)
                        .frame(maxWidth: proxy.size.width * 0.5)
                }
                
                Button(action: openOptionsMenu) {
                    HStack {
                        Text("Options")
                            .fontWeight(.semibold)
                        
                        + Text(" (Coming Soon)")
                            .fontWeight(.semibold)
                            .foregroundColor(.red)
                    }
                    .frame(maxWidth: proxy.size.width * 0.5)
                }
                .disabled(true)
            }
            .font(.system(Font.TextStyle.body, design: .rounded))
            .frame(
                width: proxy.frame(in: .global).width,
                height: proxy.frame(in: .global).height
            )
        }
    }
    
    private func play() {
        withAnimation {
            appContainer.destinationState.destination = .game
        }
    }
    
    private func showTutorial() {
        withAnimation {
            appContainer.destinationState.destination = .guide
        }
    }
    
    private func openOptionsMenu() {
        
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

