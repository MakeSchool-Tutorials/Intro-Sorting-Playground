//
//  CardAction.swift
//  Make-School-Sorting
//
//  Created by Yujin Ariza on 2/3/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import Foundation

public struct CardAction {
    public let targetIndex: Int
    public let originIndex: Int?
    public let oldValue: Card?
    public let newValue: Card?
    public let actionType: CardActionType
    
    init(targetIndex: Int, _ originIndex: Int?, oldValue: Card?, newValue: Card?, actionType: CardActionType) {
        self.targetIndex = targetIndex
        self.originIndex = originIndex
        self.actionType = actionType
        self.oldValue = oldValue
        self.newValue = newValue
    }
    
    init(setIndex: Int, setValue: Card, oldValue: Card) {
        self.targetIndex = setIndex
        self.originIndex = nil
        self.oldValue = oldValue
        self.newValue = setValue
        self.actionType = .Set
    }
    
    init(copyIndex: Int, from: Int, value: Card, oldValue: Card) {
        self.targetIndex = copyIndex
        self.originIndex = from
        self.oldValue = oldValue
        self.newValue = value
        self.actionType = .Copy
    }
    
    init(swapIndex: Int, with: Int) {
        self.targetIndex = swapIndex
        self.originIndex = with
        self.oldValue = nil
        self.newValue = nil
        self.actionType = .Swap
    }
    
    static func reduce(first: CardAction, second: CardAction) -> CardAction? {
        if (first.actionType == .Copy && second.actionType == .Set &&
            first.originIndex == second.targetIndex &&
            first.oldValue == second.newValue) {
            // reduce to a swap!
            return CardAction(swapIndex: first.targetIndex, with: second.targetIndex)
        } else {
            return nil
        }
    }
}

public enum CardActionType {
    case Set
    case Copy
    case Swap
}

