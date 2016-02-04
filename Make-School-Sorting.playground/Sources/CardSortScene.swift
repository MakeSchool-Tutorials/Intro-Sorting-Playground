import SpriteKit
import UIKit

public class CardSortScene: SKScene {
    
    let deck: Deck
    var cardNodes = [CardNode]()
    
    var actionQueue = [CardAction]()
    let animationTime = 2.0
    
    public init(deck: Deck, size: CGSize) {
        self.deck = deck
        super.init(size: size)
        deck.updateDelegate = enqueueAction
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func didMoveToView(view: SKView) {
        for i in 0..<deck.cards.count {
            let card = deck.cards[i]
            let cardNode = CardNode(value: card.value)
            cardNode.position = cardPositionForIndex(i)
            cardNode.zPosition = CGFloat(i)
            self.addChild(cardNode)
            cardNodes.append(cardNode)
        }
        animate()
        print("hi")
    }
    
    func animate() {
        if let action = actionQueue.first {
            print("animating \(action.actionType)")
            switch action.actionType {
            case .Copy:
                let copy = CardNode(card: action.newValue!)
                copy.position = cardPositionForIndex(action.originIndex!)
                copy.zPosition = CGFloat(action.targetIndex)
                let moveAction = SKAction.moveTo(cardPositionForIndex(action.targetIndex), duration: animationTime)
                self.addChild(copy)
                copy.runAction(moveAction, completion: { () -> Void in
                    let old = self.cardNodes[action.targetIndex]
                    old.removeFromParent()
                    self.cardNodes[action.targetIndex] = copy
                    self.actionQueue.removeFirst()
                    self.animate()
                })
            case .Swap:
                let first = cardNodes[action.originIndex!]
                let second = cardNodes[action.targetIndex]
                let firstAction = SKAction.moveTo(cardPositionForIndex(action.targetIndex), duration: animationTime)
                let secondAction = SKAction.moveTo(cardPositionForIndex(action.originIndex!), duration: animationTime)
                first.zPosition = CGFloat(action.targetIndex)
                second.zPosition = CGFloat(action.originIndex!)
                first.runAction(firstAction)
                second.runAction(secondAction, completion: { () -> Void in
                    self.cardNodes[action.originIndex!] = second
                    self.cardNodes[action.targetIndex] = first
                    
                    self.actionQueue.removeFirst()
                    self.animate()
                })
            case .Set:
                break
            }
        }
    }
    
    public func enqueueAction(action: CardAction) {
        if let last = actionQueue.last {
            if let combinedAction = CardAction.reduce(last, second: action) {
                actionQueue[actionQueue.count-1] = combinedAction
                print(actionQueue.count)
                return
            }
        }
        actionQueue.append(action)
        print(actionQueue.count)
    }
    
    func swap(first: Int, _ second: Int) {
        let temp = cardNodes[first]
        cardNodes[first] = cardNodes[second]
        cardNodes[second] = temp
        
        let firstCard = cardNodes[first]
        let secondCard = cardNodes[second]
        
        firstCard.zPosition = CGFloat(first)
        secondCard.zPosition = CGFloat(second)
        
        // TODO: make actions queue up
        firstCard.runAction(SKAction.moveTo(cardPositionForIndex(first), duration: animationTime))
        secondCard.runAction(SKAction.moveTo(cardPositionForIndex(second), duration: animationTime))
        
    }
    
    func cardPositionForIndex(index: Int) -> CGPoint {
        let v = CGFloat(index)
        let origin = CGPoint(x: 50, y: 450)
        let delta = CGPoint(x: 10, y: -30)
        return CGPoint(x: origin.x + delta.x * v, y: origin.y + delta.y * v)
    }
}
