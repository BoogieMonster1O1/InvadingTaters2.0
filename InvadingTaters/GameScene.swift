//
//  InvadingScene.swift
//  InvadingTaters
//
//  Created by Shrish Deshpande on 12/21/22.
//

import Cocoa
import SpriteKit

class GameScene: SKScene {
    public override init(size: CGSize) {
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func didMove(to: SKView) {
        self.backgroundColor = .black
        NSLog("We have invaded")
    }
    
    override func keyDown(with event: NSEvent) {
        if event.keyCode == Keycode.returnKey {
            let reveal = SKTransition.crossFade(withDuration: 0.5)
            if let newScene = SKScene(fileNamed: "GameOverScene") {
                self.scene?.view?.presentScene(newScene, transition: reveal)
            }
        } else if event.keyCode == Keycode.escape {
            NSApp.terminate(nil)
        }
    }
}
