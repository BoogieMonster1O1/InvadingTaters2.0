//
//  TaterNode.swift
//  InvadingTaters
//
//  Created by Shrish Deshpande on 12/22/22.
//

import Cocoa
import SpriteKit

enum TaterType {
    case irrit
    case wide
    case conc
    
    static func byRow(_ row: Int) -> TaterType {
        if (row <= 2) {
            return .conc
        } else if (row <= 4) {
            return .wide
        }
        return .irrit
    }
    
    var imageName: String {
        switch (self) {
        case .irrit:
            return "irrit"
        case .wide:
            return "wide"
        case .conc:
            return "concernedtater"
        }
    }
}

class TaterNode: SKNode {
    private let type: TaterType
    
    public init(type: TaterType) {
        self.type = type
        super.init()
        let tex = SKSpriteNode(imageNamed: type.imageName)
        tex.scale(to: CGSize(width: 16, height: 16))
        self.addChild(tex)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        self.type = .irrit
        super.init(coder: aDecoder)
    }
}
