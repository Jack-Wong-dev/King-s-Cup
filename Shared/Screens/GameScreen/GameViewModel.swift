//
//  GameViewModel.swift
//  King's Cup (iOS)
//
//  Created by Jack Wong on 3/6/21.
//

import Foundation
import Combine

enum GameState {
    case start
    case menu
    case resume
    case finished
}

class GameViewModel: ObservableObject {
    @Published var cards = [Card]()
    @Published private(set) var usedCards = [Card]()
    @Published var gameState: GameState = .start
    @Published private(set) var kingCounter = 0
    
    var cancellable: AnyCancellable?
    var gameToken: AnyCancellable?
    
    init() {        
        gameToken = $gameState
            .sink(receiveValue: { [unowned self] state in
                if case .start = state {
                    self.resetGameBoard()
                }
            })
        
        cancellable = $cards
            .sink(receiveValue: { [unowned self] card in
                if card.last?.rank == Rank.king {
                    self.kingCounter += 1
                } else if card.isEmpty {
                    gameState = .finished
                }
            })
    }
    
    func restart() {
        gameState = .start
    }
    
    private func resetGameBoard() {
        kingCounter = 0
        cards.removeAll()
        usedCards.removeAll()
        var temp = [Card]()
        
        for suit in Suit.allCases {
            for rank in Rank.allCases {
                temp.append(.init(rank: rank, suit: suit))
            }
        }
        
        cards = temp.shuffled()
    }

    func proceedToNextCard() {
        if let card = cards.popLast() {
            usedCards.append(card)
        }
    }
}
