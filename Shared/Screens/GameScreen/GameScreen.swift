//
//  GameScreen.swift
//  King's Cup (iOS)
//
//  Created by Jack Wong on 3/6/21.
//

import SwiftUI

struct GameScreen: View {
    @EnvironmentObject var usedCards: UsedCardsViewModel
    @ScaledMetric private var size: CGFloat = 48
    @StateObject private var brain = GameViewModel()
    @State private var columns: [GridItem] = [.init(.adaptive(minimum: 100, maximum: 200))]
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(brain.cards, content: CardImage.init)
                }
                .padding(.horizontal)
            }
            
            Button(action: restart) {
                Image(systemName: "restart.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: size, height: size)
                    .foregroundColor(.purple)
            }
            .padding(.horizontal)
        }
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
    }
}
