//
//  Image+Extension.swift
//  King's Cup (iOS)
//
//  Created by Jack Wong on 3/8/21.
//

import SwiftUI

extension Image {
    static let cardBack = Image("cardBack2")
    
    func cardModifier() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .shadow(color: Color.shadow.opacity(0.5), radius: 10, x: 0, y: 5)
            .padding()
    }
}
