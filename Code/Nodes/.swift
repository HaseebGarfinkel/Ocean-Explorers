//
//  OERockNode3.swift
//  Ocean Explorer
//
//  Created by Haseeb Garfinkel on 12/6/24.
//

import Foundation
import SpriteKit

class OERockNode3: SKSpriteNode {
    
    var rockSpeed: CGFloat = 0
    var direction: CGVector = .zero
    var velocity: CGFloat = 0

    var leftSnapZone: CGPoint {
        return CGPoint(x: self.position.x - self.size.width * 0.25, y: self.position.y)
    }

    var centerSnapZone: CGPoint {
        return CGPoint(x: self.position.x, y: self.position.y)
    }

    var rightSnapZone: CGPoint {
        return CGPoint(x: self.position.x + self.size.width * 0.25, y: self.position.y)
    }

    init(height: CGFloat) {

        let texture = SKTexture(imageNamed: "Rock3")

        super.init(texture: texture, color: .gray, size: CGSize(width: texture.size().width * 0.32, height: texture.size().height * 0.40))

        self.zPosition = 1

        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: size.width * 0.9, height: height))
        self.physicsBody?.isDynamic = false // Rocks won't be affected by physics
        self.physicsBody?.categoryBitMask = PhysicsCategory.rock3
        self.physicsBody?.contactTestBitMask = PhysicsCategory.box
        self.physicsBody?.collisionBitMask = PhysicsCategory.none
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func startMoving(from start: CGPoint, to end: CGPoint, speed: CGFloat) {
        self.position = start
        self.rockSpeed = speed

        self.velocity = (end.x - start.x) / speed

        if end.x > start.x {
            self.direction = CGVector(dx: 1, dy: 0)
        } else {
            self.direction = CGVector(dx: -1, dy: 0)
        }

        let moveAction = SKAction.move(to: end, duration: speed)

        let removeAction = SKAction.removeFromParent()
        let sequence = SKAction.sequence([moveAction, removeAction])
        
        run(sequence)
    }
}
