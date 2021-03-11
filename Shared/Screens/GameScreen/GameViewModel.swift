//
//  GameViewModel.swift
//  King's Cup (iOS)
//
//  Created by Jack Wong on 3/6/21.
//

import Foundation
import Combine

class GameViewModel: ObservableObject {
    @Published var cards = [Card]()
    @Published private(set) var kingCounter = 0
    
    var cancellable: AnyCancellable?
    
    init() {
        restart()
        
        cancellable = $cards
            .sink(receiveValue: { [unowned self] card in
                if card.last?.rank == Rank.king {
                    self.kingCounter += 1
                }
            })
    }
    
    func restart() {
        kingCounter = 0
        shuffle()
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
