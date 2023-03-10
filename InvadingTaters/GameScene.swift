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
    private var bottomLine = SKSpriteNode(color: .white, size: CGSize(width: 1000, height: 4))
    public override init(size: CGSize) {
        super.init(size: size)
    }
    private var lives: LivesNode = LivesNode()
    private var scoreLabel: SKLabelNode = SKLabelNode(text: "Score: ")
    private var shipNode: SKSpriteNode = SKSpriteNode(imageNamed: "ship")
    private var score: Int = 0
    private var directionPressed: Direction? = nil

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func didMove(to: SKView) {
        self.backgroundColor = .black
        NSLog("We have invaded")
        reInitInvaders()
        self.bottomLine.position = CGPoint(x: 0, y: 48)
        self.addChild(bottomLine)

        self.lives.position = CGPoint(x: 22, y: 22)
        self.addChild(lives)

        self.scoreLabel.position = CGPoint(x: 10, y: 478)
        self.scoreLabel.fontSize = 24
        self.scoreLabel.horizontalAlignmentMode = .left
        self.addChild(scoreLabel)
        
        self.shipNode.size = CGSize(width: 24, height: 24)
        self.shipNode.position = CGPoint(x: 256 - 24, y: 70)
        self.addChild(shipNode)
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
                node.name = "Invader"
                self.addChild(node)
                row.append(node)
            }
            taters.append(row)
        }
    }

    override func update(_ currentTime: TimeInterval) {
        if (directionPressed == .left) {
            if (shipNode.position.x > (24)) {
                shipNode.position = CGPoint(x: shipNode.position.x - 4, y: shipNode.position.y)
            }
        } else if (directionPressed == .right) {
            if (shipNode.position.x < (512 - 88)) {
                shipNode.position = CGPoint(x: shipNode.position.x + 4, y: shipNode.position.y)
            }
        }
        self.enumerateChildNodes(withName: "ShipBullet") {
            $1.pointee = true
        }
    }

    override func didFinishUpdate() {
        scoreLabel.text = "Score: \(score)"
    }
    
    override func keyUp(with event: NSEvent) {
        if event.keyCode == Keycode.rightArrow || event.keyCode == Keycode.leftArrow {
            self.directionPressed = nil
        }
    }

    override func keyDown(with event: NSEvent) {
        if event.keyCode == Keycode.rightArrow {
            self.directionPressed = .right
        } else if event.keyCode == Keycode.leftArrow {
            self.directionPressed = .left
        } else {
            if event.keyCode == Keycode.returnKey {
                let reveal = SKTransition.crossFade(withDuration: 0.5)
                if let newScene = SKScene(fileNamed: "GameOverScene") {
                    self.scene?.view?.presentScene(newScene, transition: reveal)
                }
            } else if event.keyCode == Keycode.escape {
                NSApp.terminate(nil)
            }
            self.directionPressed = nil
        }
    }
}

enum Direction {
    case left
    case right
}
