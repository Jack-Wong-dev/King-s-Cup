//
//  CardPile.swift
//  King's Cup (iOS)
//
//  Created by Jack Wong on 3/10/21.
//

import SwiftUI

struct CardPile: View {
    @EnvironmentObject var brain: GameViewModel
    
    var body: some View {
        ZStack {
            if brain.cards.count > 1 {
                CardBackView()
            }
                                
            ForEach(brain.cards.suffix(1)) { card in
                PlayingCard(card: card)
            }
        }
    }
}

struct CardPile_Previews: PreviewProvider {
    static var previews: some View {
        CardPile()
    }
}
