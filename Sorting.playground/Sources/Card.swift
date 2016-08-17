//
//  Card.swift
//  Make-School-Sorting
//
//  Created by Yujin Ariza on 2/2/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import Foundation

public struct Card: Equatable {
    public let value: Int
    public let suit: Suit
    
    init(_ value: Int, _ suit: Suit) {
        self.value = value
        self.suit = suit
    }
    
    public func text() -> String {
        let valueText: String
        if (value == 1) {
            valueText = "A"
        } else if (value == 11) {
            valueText = "J"
        } else if (value == 12) {
            valueText = "Q"
        } else if (value == 13) {
            valueText = "K"
        } else {
            valueText = "\(value)"
        }
        return valueText + " " + suit.emoji()
    }
}



public func ==(card1: Card, card2: Card) -> Bool {
    return card1.value == card2.value && card1.suit == card2.suit
}

public enum Suit: Int {
    case club = 0
    case diamond
    case heart
    case spade
    
    public func emoji() -> String {
        switch self {
        case .club:
            return "♣️"
        case .diamond:
            return "♦️"
        case .heart:
            return "♥️"
        case .spade:
            return "♠️"
        }
    }
}
