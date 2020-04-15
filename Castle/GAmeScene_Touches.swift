//
//  GAmeScene_Touches.swift
//  Castle
//
//  Created by Sergey Trubavin on 11.04.2020.
//  Copyright © 2020 Sergey Trubavin. All rights reserved.
//

import Foundation
import  SpriteKit

extension GameScene {
   
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        guard let touch = touches.first else  {return}
        let touchLocation = touch.location(in: self)
        let distance = distanceCalculate(a: womanSpriteNode.position, b: touchLocation)
        let speed = CGFloat(500)
        let time = TimeInterval(distance / speed)
        let moveAction = SKAction.moveTo(x: touchLocation.x, duration: time)
        newLocation = touchLocation
        
        womanSpriteNode.run(moveAction)
        womanWalkAnimateRepeat()
    }
    
    override func update(_ currentTime: TimeInterval) {
        newPosition.x = womanSpriteNode.position.x
        
        if round(newLocation.x) == round(newPosition.x) {

            womanIdleAnimateRepeat()
//            print("newPosition.x - \(round(newPosition.x)) womanSpriteNode.position.x - \(round(womanSpriteNode.position.x))")
        }
    }
    
   private func distanceCalculate(a: CGPoint, b: CGPoint) -> CGFloat {
        let distance = sqrt((b.x - a.x) * (b.x - a.x))
        return distance
    }
}

