//
//  CardDetailView.swift
//  King's Cup (iOS)
//
//  Created by Jack Wong on 3/10/21.
//

import SwiftUI

struct CurrentCardDetail: View {
    @EnvironmentObject var brain: GameViewModel
    @ScaledMetric(relativeTo: .largeTitle) var titleSize: CGFloat = 24
    @ScaledMetric(relativeTo: .body) var descriptionSize: CGFloat = 20
    
    var currentCard: Card? { brain.cards.last }
    
    var body: some View {
        VStack {
            if let card = currentCard {
                Text(card.rank.ruleTitle)
                    .font(.system(size: titleSize, weight: .heavy, design: .rounded))
                    .fontWeight(.black)
                    .padding(.bottom)
                                
                ScrollView {
                    Text(card.rank.ruleDescription)
                        .font(.system(size: descriptionSize, weight: .semibold, design: .rounded))
                }
            }
        }
        .padding([.top, .horizontal])
        .frame(maxWidth: 712)
    }
}
