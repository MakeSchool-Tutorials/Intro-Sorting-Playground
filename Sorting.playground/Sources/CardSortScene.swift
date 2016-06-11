import SpriteKit
import UIKit

public class CardSortScene: SKScene {
    
    let deck: Deck
    var cardNodes = [CardNode]()
    
    var actionQueue = [CardAction]()
    
    let actionLabel: SKLabelNode
    
    public init(deck: Deck, size: CGSize) {
        self.deck = deck
        actionLabel = SKLabelNode(fontNamed: "Helvetica Neue")
        super.init(size: size)
        deck.updateDelegate = enqueueAction
        for i in 0..<deck.cards.count {
            let card = deck.cards[i]
            let cardNode = CardNode(card: card)
            cardNode.position = cardPositionForIndex(i)
            cardNode.zPosition = CGFloat(i)
            self.addChild(cardNode)
            cardNodes.append(cardNode)
        }
        
        actionLabel.fontSize = 24.0
        actionLabel.verticalAlignmentMode = .Baseline
        actionLabel.horizontalAlignmentMode = .Center
        actionLabel.position = CGPoint(x: 160, y: 50)
        self.addChild(actionLabel)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func didMoveToView(view: SKView) {
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(1 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) { () -> Void in
            self.animate()
        }
    }
    
    func animate() {
        if let action = actionQueue.first {
            switch action.actionType {
            case .Copy:
                let copy = CardNode(card: action.newValue!)
                copy.position = cardPositionForIndex(action.originIndex!)
                self.addChild(copy)
                
                actionLabel.text = "Copying \(action.newValue!.text()) to index \(action.targetIndex)"
                
                let old = self.cardNodes[action.targetIndex]
                old.animateDisappear({})
                copy.animateMove(cardPositionForIndex(action.targetIndex), zPosition: CGFloat(action.targetIndex), completion: { () -> Void in
                    old.removeFromParent()
                    self.cardNodes[action.targetIndex] = copy
                    self.actionQueue.removeFirst()
                    self.animate()
                })
            case .Swap:
                let first = cardNodes[action.originIndex!]
                let second = cardNodes[action.targetIndex]
                
                actionLabel.text = "Swapping \(action.newValue!.text()) with \(action.oldValue!.text())"
                
                first.animateMove(cardPositionForIndex(action.targetIndex), zPosition: CGFloat(action.targetIndex), completion: {})
                second.animateMove(cardPositionForIndex(action.originIndex!), zPosition: CGFloat(action.originIndex!), completion: { () -> Void in
                    self.cardNodes[action.originIndex!] = second
                    self.cardNodes[action.targetIndex] = first
                    
                    self.actionQueue.removeFirst()
                    self.animate()
                })
            case .Set:
                actionLabel.text = "Setting index \(action.targetIndex) to \(action.newValue!.text())"
                
                let copy = CardNode(card: action.newValue!)
                copy.position = cardPositionForIndex(action.targetIndex)
                copy.animateAppear({})
                let old = self.cardNodes[action.targetIndex]
                old.animateDisappear({ () -> Void in
                    old.removeFromParent()
                    self.cardNodes[action.targetIndex] = copy
                    self.actionQueue.removeFirst()
                    self.animate()
                })
            }
        } else {
            if deck.comparator != nil {
                if deck.isSorted() {
                    actionLabel.text = "Sorting successful! :)"
                } else {
                    actionLabel.text = "Not sorted! :("
                }
            }
        }
    }
    
    public func enqueueAction(action: CardAction) {
        if let last = actionQueue.last {
            if let combinedAction = CardAction.reduce(last, second: action) {
                actionQueue[actionQueue.count-1] = combinedAction
                return
            }
        }
        actionQueue.append(action)
    }
    
    func cardPositionForIndex(index: Int) -> CGPoint {
        let v = CGFloat(index)
        let origin = CGPoint(x: 50, y: 450)
        let delta = CGPoint(x: 10, y: -30)
        return CGPoint(x: origin.x + delta.x * v, y: origin.y + delta.y * v)
    }
    
    public static func setupScene(deck: Deck) -> (SKView, CardSortScene) {
        let size = CGSize(width: 320, height: 568)
        let sceneView = SKView(frame: CGRect(origin: CGPointZero, size: size))
        let scene = CardSortScene(deck: deck, size: size)
        scene.scaleMode = .AspectFill;
        let background = SKSpriteNode(imageNamed: "card_sorting-background")
        background.anchorPoint = CGPoint(x: 0, y: 0)
        scene.addChild(background)
        return (sceneView, scene)
    }
}
