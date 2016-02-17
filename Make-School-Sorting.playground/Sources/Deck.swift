//
//  Deck.swift
//  Make-School-Sorting
//
//  Created by Yujin Ariza on 1/25/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import Foundation

public class Deck {
    
    public let comparator: ((Card, Card) -> (Int))?
    
    public init(comparator: ((Card, Card) -> (Int))?, numberCards: Int = 13) {
        self.comparator = comparator
        for i in 0..<numberCards {
            var value: Int
            var suite: Suite
            var unique = true
            repeat {
                value = random() % 13 + 1
                suite = Suite(rawValue: random() % 4)!
                
                // check if card is unique
                for j in 0..<i {
                    if cards[j] == Card(value, suite) {
                        unique = false
                        break;
                    }
                }
            } while (!unique)
            cards.append(Card(value, suite))
        }
    }
    
    public var updateDelegate: (CardAction) -> () = {_ in }

    public var cards = [Card]() {
        didSet {
            // detect change and queue/edit swap actions
            if (oldValue.count != cards.count) {
                print("Assigning new array to cards.")
                return
            }
            var targetIndex: Int? = nil
            var originIndex: Int? = nil
            for i in 0..<cards.count {
                if (oldValue[i] != cards[i]) {
                    targetIndex = i
                    break
                }
            }
            if (targetIndex == nil) {
                return
            }
            for i in 0..<cards.count {
                if (i != targetIndex! && cards[i] == cards[targetIndex!]) {
                    originIndex = i
                }
            }
            
            let action: CardAction
            if (originIndex == nil) {
                // Set operation
                action = CardAction(setIndex: targetIndex!,
                    setValue: cards[targetIndex!], oldValue: oldValue[targetIndex!])
//                print("set \(targetIndex!) to \(cards[targetIndex!].value) of \(cards[targetIndex!].suite)")
            } else {
                // Copy operation
                action = CardAction(copyIndex: targetIndex!, from: originIndex!,
                    value: cards[targetIndex!], oldValue: oldValue[targetIndex!])
//                print("moved \(originIndex!) to \(targetIndex!)")
            }
            updateDelegate(action)
        }
    }

    public func isSorted() -> Bool {
        if comparator == nil {
            return true
        }
        for i in 0..<cards.count-1 {
            if comparator!(cards[i], cards[i+1]) > 0 {
                return false
            }
        }
        return true
    }
}

public func suiteFirstComparator(first: Card, second: Card) -> Int {
    let numCardsInSuite = 13
    return (first.suite.rawValue * numCardsInSuite + first.value) - (second.suite.rawValue * numCardsInSuite + second.value)
}

public func valueOnlyComparator(first: Card, second: Card) -> Int {
    return first.value - second.value
}
