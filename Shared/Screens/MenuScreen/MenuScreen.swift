//
//  MenuScreen.swift
//  King's Cup (iOS)
//
//  Created by Jack Wong on 3/8/21.
//

import SwiftUI

enum HelpAction: Int, Identifiable {
    var id: Int { self.rawValue }
    
    case showUsedCards
    case showGuide
}

struct MenuScreen: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @EnvironmentObject var appStateContainer: AppStateContainer
    @EnvironmentObject var brain: GameViewModel
    @State private var helpAction: HelpAction?
    
    var proxy: GeometryProxy
    
    var scale: CGFloat {
        switch (horizontalSizeClass, verticalSizeClass) {
        case (.regular, .regular):
            return 0.3
        default:
            return 0.5
        }
    }
    
    var body: some View {
        VStack {
            Button(action: resume) {
                Text("Resume")
                    .fontWeight(.semibold)
                    .frame(maxWidth: proxy.size.width * scale)
            }
            
            Button(action: restart) {
                Text("Restart")
                    .fontWeight(.semibold)
                    .frame(maxWidth: proxy.size.width * scale)
            }
            
            Button(action: showUsedCards) {
                Text("Cards Used")
                    .fontWeight(.semibold)
                    .frame(maxWidth: proxy.size.width * scale)
            }
            
            Button(action: showTutorial) {
                Text("How to play")
                    .fontWeight(.semibold)
                    .frame(maxWidth: proxy.size.width * scale)
            }
            
            Button(action: exit) {
                Text("Exit Game")
                    .fontWeight(.semibold)
                    .frame(maxWidth: proxy.size.width * scale)
            }
        }
        .font(.system(Font.TextStyle.body, design: .rounded))
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
//        withAnimation {
            appStateContainer.destinationState.destination = .welcome
//        }
    }
}

//struct MenuScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        MenuScreen()
//    }
//}
