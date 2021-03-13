//
//  HowToPlayScreen.swift
//  King's Cup (iOS)
//
//  Created by Jack Wong on 3/12/21.
//

import SwiftUI

struct HowToPlayScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var appStateContainer: AppStateContainer
    
    var willGoBackToWelcome: Bool {
        appStateContainer.destinationState.destination == .guide
    }
        
    var body: some View {
        VStack(alignment: .leading) {
            Button(action: dismiss) {
                Text("Dismiss")
                    .padding([.top, .horizontal])
            }
            .buttonStyle(DefaultButtonStyle())
            .accentColor(Color(.systemPurple))
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading, spacing: 4){
                        Text("Intro")
                            .fontWeight(.bold)
                        
                        Text("King’s cup is a classic drinking game using a deck of cards and a cup (referred to as the king’s cup).")
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Setup")
                            .fontWeight(.bold)
                        Text("All players should gather around in a circle, with a large cup at the center.  Playing cards are spread out around the cup.  However, if you are using this app, there is no need for this step.")
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Gameplay")
                            .fontWeight(.bold)
                        
                        Text("One person draws a card, shows it to the rest of the players, then follows the rule associated with that particular card.  When that person is done, the card gets discarded and the next player picks the next card.  This is repeated until there are no more cards, or the last king card is drawn. \n\nIf you are using this app, the first card will be automatically drawn when the game is initiated.  Swiping the card away will discard said card and reveal the next card.")
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
    private func dismiss() {
        if willGoBackToWelcome {
            withAnimation {
                appStateContainer.destinationState.destination = .welcome
            }
        } else {
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct HowToPlayScreen_Previews: PreviewProvider {
    static var previews: some View {
        HowToPlayScreen()
    }
}
