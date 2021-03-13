//
//  GameHUD.swift
//  King's Cup (iOS)
//
//  Created by Jack Wong on 3/10/21.
//

import SwiftUI

struct GameHUD: View {
    @EnvironmentObject var brain: GameViewModel
    
    var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading) {
                Text("Kings : \(brain.kingCounter) / 4").fontWeight(.semibold)
                Text("Cards Remaining: \(brain.cards.count - 1 > 0 ?  brain.cards.count - 1 : 0 )").fontWeight(.semibold)
            }
            .font(.system(Font.TextStyle.body, design: .rounded))
            .foregroundColor(.purple)
            
            Spacer(minLength: 0)
            
            Button(action: showMenu) {
                Image(systemName: "gearshape.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 36, height: 36)
                    .shadow(color: Color(.systemPurple).opacity(0.5), radius: 5, x: 0.0, y: 2.0)
            }
            .buttonStyle(DefaultButtonStyle())
            .accentColor(Color(.systemPurple))
        }
        .padding(.horizontal)
    }
    
    private func showMenu() {
        withAnimation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0)) {
            brain.gameState = .menu
        }
    }
}

struct GameHUD_Previews: PreviewProvider {
    static var previews: some View {
        GameHUD()
    }
}
