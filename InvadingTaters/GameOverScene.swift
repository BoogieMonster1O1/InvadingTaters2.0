//
//  GameOverScene.swift
//  InvadingTaters
//
//  Created by Shrish Deshpande on 12/21/22.
//

import SpriteKit
import Cocoa

class GameOverScene: SKScene {
    public override init(size: CGSize) {
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func didMove(to: SKView) {
        self.backgroundColor = .black
        NSLog("Game Over")
    }
    
    override func keyDown(with event: NSEvent) {
        if event.keyCode == Keycode.escape {
            NSApp.terminate(nil)
        }
    }
}
