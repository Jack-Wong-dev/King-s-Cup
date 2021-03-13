//
//  HomeScreen.swift
//  King's Cup (iOS)
//
//  Created by Jack Wong on 3/12/21.
//

import SwiftUI

struct MotherView: View {
    @EnvironmentObject var destinationState: DestinationState
    
    var body: some View {
        switch destinationState.destination {
        case .welcome:
            WelcomeScreen()
        case .game:
            GameScreen()
        case .guide:
            HowToPlayScreen()
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        MotherView()
    }
}
