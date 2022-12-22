//
//  InvadingScene.swift
//  InvadingTaters
//
//  Created by Shrish Deshpande on 12/21/22.
//

import Cocoa
import SpriteKit

class GameScene: SKScene {
    public var taters: [[TaterNode]] = []
    
    public override init(size: CGSize) {
        super.init(size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func didMove(to: SKView) {
        self.backgroundColor = .black
        NSLog("We have invaded")
        reInitInvaders()
    }

    func reInitInvaders() {
        taters = []
        for taterList in taters {
            self.removeChildren(in: taterList)
        }
        for i in 1...11 {
            var row: [TaterNode] = []
            for j in 1...5 {
                let type = TaterType.byRow(j)
                let node = TaterNode(type: type)
                node.position = CGPoint(x: 2 * (16 * i + 12), y: 2 * (17 * j + 128))
                node.name = "\(i) \(j)"
                self.addChild(node)
                row.append(node)
            }
            taters.append(row)
        }
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
