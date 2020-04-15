//
//  GameScene.swift
//  Castle
//
//  Created by Sergey Trubavin on 10.04.2020.
//  Copyright © 2020 Sergey Trubavin. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
//    texture
    var backgroundTexture: SKTexture!
    var womanIdleTexture: SKTexture!
    var womanWalkTexture: SKTexture!
    
//    spriteNode
    var background = SKSpriteNode()
    var womanSpriteNode = SKSpriteNode()
    
//spriteNode animation
    var womanIdleAnimationTexture = [SKTexture]()
    var womanWalkAnimationTexture = [SKTexture]()
    
// objects
    var backgroundObj = SKNode()
    var womanObj = SKNode()
    
//    texture Atlas
    var textureAtlas = SKTextureAtlas()
    
    var newPosition = CGPoint(x: 0, y: 0)
    var newLocation = CGPoint(x: 0, y: 0)
    
    override func didMove(to view: SKView) {
        womanIdleTexture = SKTexture(imageNamed: "woman-idle-1")
        womanWalkTexture = SKTexture(imageNamed: "woman-walk-1")
        createObj()
        createGame()
    }
    
//   create nodes
    func createObj() {
        self.addChild(backgroundObj)
        self.addChild(womanObj)
    }
    
    func createGame() {
        createBg()
        createWoman()
    }
    
//    create background
    func createBg() {
        backgroundTexture = SKTexture(imageNamed: "environment-preview")
        background = SKSpriteNode(texture: backgroundTexture)
        background.size = CGSize(width: frame.width * 3, height: frame.height * 2)
        background.anchorPoint = .zero
        background.position = CGPoint(x: -frame.width, y: -frame.height / 1.5)
        background.zPosition = -1
        backgroundObj.addChild(background)
    }
    
    func addWoman() {
        womanSpriteNode = SKSpriteNode(texture: womanIdleTexture)
        womanSpriteNode.position = CGPoint(x: -size.width/3, y: -size.height/4  )
        womanSpriteNode.scale(to: CGSize(width: 300, height: 300))
        womanSpriteNode.zPosition = 1
        
        womanIdleAnimateRepeat()
        
        womanSpriteNode.physicsBody = SKPhysicsBody(texture: womanIdleTexture, size:  womanIdleTexture.size())
        womanSpriteNode.physicsBody?.isDynamic = false
        
        womanObj.addChild(womanSpriteNode)
    }
    
    func createWoman() {
        addWoman()
    }
    
//    Idle animation func
    func womanIdleAnimateRepeat() {
        for i in 1...7 {
            womanIdleTexture = SKTexture(imageNamed: "woman-idle-\(i)")
            womanIdleAnimationTexture.append(self.womanIdleTexture)
        }
        SKTexture.preload(womanIdleAnimationTexture) {[unowned self] in
            let womanIdleAnimation = SKAction.animate(with: self.womanIdleAnimationTexture, timePerFrame: 0.1)
            let womanIdleAnimateRepeat = SKAction.repeatForever(womanIdleAnimation)
            self.womanSpriteNode.run(womanIdleAnimateRepeat)
        }
    }
    
//    walk animation func
    func womanWalkAnimateRepeat() {
        for i in 1...6 {
            womanWalkTexture = SKTexture(imageNamed: "woman-walk-\(i)")
            womanWalkAnimationTexture.append(self.womanWalkTexture)
        }
        SKTexture.preload(womanWalkAnimationTexture) {[unowned self] in
            let womanWalkAnimate = SKAction.animate(with: self.womanWalkAnimationTexture, timePerFrame: 0.1)
            let womanWalkAnimateRepeat = SKAction.repeatForever(womanWalkAnimate)
            self.womanSpriteNode.run(womanWalkAnimateRepeat)
        }
    }
    
//       func creatBg() {
    //        backgroundTexture = SKTexture(imageNamed: "environment-preview")
    //
    //        let moveBg = SKAction.moveBy(x: -backgroundTexture.size().width, y: 0, duration: 0)
    //        let repeatBg = SKAction.moveBy(x: backgroundTexture.size().width, y: 0, duration: 0)
    //        let moveBgForever = SKAction.repeatForever(SKAction.sequence([moveBg, repeatBg]))
    //
    //        for i in 0..<3 {
    //            background = SKSpriteNode(texture: backgroundTexture)
    //            background.position = CGPoint(x:  backgroundTexture.size().width * CGFloat(i) - 150, y: 0)
    //            background.size.height = frame.height
    //            background.run(moveBgForever)
    //            background.zPosition = -1
    //            backgroundObj.addChild(background)
    //        }
    //    }
}
