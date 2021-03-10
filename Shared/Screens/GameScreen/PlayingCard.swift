//
//  PlayingCard.swift
//  King's Cup (iOS)
//
//  Created by Jack Wong on 3/8/21.
//

import SwiftUI

struct PlayingCard: View {
    @EnvironmentObject var usedCards: UsedCardsViewModel
    @EnvironmentObject var brain: GameViewModel
    @GestureState private var dragState = DragState.inactive
    @State private var translation: CGSize = .zero
    
    var card: Card
    var proxy: GeometryProxy
    
    private let dragAreaThreshold: CGFloat = 65.0
    
    @Binding var flipped: Bool
    @Binding var flip: Bool

    var currentCard: Card? { brain.cards.last }
    
    var body: some View {
        Image(flipped == true ?  card.image : "cardBack2" )
            .resizable()
            .aspectRatio(contentMode: .fit)
            .offset(
                x: currentCard == card ? dragState.translation.width: 0,
                y: currentCard == card ? dragState.translation.height: 0
            )
            .scaleEffect(dragState.isDragging && currentCard == card ? 0.85 : 1.0)
            .rotationEffect(
                Angle(degrees: currentCard == card ? .init(dragState.translation.width / 24) : 0)
            )
            .animation(.interpolatingSpring(stiffness: 120, damping: 120))
            .gesture(
                LongPressGesture(minimumDuration: 0.01)
                    .sequenced(before: DragGesture())
                    .updating($dragState) { (value, state, transaction) in
                        handleUpdating(value, &state)
                    }
                    .onEnded(onEnded)
            )
            .modifier(FlipEffect(flipped: $flipped, angle: flip ? 180 : 0))
            .onChange(of: currentCard, perform: flipCard)
            .onAppear(perform: animateIfFirstCard)
    }
  
    //MARK: - Methods
    private func handleUpdating(_ value: SequenceGesture<LongPressGesture, DragGesture>.Value, _ state: inout DragState) {
        switch value {
        case .first(true):
            state = .pressing
        case .second(true, let drag):
            state = .dragging(translation: drag?.translation ?? .zero)
        default:
            break
        }
    }
    
    private func onEnded(_ value: (GestureStateGesture<SequenceGesture<LongPressGesture, DragGesture>, DragState>.Value)) {
        guard case .second(true, let drag?) = value else { return }
        
        if drag.translation.width < -dragAreaThreshold || drag.translation.width > dragAreaThreshold {
           fetchNextCard()
        }
    }
    
    private func flipCard(_ newCard: Card?) {
        if newCard == card {
            withAnimation(.spring()){
                flip = true
            }
        }
    }
    
    private func animateIfFirstCard() {
        if currentCard == card {
            withAnimation(.spring()) {
                flip = true
            }
        }
    }
    
    private func fetchNextCard() {
        usedCards.addCard(card)
        _ = brain.cards.popLast()
    }
}

