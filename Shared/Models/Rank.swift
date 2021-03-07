//
//  Rank.swift
//  King's Cup (iOS)
//
//  Created by Jack Wong on 3/6/21.
//

import Foundation

enum Rank: String, CaseIterable {
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
            return "All the guys at the table drink."
        case .six:
            return "All the girls at the table drink."
        case .seven:
            return "If you draw this card, raise your hand above you head. Every other player must do so as well. The last person to do so drinks."
        case .eight:
            return "Choose someone to be your mate. For the rest of the game, they drink when you drink."
        case .nine:
            return "You say a word, then the person to your right has to say a word that rhymes. This continues until someone can't think of a word. That person takes a drink. You can't reuse words."
        case .ten:
            return "Come up with a category of things. The person to your right must name something that falls within the category. This continues until someone can't think of something. That person takes a drink."
        case .jack:
            return "Play never have I ever"
        case .queen:
            return "Ask someone a question. That person then asks someone else a question. This continues until someone messes up or fails to ask a question. That person drinks. No question can be repeated."
        case .king:
            return "Set a rule to be followed, e.g. stand on one foot when you drink, only speak in an accent, etc. When each of the first 3 Kings is drawn, the person who drew it puts some of their drink into the King's Cup in the center of the table. When the 4th King is drawn, the person who drew it must drink the entire King's Cup.)"
        }
    }
}
