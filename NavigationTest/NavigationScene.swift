//
//  GameScene.swift
//  NavigationTest
//
//  Created by Cory Tepper on 5/22/21.
//

import SpriteKit

class NavigationScene: SKScene {
    
    var navigationBar: SKNode!
    var scene1Button: SKSpriteNode!
    var scene2Button: SKSpriteNode!
    var scene3Button: SKSpriteNode!
    
    
    override func sceneDidLoad() {
            super.sceneDidLoad()
            
            navigationBar = childNode(withName: "navigationBar")
            
            scene1Button = childNode(withName: "//scene1Button") as? SKSpriteNode
            scene2Button = childNode(withName: "//scene2Button") as? SKSpriteNode
            scene3Button = childNode(withName: "//scene3Button") as? SKSpriteNode
            
        }
    func touchDown(at point: CGPoint) {}
    
    
    func goToScene(scene: SKScene) {
        let sceneTransition = SKTransition.fade(with: UIColor.darkGray, duration: 1)
        scene.scaleMode = .aspectFill
        self.view?.presentScene(scene, transition: sceneTransition)
    }
    
        
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        // 1
        let touchLocation = touch.location(in: self)
        
        // 2
        if ((navigationBar?.contains(touchLocation)) != nil) {
            let location = touch.location(in: navigationBar)
        
        // 3
            if scene1Button.contains(location) {
                goToScene(scene: SKScene(fileNamed: "Scene1") as! Scene1)
            } else if scene2Button.contains(location) {
                goToScene(scene: SKScene(fileNamed: "Scene2") as! Scene2)

            } else if scene3Button.contains(location) {
                goToScene(scene: SKScene(fileNamed: "Scene3") as! Scene3)
            
        } else {
            
            // 4
            touchDown(at: touchLocation)
        }
    }
               
}
   
}
