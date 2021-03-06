//
//  CardDetailView.swift
//  King's Cup (iOS)
//
//  Created by Jack Wong on 3/6/21.
//

import SwiftUI

struct CardDetailView: View {
    let card: Card
    
    var body: some View {
        VStack {
            Text(card.title)
                .font(.title)
                .fontWeight(.bold)
            CardView(card: card)
        }
    }
}

struct CardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CardDetailView(card: .init(rank: .seven, suit: .hearts))
            .previewLayout(.sizeThatFits)
            .frame(width: 200)
            .padding()
    }
}
