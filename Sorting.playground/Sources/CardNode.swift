import SpriteKit

public class CardNode: SKNode {
    
    let cardRect = CGRect(x: 0, y: 0, width: 67, height: 105);
    let cardCornerRadius: CGFloat = 5.0;
    let textPosition = CGPoint(x: 5, y: 80);
    let textSize: CGFloat = 18;
    
    let popAnimationTime = 0.5
    let moveAnimationTime = 0.8
    let appearAnimationTime = 1.3
    
    public init(card: Card) {
        super.init()

        let cardShape = SKShapeNode(rect: cardRect, cornerRadius: cardCornerRadius);
        cardShape.lineWidth = 2.0;
        cardShape.fillColor = SKColor.whiteColor();
        cardShape.strokeColor = SKColor.blackColor();
        cardShape.position = CGPointZero;
        self.addChild(cardShape);
        
        let cardText = SKLabelNode(fontNamed: "Helvetica Neue");
        cardText.fontColor = SKColor.blackColor();
        cardText.fontSize = textSize;
        cardText.text = card.text()
        cardText.position = textPosition;
        cardText.horizontalAlignmentMode = .Left
        self.addChild(cardText);
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    
    public func animateMove(position: CGPoint, zPosition: CGFloat, completion: () -> Void) {
        self.zPosition = 10000
        self.runAction(SKAction.scaleTo(1.2, duration: popAnimationTime)) { () -> Void in
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