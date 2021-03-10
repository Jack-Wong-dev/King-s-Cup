//
//  GameScreen.swift
//  King's Cup (iOS)
//
//  Created by Jack Wong on 3/6/21.
//

import SwiftUI

struct GameScreen: View {
    @EnvironmentObject var usedCards: UsedCardsViewModel
    @StateObject private var brain = GameViewModel()
    
    @State private var showMenu = false

    var currentCard: Card? { brain.cards.last }
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Color.background.ignoresSafeArea()
            
            if brain.cards.isEmpty {
                VStack(spacing: 20) {
                    Text("No more cards.  Play again?")
                   
                    Button(action: restart) {
                        Image(systemName: "play")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                    }
                    .accentColor(.purple)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            
            ZStack {
                ForEach(brain.cards.suffix(2)) { card in
                    CardContentView(card: card)
                }
            }
            .zIndex(1)
            
            HStack(alignment: .bottom) {
                Text("Cards Remaining: \(brain.cards.count - 1 > 0 ?  brain.cards.count - 1 : 0 )")

                Button(action: restart) {
                    Image(systemName: "gearshape")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 36, height: 36)
                }
                .buttonStyle(DefaultButtonStyle())
                .accentColor(.purple)
            }
            .padding()
        }
        .environmentObject(brain)
    }
    
    
    private func restart() {
        withAnimation {
            brain.restart()
            usedCards.restart()
        }
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


enum DragState {
    case inactive
    case pressing
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive, .pressing:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }

    var isDragging: Bool {
        switch self {
        case .dragging:
            return true
        case .pressing, .inactive:
            return false
        }
    }

    var isPressing: Bool {
        switch self {
        case .pressing, .dragging:
            return true
        case .inactive:
            return false
        }
    }
}

