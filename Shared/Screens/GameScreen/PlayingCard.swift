//
//  PlayingCard.swift
//  King's Cup (iOS)
//
//  Created by Jack Wong on 3/8/21.
//

import SwiftUI

struct PlayingCard: View {
    @EnvironmentObject var brain: GameViewModel
    @GestureState private var dragState = DragState.inactive
    @State private var translation: CGSize = .zero
    
    var card: Card
    private let dragAreaThreshold: CGFloat = 65.0
    
    @State var flipped: Bool = false
    @State var flip: Bool = false
    
    var body: some View {
        Image(flipped == true ?  card.image : "cardBack2" )
            .cardModifier()
            .offset(
                x: dragState.translation.width,
                y: dragState.translation.height
            )
            .scaleEffect(dragState.isDragging ? 0.85 : 1.0)
            .rotationEffect(
                Angle(degrees: .init(dragState.translation.width / 24))
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
            .onAppear(perform: flipCard)
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
    
    private func flipCard() {
        withAnimation(.spring()) {
            flip = true
        }
    }
    
    private func fetchNextCard() {
        brain.proceedToNextCard()
    }
}

