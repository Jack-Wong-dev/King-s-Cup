//
//  CardsUsed.swift
//  King's Cup (iOS)
//
//  Created by Jack Wong on 3/6/21.


import SwiftUI

struct UsedCardsView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var brain: GameViewModel
    @State private var columns: [GridItem] = [.init(.adaptive(minimum: 100, maximum: 200))]

    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()

            VStack {
                HStack {
                    Button(action: dismiss) {
                        Text("Dismiss")
                            .padding([.top, .horizontal])
                    }
                    .buttonStyle(DefaultButtonStyle())
                    .accentColor(Color(.systemPurple))
                    
                    Spacer(minLength: 0)
                }
                
                if brain.usedCards.isEmpty {
                    Text("No used cards available")
                        .fontWeight(.semibold)
                }
                
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(brain.usedCards, id: \.self) { card in
                            Image(card.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
    
    private func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct CardsUsed_Previews: PreviewProvider {
    @StateObject static private var vm = GameViewModel()
    static var previews: some View {
        UsedCardsView()
            .environmentObject(vm)
    }
}

