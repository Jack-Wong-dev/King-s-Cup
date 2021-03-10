//
//  SelectionButtonStyle.swift
//  King's Cup (iOS)
//
//  Created by Jack Wong on 3/8/21.
//

import SwiftUI

struct SelectionButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 12)
            .padding(16)
            .background(
                Capsule()
                    .foregroundColor(Color(.systemBackground))
                    .shadow(color: Color.shadow.opacity(0.16), radius: 12, x: 0, y: 5)
            )
            .scaleEffect(configuration.isPressed ? 0.7 : 1)
            .animation(.default)
    }
}
