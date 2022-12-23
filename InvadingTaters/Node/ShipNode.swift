//
//  ShipNode.swift
//  InvadingTaters
//
//  Created by Shrish Deshpande on 12/23/22.
//

import Cocoa
import SpriteKit

class ShipNode: SKNode {
    private let shipTex: SKSpriteNode
    
    public override init() {
        self.shipTex = SKSpriteNode(imageNamed: "ship")
        super.init()
        self.addChild(shipTex)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented")
    }
}
