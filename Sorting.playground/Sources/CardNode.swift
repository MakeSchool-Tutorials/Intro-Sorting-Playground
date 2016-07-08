import SpriteKit

public class CardNode: SKNode {
    
    let cardRect = CGRect(x: 0, y: 0, width: 67, height: 105)
    let cardCornerRadius: CGFloat = 5.0
    let textPosition = CGPoint(x: 5, y: 85)
    let suitPosition = CGPoint(x: 5, y: 85)
    let textPositionBottom = CGPoint(x: 70, y: 23)
    let suitPositionBottom = CGPoint(x: 70, y: 23)
    let textSize: CGFloat = 18
    
    let popAnimationTime = 0.5
    let moveAnimationTime = 0.8
    let appearAnimationTime = 1.3
    
    let baseFile = "card_sorting-"
    
    public init(card: Card) {
        super.init()

        let cardBackground = SKSpriteNode(imageNamed: "\(baseFile)card")
        cardBackground.anchorPoint = CGPoint(x: 0, y: 0)
        self.addChild(cardBackground)
        
        let cardText = SKSpriteNode(imageNamed: "\(baseFile)\(card.value)")
        cardText.position = textPosition
        cardText.anchorPoint = CGPoint(x: 0, y: 0)
        self.addChild(cardText)
        
        let cardSuit = SKSpriteNode(imageNamed: "\(baseFile)suite-\(card.suit.rawValue)")
        cardSuit.position = suitPosition
        cardSuit.anchorPoint = CGPoint(x: 0, y: 1)
        self.addChild(cardSuit)
        
        let cardText2 = SKSpriteNode(imageNamed: "\(baseFile)\(card.value)")
        cardText2.position = textPositionBottom
        cardText2.anchorPoint = CGPoint(x: 0, y: 0)
        cardText2.zRotation = CGFloat(M_PI)
        self.addChild(cardText2)
        
        let cardSuit2 = SKSpriteNode(imageNamed: "\(baseFile)suite-\(card.suit.rawValue)")
        cardSuit2.position = suitPositionBottom
        cardSuit2.anchorPoint = CGPoint(x: 0, y: 1)
        cardSuit2.zRotation = CGFloat(M_PI)
        self.addChild(cardSuit2)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func animateMove(position: CGPoint, zPosition: CGFloat, completion: () -> Void) {
        self.zPosition = 10000
        self.runAction(SKAction.scaleTo(1.02, duration: popAnimationTime)) { () -> Void in
            self.runAction(SKAction.moveTo(position, duration: self.moveAnimationTime), completion: { () -> Void in
                self.runAction(SKAction.scaleTo(1.0, duration: self.popAnimationTime), completion: { () -> Void in
                    self.zPosition = zPosition
                    completion()
                })
            })
        }
    }
    
    public func animateDisappear(completion: () -> Void) {
        self.runAction(SKAction.moveByX(0, y: -100.0, duration: appearAnimationTime))
        self.runAction(SKAction.fadeOutWithDuration(appearAnimationTime), completion: completion)
    }
    
    public func animateAppear(completion: () -> Void) {
        self.position.y += 100.0
        self.alpha = 0.0
        self.runAction(SKAction.moveByX(0, y: -100.0, duration: appearAnimationTime))
        self.runAction(SKAction.fadeInWithDuration(appearAnimationTime), completion: completion)
    }
}