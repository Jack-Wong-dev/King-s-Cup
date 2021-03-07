//
//  TabView.swift
//  King's Cup (iOS)
//
//  Created by Jack Wong on 3/7/21.
//

import SwiftUI

struct TabScreen: View {
    var body: some View {
        TabView {
            GameScreen()
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Game")
                }
            
            UsedCardsView()
                .tabItem {
                    Image(systemName: "book")
                    Text("Used Cards")
                }
        }
    }
}

struct TabScreen_Previews: PreviewProvider {
    static var previews: some View {
        TabScreen()
    }
}
