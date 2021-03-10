//
//  GameViewModel.swift
//  King's Cup (iOS)
//
//  Created by Jack Wong on 3/6/21.
//

import Foundation
import Combine

class GameViewModel: ObservableObject {
    @Published var currentCard: Card?
    @Published var cards = [Card]()
    
    var cardShown: Card? {
        cards.last
    }
    
    init() {
        restart()
    }
    
    func restart() {
        shuffle()
        fetchNextCard()
    }
    
    func fetchNextCard() {
        currentCard = cards.popLast()
    }
    
    private func shuffle() {
        cards.removeAll()
        var temp = [Card]()
        
        for suit in Suit.allCases {
            for rank in Rank.allCases {
                temp.append(.init(rank: rank, suit: suit))
            }
        }
        
        cards = temp.shuffled()
    }
}

enum GameState {
    case ongoing
    case restart
}
