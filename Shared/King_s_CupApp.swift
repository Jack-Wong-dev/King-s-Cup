//
//  King_s_CupApp.swift
//  Shared
//
//  Created by Jack Wong on 3/5/21.
//

import SwiftUI

@main
struct King_s_CupApp: App {
    @StateObject var appStateContainer = AppStateContainer()
    
    var body: some Scene {
        WindowGroup {
            MotherView()
                .buttonStyle(SelectionButtonStyle())
                .environmentObject(appStateContainer)
                .environmentObject(appStateContainer.destinationState)
        }
    }
}
