//
//  Rank.swift
//  King's Cup (iOS)
//
//  Created by Jack Wong on 3/6/21.
//

import Foundation

enum Rank: String, CaseIterable {
    typealias title = String
    typealias description = String
    
    case ace = "ace"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case ten = "10"
    case jack = "jack"
    case queen = "queen"
    case king = "king"
    
    var ruleTitle: String {
        switch self {
        case .ace:
            return "Waterfall"
        case .two:
            return "You"
        case .three:
            return "Me"
        case .four:
            return "Floor"
        case .five:
            return "Guys"
        case .six:
            return "Chicks"
        case .seven:
            return "Heaven"
        case .eight:
            return "Mate"
        case .nine:
            return "Rhyme"
        case .ten:
            return "Categories"
        case .jack:
            return "Never have I ever"
        case .queen:
            return "Questions"
        case .king:
            return "King's Cup"
        }
    }
    
    var ruleDescription: String {
        switch self {
        case .ace:
            return "Start drinking at the same time as the person to your left. Don't stop until they do."
        case .two:
            return "Choose someone to drink."
        case .three:
            return "You drink."
        case .four:
            return "The last person to touch the floor drinks"
        case .five:
            return "Guys drink"
        case .six:
            return "Girls drink"
        case .seven:
            return "Raise your hand to heaven. The last person to do so drinks."
        case .eight:
            return "Choose someone to be your mate. Any time you drink, they drink."
        case .nine:
            return "Say a word. The person to your right says a word that rhymes. The first person to fail drinks."
        case .ten:
            return "Choose a category of things. The person to your right names something in taht category. The first person to fail drinks"
        case .jack:
            return "Play never have I ever"
        case .queen:
            return "Ask someone a question. That person then asks someone else a question. The first person to fail drinks."
        case .king:
            return "Set a rule and pour some of your drink into the King's Cup in the center of the table. Whoever draws the final king must drink the entire King's Cup."
        }
    }
}
