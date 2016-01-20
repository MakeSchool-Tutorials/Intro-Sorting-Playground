import SpriteKit
import UIKit
import XCPlayground

public func displayScene() {
    let sceneView = SKView(frame: CGRect(x: 0, y: 0, width: 320, height: 576));
    let scene = CardSortScene.sharedInstance;
    scene.scaleMode = .ResizeFill;
    scene.backgroundColor = SKColor.grayColor();
    sceneView.presentScene(scene);
    XCPlaygroundPage.currentPage.liveView = sceneView;
}

public func swap(first: Int, _ second: Int) {
    CardSortScene.sharedInstance.swap(first, second);
}

public class CardSortScene: SKScene {
    
    static public let sharedInstance: CardSortScene = CardSortScene(size: CGSize(width: 320, height: 576));
    
    let numberCards = 13;
    var cardsArray = Array<CardNode>();
    
    var actionQueue: [SKAction] = []; // TODO: convert to queue if performance is an issue
    let animationTime = 0.5;
    
//    override public init() {
//        super.init();
//    }
//    
//    override public init(size: CGSize) {
//        super.init(size: size);
//    }
//
//    required public init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }

    override public func didMoveToView(view: SKView) {
        for(var i=0; i<numberCards; i++) {
            let card = CardNode(value: i+1);
            card.position = cardPositionForIndex(i);
            card.zPosition = CGFloat(i);
            self.addChild(card);
            cardsArray[i] = card;
        }
    }
    
    func swap(first: Int, _ second: Int) {
        let temp = cardsArray[first];
        cardsArray[first] = cardsArray[second];
        cardsArray[second] = temp;
        
        let firstCard = cardsArray[first];
        let secondCard = cardsArray[second];
        
        firstCard.zPosition = CGFloat(first);
        secondCard.zPosition = CGFloat(second);
        
        // TODO: make actions queue up
        firstCard.runAction(SKAction.moveTo(cardPositionForIndex(first), duration: animationTime));
        secondCard.runAction(SKAction.moveTo(cardPositionForIndex(second), duration: animationTime));
        
    }
    
    func cardPositionForIndex(index: Int) -> CGPoint {
        let v = CGFloat(index);
        let origin = CGPoint(x: 50, y: 450);
        let delta = CGPoint(x: 10, y: -30);
        return CGPoint(x: origin.x + delta.x * v, y: origin.y + delta.y * v);
    }
}
