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
            .shadow(color: .shadow, radius: 15, x: 15, y: 15)  //Bottom trailing shadow.
//            .shadow(color: .lighting, radius: 15, x: -15, y: -15) //Top leading shadow.
    }
}
