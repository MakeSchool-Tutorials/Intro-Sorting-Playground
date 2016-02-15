import SpriteKit

public class CardNode: SKNode {
    
    let cardRect = CGRect(x: 0, y: 0, width: 67, height: 105);
    let cardCornerRadius: CGFloat = 5.0;
    let textPosition = CGPoint(x: 5, y: 80);
    let textSize: CGFloat = 18;
    
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
}