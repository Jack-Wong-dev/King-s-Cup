//
//  CardView.swift
//  King's Cup (iOS)
//
//  Created by Jack Wong on 3/7/21.
//

import SwiftUI

struct CardView: View {
    @EnvironmentObject var usedCards: UsedCardsViewModel
    
    var card: Card
   
    @State private var translation: CGSize = .zero
    @State private var show = false
    
    var onRemove: (_ card: Card) -> Void
    
    init(_ card: Card, onRemove: @escaping (_ card: Card) -> Void) {
        self.card = card
        self.onRemove = onRemove
    }
    
    var body: some View {
        VStack {
            CardImage(card: card)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    @State static private var usedCards = UsedCardsViewModel()
    
    static var previews: some View {
        CardView(.init(rank: .ace, suit: .diamonds), onRemove: { _ in
            
        })
            .environmentObject(usedCards)
    }
}
