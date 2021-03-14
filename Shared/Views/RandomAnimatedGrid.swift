//
//  RandomAnimatedGrid.swift
//  King's Cup (iOS)
//
//  Created by Jack Wong on 3/13/21.
//

import SwiftUI

struct RandomAnimatedGrid: View {
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .center) {
                AnimatedGrid(geometry: proxy)
                    .ignoresSafeArea()
            }
            .ignoresSafeArea()
        }
        .ignoresSafeArea()
    }
}

struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero

    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

struct SizeModifier: ViewModifier {
    private var sizeView: some View {
        GeometryReader { geometry in
            Color.clear.preference(key: SizePreferenceKey.self, value: geometry.size)
        }
    }

    func body(content: Content) -> some View {
        content.background(sizeView)
    }
}


struct AnimatedGrid: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @StateObject private var vm = AnimatedGridViewModel()
    
    var geometry: GeometryProxy
    
    var geoHeight: CGFloat {
        geometry.size.height
    }
    
    var scale: CGFloat {
        switch (horizontalSizeClass, verticalSizeClass) {
        case ( _ , .compact):
           return 4
        case ( .compact , .regular):
           return 10
        case ( .regular , .regular):
            if geometry.size.height < geometry.size.width {
                return 6
            } else {
                return 10
            }
        default:
            return 10
        }
    }
    
    var width: CGFloat {
        (((geoHeight - ((scale - 1) * 10)) / scale) * 3) / 4
    }
    
    var cardsPerRow: Int {
        Int(geometry.size.width / width)
    }
    
    var numOfItems: Int {
        cardsPerRow * Int(scale)
    }
    
    var column: [GridItem] {
        Array(repeating: GridItem(), count: cardsPerRow)
    }
    
    var body: some View {
        LazyVGrid(columns: column) {
            ForEach(vm.cards.prefix(numOfItems)) { card in
                BlinkingCard(card: card)
            }
        }
    }
}

struct RandomAnimatedGrid_Previews: PreviewProvider {
    @StateObject static var appStateContainer = AppStateContainer()

    static var previews: some View {
        Group {
            RandomAnimatedGrid()
            
            MotherView()
                .buttonStyle(SelectionButtonStyle())
                .environmentObject(appStateContainer)
                .environmentObject(appStateContainer.destinationState)
        }
    }
}
