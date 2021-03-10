//
//  ContentView.swift
//  Shared
//
//  Created by Jack Wong on 3/5/21.
//

import SwiftUI

struct ContentView: View {
  // MARK: - PROPERTIES
  
  @State var showAlert: Bool = false
  @State var showGuide: Bool = false
  @State var showInfo: Bool = false
  @GestureState private var dragState = DragState.inactive
  private var dragAreaThreshold: CGFloat = 65.0
  @State private var lastCardIndex: Int = 1
  @State private var cardRemovalTransition = AnyTransition.trailingBottom
  
  // MARK: - CARD VIEWS
  
  @State var cardViews: [CardView1] = {
    var views = [CardView1]()
    for index in 0..<2 {
      views.append(CardView1(honeymoon: honeymoonData[index]))
    }
    return views
  }()
  
  // MARK: - MOVE THE CARD
  
  private func moveCards() {
    cardViews.removeFirst()
    
    self.lastCardIndex += 1
    
    let honeymoon = honeymoonData[lastCardIndex % honeymoonData.count]
    
    let newCardView = CardView1(honeymoon: honeymoon)
    
    cardViews.append(newCardView)
  }
  
  // MARK: TOP CARD
  
  private func isTopCard(cardView: CardView1) -> Bool {
    guard let index = cardViews.firstIndex(where: { $0.id == cardView.id }) else {
      return false
    }
    return index == 0
  }
  
  // MARK: - DRAG STATES
  
  enum DragState {
    case inactive
    case pressing
    case dragging(translation: CGSize)
    
    var translation: CGSize {
      switch self {
      case .inactive, .pressing:
        return .zero
      case .dragging(let translation):
        return translation
      }
    }
    
    var isDragging: Bool {
      switch self {
      case .dragging:
        return true
      case .pressing, .inactive:
        return false
      }
    }
    
    var isPressing: Bool {
      switch self {
      case .pressing, .dragging:
        return true
      case .inactive:
        return false
      }
    }
  }
  
  var body: some View {
    VStack {
      // MARK: - HEADER
      
      Spacer()
      
      // MARK: - CARDS
      ZStack {
        ForEach(cardViews) { cardView in
          cardView
            .zIndex(self.isTopCard(cardView: cardView) ? 1 : 0)
            
            .offset(x: self.isTopCard(cardView: cardView) ?  self.dragState.translation.width : 0, y: self.isTopCard(cardView: cardView) ?  self.dragState.translation.height : 0)
            .scaleEffect(self.dragState.isDragging && self.isTopCard(cardView: cardView) ? 0.85 : 1.0)
            .rotationEffect(Angle(degrees: self.isTopCard(cardView: cardView) ? Double(self.dragState.translation.width / 12) : 0))
            .animation(.interpolatingSpring(stiffness: 120, damping: 120))
            .gesture(LongPressGesture(minimumDuration: 0.01)
              .sequenced(before: DragGesture())
              .updating(self.$dragState, body: { (value, state, transaction) in
                switch value {
                case .first(true):
                  state = .pressing
                case .second(true, let drag):
                  state = .dragging(translation: drag?.translation ?? .zero)
                default:
                  break
                }
              })
              .onChanged({ (value) in
                guard case .second(true, let drag?) = value else {
                  return
                }
                
                if drag.translation.width < -self.dragAreaThreshold {
                  self.cardRemovalTransition = .leadingBottom
                }
                
                if drag.translation.width > self.dragAreaThreshold {
                  self.cardRemovalTransition = .trailingBottom
                }
              })
              .onEnded({ (value) in
                guard case .second(true, let drag?) = value else {
                  return
                }
                
                if drag.translation.width < -self.dragAreaThreshold || drag.translation.width > self.dragAreaThreshold {
                  self.moveCards()
                }
              })
          ).transition(self.cardRemovalTransition)
        }
      }
      .padding(.horizontal)
      
      Spacer()
      
    }
    .alert(isPresented: $showAlert) {
      Alert(
        title: Text("SUCCESS"),
        message: Text("Wishing a lovely and most precious of the times together for the amazing couple."),
        dismissButton: .default(Text("Happy Honeymoon!")))
    }
  }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension AnyTransition {
  static var trailingBottom: AnyTransition {
    AnyTransition.asymmetric(
      insertion: .identity,
      removal: AnyTransition.move(edge: .trailing).combined(with: .move(edge: .bottom)))
  }
  
  static var leadingBottom: AnyTransition {
    AnyTransition.asymmetric(
      insertion: .identity,
      removal: AnyTransition.move(edge: .leading).combined(with: .move(edge: .bottom)))
  }
}

struct Destination {
  var place: String
  var country: String
  var image: String
}

var honeymoonData: [Destination] = [
  Destination(
    place: "Veligandu",
    country: "Maldives",
    image: "photo-veligandu-island-maldives"
  ),
  Destination(
    place: "Paris",
    country: "France",
    image: "photo-paris-france"
  ),
  Destination(
    place: "Athens",
    country: "Greece",
    image: "photo-athens-greece"
  ),
  Destination(
    place: "Dubai",
    country: "United Arab Emirates",
    image: "photo-dubai-emirates"
  ),
  Destination(
    place: "Grand Canyon",
    country: "United States of America",
    image: "photo-grandcanyon-usa"
  ),
  Destination(
    place: "Venice",
    country: "Italy",
    image: "photo-venice-italy"
  ),
  Destination(
    place: "Budapest",
    country: "Hungary",
    image: "photo-budapest-hungary"
  ),
  Destination(
    place: "High Tatras",
    country: "Poland",
    image: "photo-tatras-poland"
  ),
  Destination(
    place: "Lake Bled",
    country: "Slovenia",
    image: "photo-lakebled-slovenia"
  ),
  Destination(
    place: "Barcelona",
    country: "Spain",
    image: "photo-barcelona-spain"
  ),
  Destination(
    place: "San Francisco",
    country: "United States of America",
    image: "photo-sanfrancisco-usa"
  ),
  Destination(
    place: "Emerald Lake",
    country: "Canada",
    image: "photo-emaraldlake-canada"
  ),
  Destination(
    place: "Krabi",
    country: "Thailand",
    image: "photo-krabi-thailand"
  ),
  Destination(
    place: "Rome",
    country: "Italy",
    image: "photo-rome-italy"
  ),
  Destination(
    place: "Seoraksan",
    country: "South Korea",
    image: "photo-seoraksan-southkorea"
  ),
  Destination(
    place: "New York",
    country: "USA",
    image: "photo-newyork-usa"
  ),
  Destination(
    place: "Tulum",
    country: "Mexico",
    image: "photo-tulum-mexico"
  ),
  Destination(
    place: "London",
    country: "United Kingdom",
    image: "photo-london-uk"
  ),
  Destination(
    place: "Yosemite",
    country: "USA",
    image: "photo-yosemite-usa"
  ),
  Destination(
    place: "Rio de Janeiro",
    country: "Brazil",
    image: "photo-riodejaneiro-brazil"
  ),
  Destination(
    place: "Sydney",
    country: "Australia",
    image: "photo-sydney-australia"
  )
]

struct CardView1: View, Identifiable {
  // MARK: - PROPERTIES
  
  let id = UUID()
  var honeymoon: Destination
  
  var body: some View {
    Image(honeymoon.image)
      .resizable()
      .cornerRadius(24)
      .scaledToFit()
      .frame(minWidth: 0, maxWidth: .infinity)
      .overlay(
        VStack(alignment: .center, spacing: 12) {
          Text(honeymoon.place.uppercased())
            .foregroundColor(Color.white)
            .font(.largeTitle)
            .fontWeight(.bold)
            .shadow(radius: 1)
            .padding(.horizontal, 18)
            .padding(.vertical, 4)
            .overlay(
              Rectangle()
                .fill(Color.white)
                .frame(height: 1),
              alignment: .bottom
          )
          Text(honeymoon.country.uppercased())
            .foregroundColor(Color.black)
            .font(.footnote)
            .fontWeight(.bold)
            .frame(minWidth: 85)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(
              Capsule().fill(Color.white)
            )
        }
        .frame(minWidth: 280)
        .padding(.bottom, 50),
        alignment: .bottom
      )
  }
}
