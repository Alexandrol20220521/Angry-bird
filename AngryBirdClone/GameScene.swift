//
//  GameScene.swift
//  AngryBirdClone
//
//  Created by 中島竜太郎 on 2022/11/11.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var bird  = SKSpriteNode()
    var birdOriginalPosition : CGPoint?
    var bird2 = SKSpriteNode()
   
    var brick1 = SKSpriteNode()
    var brick2 = SKSpriteNode()
    var brick3 = SKSpriteNode()
    var brick4 = SKSpriteNode()
    var brick5 = SKSpriteNode()
    var brick6 = SKSpriteNode()
    
    var gameIsStarted = false
    override func didMove(to view: SKView) {
        //bird property
        let birdTexture = SKTexture(imageNamed: "bird")
        //brick property
        let brickTexture = SKTexture(imageNamed: "brick")
        let brickSize = CGSize(width: brickTexture.size().width / 6, height: brickTexture.size().height / 6)
        
        // bird2
        bird2 = SKSpriteNode(texture: birdTexture)
        bird2.position = CGPoint(x: -self.frame.width / 5, y: self.frame.height / 4)
        bird2.size = CGSize(width: self.frame.width / 16, height: self.frame.height / 13)
        bird2.zPosition = 1
        
        bird2.physicsBody = SKPhysicsBody(circleOfRadius: birdTexture.size().height / 13)
        bird2.physicsBody?.affectedByGravity = true
        bird2.physicsBody?.isDynamic = true
        bird2.physicsBody?.mass = 0.2
        self.addChild(bird2)
        
        //bird
        bird = childNode(withName: "bird1") as! SKSpriteNode
        
        bird.physicsBody = SKPhysicsBody(circleOfRadius: birdTexture.size().height / 13)
        bird.physicsBody?.affectedByGravity = false
        bird.physicsBody?.isDynamic = true
        bird.physicsBody?.mass = 0.5
        birdOriginalPosition = bird.position
        
        //brick1
        brick1 = childNode(withName: "brick1") as! SKSpriteNode
        
        brick1.physicsBody = SKPhysicsBody(rectangleOf: brickSize)
        brick1.physicsBody?.affectedByGravity = true
        brick1.physicsBody?.isDynamic = true
        brick1.physicsBody?.allowsRotation = true
        brick1.physicsBody?.mass = 0.4
        
        //brick2
        brick2 = childNode(withName: "brick2") as! SKSpriteNode
        
        brick2.physicsBody = SKPhysicsBody(rectangleOf: brickSize)
        brick2.physicsBody?.affectedByGravity = true
        brick2.physicsBody?.isDynamic = true
        brick2.physicsBody?.allowsRotation = true
        
        //brick3
        brick3 = childNode(withName: "brick3") as! SKSpriteNode
        
        brick3.physicsBody = SKPhysicsBody(rectangleOf: brickSize)
        brick3.physicsBody?.affectedByGravity = true
        brick3.physicsBody?.isDynamic = true
        brick3.physicsBody?.allowsRotation = true
        
        //brick4
        brick4 = childNode(withName: "brick4") as! SKSpriteNode
        
        brick4.physicsBody = SKPhysicsBody(rectangleOf: brickSize)
        brick4.physicsBody?.affectedByGravity = true
        brick4.physicsBody?.isDynamic = true
        brick4.physicsBody?.allowsRotation = true
        
        //brick5
        brick5 = childNode(withName: "brick5") as! SKSpriteNode
        
        brick5.physicsBody = SKPhysicsBody(rectangleOf: brickSize)
        brick5.physicsBody?.affectedByGravity = true
        brick5.physicsBody?.isDynamic = true
        brick5.physicsBody?.allowsRotation = true
        
        //brick6
        brick6 = childNode(withName: "brick6") as! SKSpriteNode
        
        brick6.physicsBody = SKPhysicsBody(rectangleOf: brickSize)
        brick6.physicsBody?.affectedByGravity = true
        brick6.physicsBody?.isDynamic = true
        brick6.physicsBody?.allowsRotation = true
        
        
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.scene?.scaleMode = .aspectFit
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
       
    }
    
    func touchMoved(toPoint pos : CGPoint) {
       
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /*bird.physicsBody?.applyImpulse(CGVector(dx: 50, dy: 50))
        bird.physicsBody?.affectedByGravity = true */
       
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if gameIsStarted == false {
            if let touch = touches.first {
                let touchLocation = touch.location(in: self)
                let touchNode = nodes(at: touchLocation)
                
                if touchNode.isEmpty == false {
                    for node in touchNode {
                        if let sprite = node as? SKSpriteNode {
                            if sprite == bird {
                                bird.position = touchLocation
                            }
                        }
                    }
                }
              
            }
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if gameIsStarted == false {
            if let touch = touches.first {
                let touchLocation = touch.location(in: self)
                let touchNode = nodes(at: touchLocation)
                
                if touchNode.isEmpty == false {
                    for node in touchNode {
                        if let sprite = node as? SKSpriteNode {
                            if sprite == bird {
                                let dx = -(touchLocation.x - birdOriginalPosition!.x)
                                let dy = -(touchLocation.y - birdOriginalPosition!.y)
                                
                                let impluse = CGVector(dx: dx, dy: dy)
                                bird.physicsBody?.applyImpulse(impluse)
                                bird.physicsBody?.affectedByGravity = true
                            }
                        }
                    }
                }
              
            }
        }
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
