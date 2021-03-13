//
//  AppStateContainer.swift
//  King's Cup (iOS)
//
//  Created by Jack Wong on 3/12/21.
//

import SwiftUI

class AppStateContainer: ObservableObject {
    var destinationState = DestinationState()
}

class DestinationState: ObservableObject {
    @Published var destination: Destination = .welcome
}

enum Destination {
    case welcome
    case game
    case guide
}
