//
//  CardDetailView.swift
//  King's Cup (iOS)
//
//  Created by Jack Wong on 3/10/21.
//

import SwiftUI

struct CurrentCardDetail: View {
    @EnvironmentObject var brain: GameViewModel
    
    var currentCard: Card? { brain.cards.last }
    
    var body: some View {
        VStack(spacing: 20) {
            if let card = currentCard {
                Text(card.rank.ruleTitle)
                    .font(.headline)
                Text(card.rank.ruleDescription)
            }
        }
        .padding()
    }
}
