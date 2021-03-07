//
//  CardView.swift
//  King's Cup (iOS)
//
//  Created by Jack Wong on 3/6/21.
//

import SwiftUI

struct CardImage: View {
    let card: Card
        
    var body: some View {
        Image(card.image)
            .resizable()
            .scaledToFit()
        //                .shadow(color: Color(.label).opacity(0.3), radius: 10, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 5)
    }
}

struct CardImage_Previews: PreviewProvider {
    static var previews: some View {
        CardImage(card: Card(rank: .ace, suit: .spades))
            .previewLayout(.sizeThatFits)
            .frame(width: 200)
            .padding()
    }
}
