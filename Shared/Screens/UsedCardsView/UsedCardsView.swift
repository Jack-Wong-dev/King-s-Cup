//
//  CardsUsed.swift
//  King's Cup (iOS)
//
//  Created by Jack Wong on 3/6/21.
//

import SwiftUI

struct UsedCardsView: View {
//    @Environment(\.horizontalSizeClass) var horizontalSizeClass
//    @Environment(\.verticalSizeClass) var verticalSizeClass
    @StateObject private var usedCardsVM = UsedCardsViewModel()
    @State private var columns: [GridItem] = [.init(.adaptive(minimum: 150, maximum: 200))]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(usedCardsVM.cards, content: CardView.init)
            }
            .padding(.horizontal)
        }
    }
}

struct CardsUsed_Previews: PreviewProvider {
    static var previews: some View {
        UsedCardsView()
    }
}

