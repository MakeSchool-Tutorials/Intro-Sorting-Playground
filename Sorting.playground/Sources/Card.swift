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
    public let suite: Suite
    
    init(_ value: Int, _ suite: Suite) {
        self.value = value
        self.suite = suite
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
        return valueText + " " + suite.emoji()
    }
}



public func ==(card1: Card, card2: Card) -> Bool {
    return card1.value == card2.value &&
           card1.suite == card2.suite
}

public enum Suite: Int {
    case Club = 0
    case Diamond
    case Heart
    case Spade
    
    public func emoji() -> String {
        switch self {
        case .Club:
            return "♣️"
        case .Diamond:
            return "♦️"
        case .Heart:
            return "♥️"
        case .Spade:
            return "♠️"
        }
    }
}
