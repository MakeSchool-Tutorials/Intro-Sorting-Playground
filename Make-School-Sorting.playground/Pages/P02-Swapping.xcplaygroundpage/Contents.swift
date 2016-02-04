//: [Previous](@previous)

import XCPlayground
import SpriteKit

let deck = Deck()

//displayScene()
let sceneView = SKView(frame: CGRect(x: 0, y: 0, width: 320, height: 576));
let scene = CardSortScene(deck: deck, size: CGSize(width: 320, height: 576));
scene.scaleMode = .AspectFill;
scene.backgroundColor = SKColor.grayColor();
XCPlaygroundPage.currentPage.liveView = sceneView;







deck.cards[0] = deck.cards[1]









sceneView.presentScene(scene);

//: [Next](@next)
