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
}
