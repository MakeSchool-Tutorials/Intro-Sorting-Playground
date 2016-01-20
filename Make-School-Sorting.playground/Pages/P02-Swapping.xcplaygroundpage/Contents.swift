//: [Previous](@previous)

import XCPlayground
import SpriteKit



//displayScene()
let sceneView = SKView(frame: CGRect(x: 0, y: 0, width: 320, height: 576));
let scene = CardSortScene.sharedInstance;
scene.scaleMode = .ResizeFill;
scene.backgroundColor = SKColor.grayColor();
sceneView.presentScene(scene);
XCPlaygroundPage.currentPage.liveView = sceneView;

//: [Next](@next)
