//
//  AnimatedBackground.swift
//  King's Cup (iOS)
//
//  Created by Jack Wong on 3/13/21.
//

import SwiftUI

class AnimatedGridViewModel: ObservableObject {
    @Published var cards = [Card]()

    init() {
       shuffle()
    }
    
    private func shuffle() {
        var temp = [Card]()
        
        for suit in Suit.allCases {
            for rank in Rank.allCases {
                temp.append(.init(rank: rank, suit: suit))
            }
        }
        
        temp.shuffle()
        
        for i in 0...19 {
            let tempCard = temp[i]
            temp.append(.init(rank: tempCard.rank, suit: tempCard.suit))
        }
        
        cards = temp
    }
}

struct AnimatedBackground: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @StateObject private var vm = AnimatedGridViewModel()
    
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .center) {
                LazyVGrid(columns: getColumn(proxy)) {
                    ForEach(vm.cards, content: BlinkingCard.init)
                }
            }
            .drawingGroup()
        }
        .ignoresSafeArea()
    }
    
    func getColumn(_ proxy: GeometryProxy) -> [GridItem] {
        switch (horizontalSizeClass, verticalSizeClass) {
        case (.compact, .regular):
            return Array(repeating: .init(), count: 6)
        case (.regular, .compact):
            return Array(repeating: .init(), count: 12)
        default:
            if proxy.size.width < proxy.size.height {
                return Array(repeating: .init(), count: 8)
            } else {
                return Array(repeating: .init(), count: 12)
            }
        }
    }
}


class BlinkingCardViewModel: ObservableObject {
    @Published var cards = [Card]()
    @Published var duration = Double.random(in: 1.0...2.0)
    @Published var delay = Double.random(in: 0...1.5)
    @Published private(set) var currentCard = Card(rank: .ace, suit: .clubs)

    init() {
       shuffle()
    }
    
    private func shuffle() {
        var temp = [Card]()
        
        for suit in Suit.allCases {
            for rank in Rank.allCases {
                temp.append(.init(rank: rank, suit: suit))
            }
        }

        cards = temp.shuffled()
    }
    
    func setTimer() {
        Timer.scheduledTimer(withTimeInterval: (2 * duration + delay), repeats: true) { [unowned self] _ in
            if let randomCard = cards.randomElement() {
                currentCard = randomCard
            }
        }
    }
}


struct BlinkingCard: View {
    var card: Card
    @State private var isAnimating = false

    var body: some View {
        Image(card.image)
            .resizable()
            .scaledToFit()
            .opacity(isAnimating ? 1 : 0)
            .onAppear(perform: startAnimation)
            .onDisappear(perform: {
                isAnimating = false
            })
    }

    private func startAnimation() {
        withAnimation(Animation.easeInOut(duration: .random(in: 1.0...2.0))
                        .repeatForever(autoreverses: true)
                        .delay(.random(in: 0...1.5))) {
            isAnimating = true
        }
    }
}

struct AnimatedBackground_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedBackground()
    }
}
