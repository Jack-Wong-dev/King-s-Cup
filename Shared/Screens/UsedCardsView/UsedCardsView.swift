//
//  CardsUsed.swift
//  King's Cup (iOS)
//
//  Created by Jack Wong on 3/6/21.
//
//
//import SwiftUI
//
//struct UsedCardsView: View {
////    @Environment(\.horizontalSizeClass) var horizontalSizeClass
////    @Environment(\.verticalSizeClass) var verticalSizeClass
//    @EnvironmentObject var usedCardsVM: UsedCardsViewModel
//    @State private var columns: [GridItem] = [.init(.adaptive(minimum: 100, maximum: 200))]
//
//    var body: some View {
//        ScrollView {
//            LazyVGrid(columns: columns) {
//                ForEach(usedCardsVM.usedCards, id: \.self, content: CardImage.init)
//            }
//            .padding(.horizontal)
//        }
//    }
//}
//
//struct CardsUsed_Previews: PreviewProvider {
//    @StateObject static private var vm = UsedCardsViewModel()
//    static var previews: some View {
//        UsedCardsView()
//            .environmentObject(vm)
//    }
//}
//
