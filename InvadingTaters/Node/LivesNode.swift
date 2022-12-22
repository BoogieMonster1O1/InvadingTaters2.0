//
//  LivesNode.swift
//  InvadingTaters
//
//  Created by Shrish Deshpande on 12/22/22.
//

import Cocoa
import SpriteKit

class LivesNode: SKNode {
    private var lives: [SKSpriteNode]
    private var livesLost = 0

    public override init() {
        lives = []
        super.init()
        for i in 0..<3 {
            let node = SKSpriteNode(imageNamed: "ship")
            node.position = CGPoint(x: i * 24, y: 0)
            lives.append(node)
            self.addChild(node)
        }
    }

    public func loseLife() {
        livesLost += 1
        if (livesLost <= 2) {
            self.removeChildren(in: [lives[2 - livesLost]])
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented")
    }
}
