//
//  CardView.swift
//  King's Cup (iOS)
//
//  Created by Jack Wong on 3/6/21.
//

import SwiftUI

struct CardView: View {
    let card: Card
        
    var body: some View {
        VStack {
            Image(card.image)
                .resizable()
                .scaledToFit()
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card(rank: .ace, suit: .spades))
            .previewLayout(.sizeThatFits)
            .frame(width: 200)
            .padding()
    }
}
