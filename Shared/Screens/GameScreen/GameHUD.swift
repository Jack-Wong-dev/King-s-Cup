//
//  GameHUD.swift
//  King's Cup (iOS)
//
//  Created by Jack Wong on 3/10/21.
//

import SwiftUI

struct GameHUD: View {
    @EnvironmentObject var usedCards: UsedCardsViewModel
    @EnvironmentObject var brain: GameViewModel
    
    var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading) {
                Text("King : \(brain.kingCounter) / 4")
                Text("Cards Remaining: \(brain.cards.count - 1 > 0 ?  brain.cards.count - 1 : 0 )")
            }
            .foregroundColor(.purple)
            
            Spacer(minLength: 0)

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
    
    private func restart() {
        withAnimation {
            brain.restart()
            usedCards.restart()
        }
    }
}

struct GameHUD_Previews: PreviewProvider {
    static var previews: some View {
        GameHUD()
    }
}
