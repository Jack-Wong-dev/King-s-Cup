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

        cards = temp.shuffled()
    }
}

struct AnimatedBackground: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @StateObject private var vm = AnimatedGridViewModel()
    
    var column: [GridItem] {
        switch (horizontalSizeClass, verticalSizeClass) {
        case (.compact, .regular):
            return Array(repeating: .init(), count: 6)
        case (.regular, .compact):
            return Array(repeating: .init(), count: 12)
        default:
            return Array(repeating: .init(), count: 12)
        }
    }
    
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .center) {
                LazyVGrid(columns: column) {
                    ForEach(vm.cards, content: BlinkingCard.init)
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct AnimatedBackgroundV2: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @StateObject private var vm = AnimatedGridViewModel()
    
    var column: [GridItem] {
        switch (horizontalSizeClass, verticalSizeClass) {
        case (.compact, .regular):
            return Array(repeating: .init(), count: 6)
        case (.regular, .compact):
            return Array(repeating: .init(), count: 12)
        default:
            return Array(repeating: .init(), count: 12)
        }
    }
    
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .center) {
                LazyVGrid(columns: column) {
                    ForEach(0..<53, id: \.self) { _ in
                        BlinkingCardV2()
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct BlinkingCardV2: View {
    @StateObject private var vm = BlinkingCardViewModel()
    @State private var isAnimating = false
    @State private var currentCard = Card(rank: .eight, suit: .hearts)

    var body: some View {
        Image(vm.currentCard.image)
            .resizable()
            .scaledToFit()
            .opacity(isAnimating ? 1 : 0)
            .onAppear(perform: startAnimation)
    }
    
    private func startAnimation() {
        vm.setTimer()
        withAnimation(Animation.easeInOut(duration: vm.duration)
                        .repeatForever(autoreverses: true)
                        .delay(vm.delay)) {
            isAnimating = true
        }
    }
    
//    private func animate(_ newCard: Card) {
//        withAnimation(Animation.easeInOut(duration: vm.duration)
//                        .delay(vm.delay)) {
//            card = newCard
//        }
//    }
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
    let card: Card
    @State private var isAnimating = false

    var body: some View {
        Image(card.image)
            .resizable()
            .scaledToFit()
            .opacity(isAnimating ? 1 : 0)
            .onAppear(perform: startAnimation)
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
