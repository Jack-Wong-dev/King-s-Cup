//
//  CardScreentest.swift
//  King's Cup (iOS)
//
//  Created by Jack Wong on 3/7/21.
//

import SwiftUI


struct CardContentView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @EnvironmentObject var usedCards: UsedCardsViewModel
    @EnvironmentObject var brain:  GameViewModel
    
    @State private var flipped = false
    @State private var flip = false
    
    var card: Card
    
    var currentCard: Card? { brain.cards.last }
    
    var body: some View {
        GeometryReader { proxy in
            if verticalSizeClass == .compact {
                HStack {
                    Spacer(minLength: 0)
                    
                    PlayingCard(card: card, proxy: proxy, flipped: $flipped, flip: $flip)
                        .zIndex(card == currentCard ? 10 : 0)
                        .shadow(radius: 10)
                        .padding()
                    
                    Spacer(minLength: 0)

                    VStack(spacing: 40) {
                        Text(card.rank.ruleTitle)
                            .font(.headline)
                        Text(card.rank.ruleDescription)
                    }
                    .frame(width: proxy.size.width / 2)
                    .opacity(card == currentCard ? 1 : 0)
                    .modifier(SizeModifier())
                }
                .frame(
                    width: proxy.frame(in: .global).width,
                    height: proxy.frame(in: .global).height
                )
                
            } else {
                VStack {
                    PlayingCard(card: card, proxy: proxy, flipped: $flipped, flip: $flip)
                        .frame(maxHeight: proxy.size.height / 2)
                        .shadow(radius: 10)
                        .padding()
                        .zIndex(card == currentCard ? 10 : 0)
                    
                    VStack(spacing: 20) {
                        Text(card.rank.ruleTitle)
                            .font(.headline)
                        Text(card.rank.ruleDescription)
                    }
                    .padding()
                    .opacity(card == currentCard ? 1 : 0)
                    .modifier(SizeModifier())
                    
                    Spacer(minLength: 0)
                }
                .frame(
                    width: proxy.frame(in: .global).width,
                    height: proxy.frame(in: .global).height
                )
            }
        }
    }
}


//struct ExampleCard_Previews: PreviewProvider {
//    static var previews: some View {
//        CardContentView()
//    }
//}
