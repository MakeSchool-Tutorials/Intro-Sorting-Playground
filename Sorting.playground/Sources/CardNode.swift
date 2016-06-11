import SpriteKit

public class CardNode: SKNode {
    
    let cardRect = CGRect(x: 0, y: 0, width: 67, height: 105)
    let cardCornerRadius: CGFloat = 5.0
    let textPosition = CGPoint(x: 5, y: 85)
    let suitePosition = CGPoint(x: 5, y: 85)
    let textPositionBottom = CGPoint(x: 70, y: 23)
    let suitePositionBottom = CGPoint(x: 70, y: 23)
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
        
        let cardSuite = SKSpriteNode(imageNamed: "\(baseFile)suite-\(card.suite.rawValue)")
        cardSuite.position = suitePosition
        cardSuite.anchorPoint = CGPoint(x: 0, y: 1)
        self.addChild(cardSuite)
        
        let cardText2 = SKSpriteNode(imageNamed: "\(baseFile)\(card.value)")
        cardText2.position = textPositionBottom
        cardText2.anchorPoint = CGPoint(x: 0, y: 0)
        cardText2.zRotation = CGFloat(M_PI)
        self.addChild(cardText2)
        
        let cardSuite2 = SKSpriteNode(imageNamed: "\(baseFile)suite-\(card.suite.rawValue)")
        cardSuite2.position = suitePositionBottom
        cardSuite2.anchorPoint = CGPoint(x: 0, y: 1)
        cardSuite2.zRotation = CGFloat(M_PI)
        self.addChild(cardSuite2)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func animateMove(position: CGPoint, zPosition: CGFloat, completion: () -> Void) {
        self.zPosition = 10000
        self.runAction(SKAction.scaleTo(1.1, duration: popAnimationTime)) { () -> Void in
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