//
//  UsedCardsViewModel.swift
//  King's Cup (iOS)
//
//  Created by Jack Wong on 3/6/21.
//

import Foundation
import Combine

class UsedCardsViewModel: ObservableObject {
    @Published var cards = [Card]()
    
    init() {
        for suit in Suit.allCases {
            for rank in Rank.allCases {
                cards.append(.init(rank: rank, suit: suit))
            }
        }
    }
}
