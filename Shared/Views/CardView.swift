//
//  CardView.swift
//  King's Cup (iOS)
//
//  Created by Jack Wong on 3/6/21.
//

import SwiftUI

struct CardView: View {
    let card: Card
    
    var url: String { "\(card.rank.rawValue)_of_\(card.suit.rawValue)" }
    
    var body: some View {
        VStack {
            Image(url)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card(rank: .ace, suit: .spades))
    }
}
