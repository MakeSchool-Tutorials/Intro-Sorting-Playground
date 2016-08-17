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
        self.actionType = .set
    }
    
    init(copyIndex: Int, from: Int, value: Card, oldValue: Card) {
        self.targetIndex = copyIndex
        self.originIndex = from
        self.oldValue = oldValue
        self.newValue = value
        self.actionType = .copy
    }
    
    init(swapIndex: Int, with: Int, value: Card, otherValue: Card) {
        self.targetIndex = swapIndex
        self.originIndex = with
        self.oldValue = value
        self.newValue = otherValue
        self.actionType = .swap
    }
    
    static func reduce(_ first: CardAction, second: CardAction) -> CardAction? {
        if (first.actionType == .copy && second.actionType == .set &&
            first.originIndex == second.targetIndex &&
            first.oldValue == second.newValue) {
            // reduce to a swap!
            return CardAction(swapIndex: first.targetIndex, with: second.targetIndex, value: first.oldValue!, otherValue: first.newValue!)
        } else {
            return nil
        }
    }
}

public enum CardActionType {
    case set
    case copy
    case swap
}

