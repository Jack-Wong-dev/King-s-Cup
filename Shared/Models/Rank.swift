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
            return "Kings"
        case .six:
            return "Queens"
        case .seven:
            return "Heaven"
        case .eight:
            return "Mate"
        case .nine:
            return "Rhyme"
        case .ten:
            return "Categories"
        case .jack:
            return "Rule"
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
            return "All those who identify as a King drink."
        case .six:
            return "All those who identify as a Queen drink."
        case .seven:
            return "All players raise their hands above their heads. The last person to do so drinks."
        case .eight:
            return "Choose someone to be your mate. For the rest of the game, they drink when you drink."
        case .nine:
            return "You say a word, then the room goes around coming up with a word that rhymes with said word until someone can't think of a word. The person who failed takes a drink. You can't reuse words."
        case .ten:
            return "Go around the room naming things belonging to a category until someone fails. The person who failed takes a drink."
        case .jack:
            return "Set a rule to be followed, e.g. stand on one foot when you drink. Anyone who breaks that rule must drink."
        case .queen:
            return "Anybody who answers a question asked by you must drink."
        case .king:
            return "When each of the first 3 Kings is drawn, the person who drew it puts some of their drink into the King's Cup in the center of the table. When the 4th King is drawn, the person who drew it must drink the entire King's Cup.)"
        }
    }
}
