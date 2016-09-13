//
//  Deck.swift
//  Make-School-Sorting
//
//  Created by Yujin Ariza on 1/25/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import Foundation

open class Deck {
    
    open let comparator: ((Card, Card) -> (Int))?
    
    public init(comparator: ((Card, Card) -> (Int))?, seed: Bool = true, numberCards: Int = 13) {
        self.comparator = comparator
        if seed {
            for i in 0..<numberCards {
                var value: Int
                var suit: Suit
                var unique = true
                repeat {
                    value = Int(arc4random_uniform(13) + 1)
                    suit = Suit(rawValue: Int(arc4random_uniform(4)))!
                    unique = true
                    
                    // check if card is unique
                    for j in 0..<i {
                        if cards[j] == Card(value, suit) {
                            unique = false
                            break;
                        }
                    }
                } while (!unique)
                cards.append(Card(value, suit))
            }
        } else {
            cards = [Card(6, Suit(rawValue: 3)!), Card(9, Suit(rawValue: 1)!), Card(8, Suit(rawValue: 3)!), Card(2, Suit(rawValue: 3)!), Card(3, Suit(rawValue: 2)!), Card(11, Suit(rawValue: 2)!), Card(2, Suit(rawValue: 2)!), Card(13, Suit(rawValue: 2)!), Card(7, Suit(rawValue: 2)!), Card(7, Suit(rawValue: 0)!), Card(8, Suit(rawValue: 1)!), Card(12, Suit(rawValue: 3)!), Card(7, Suit(rawValue: 3)!)]
        }
    }
    
    open var updateDelegate: (CardAction) -> () = {_ in }

    open var cards = [Card]() {
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
                    break;
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
//                print("set \(targetIndex!) to \(cards[targetIndex!].value) of \(cards[targetIndex!].suit)")
            } else {
                // Copy operation
                action = CardAction(copyIndex: targetIndex!, from: originIndex!,
                    value: cards[targetIndex!], oldValue: oldValue[targetIndex!])
//                print("moved \(originIndex!) to \(targetIndex!)")
            }
            updateDelegate(action)
        }
    }

    open func isSorted() -> Bool {
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

public func suitFirstComparator(_ first: Card, second: Card) -> Int {
    let numCardsInSuit = 13
    return (first.suit.rawValue * numCardsInSuit + first.value) - (second.suit.rawValue * numCardsInSuit + second.value)
}

public func valueOnlyComparator(_ first: Card, second: Card) -> Int {
    return first.value - second.value
}
