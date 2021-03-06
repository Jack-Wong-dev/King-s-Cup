//
//  Card.swift
//  King's Cup (iOS)
//
//  Created by Jack Wong on 3/6/21.
//

import Foundation

struct Card: Identifiable, Hashable, Equatable {
    var id = UUID()
    
    let rank: Rank
    let suit: Suit
    
    var title: String {
        "\(rank.rawValue.capitalized) of \(suit.rawValue.capitalized)"
    }
    
    var image: String { "\(rank.rawValue)_of_\(suit.rawValue)" }

    static func == (lhs: Card, rhs: Card) -> Bool {
        lhs.rank == rhs.rank && lhs.suit == rhs.suit
    }
}


