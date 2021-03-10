//
//  Card.swift
//  King's Cup (iOS)
//
//  Created by Jack Wong on 3/6/21.
//

import Foundation

struct Card: Identifiable, Hashable, Equatable {
    var id: String { title }
    
    let rank: Rank
    let suit: Suit
    
    var title: String {
        "\(rank.rawValue.capitalized) of \(suit.rawValue.capitalized)"
    }
    
    var image: String { "\(rank.rawValue)_of_\(suit.rawValue)" }

}
