//
//  OEGameScene.swift
//  Ocean Explorer
//
//  Created by Kaleb Ho Ching on 10/29/24.
//

import SpriteKit
import GameplayKit

class OEGameScene: SKScene {
    weak var context: OEGameContext?
    
    var box: OEBoxNode?
    
    init(context: OEGameContext, size: CGSize) {
        self.context = context
        super.init(size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        guard let context else {
            return
        }
        context.scene = self
        context.configureStates()

        context.layoutInfo = OELayoutInfo(screenSize: size)
        let center = CGPoint(x: size.width / 2.0 - context.layoutInfo.boxSize.width / 2.0,
                             y: context.layoutInfo.boxSize.height / 2.0)
        let box = OEBoxNode()
        box.setup(screenSize: size, layoutInfo: context.layoutInfo)
        box.position = center
        addChild(box)
        self.box = box
        
        
        context.stateMachine?.enter(OEGamePlayState.self)
        
        addSwipeGestures()
        
    }
    
    func addSwipeGestures() {
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeUp.direction = .up
        view?.addGestureRecognizer(swipeUp)

        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeDown.direction = .down
        view?.addGestureRecognizer(swipeDown)

        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeLeft.direction = .left
        view?.addGestureRecognizer(swipeLeft)

        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeRight.direction = .right
        view?.addGestureRecognizer(swipeRight)
    }

    
    @objc func handleSwipe(_ gesture: UISwipeGestureRecognizer) {
        if let playingState = context?.stateMachine?.currentState as? OEGamePlayState {
            playingState.handleSwipe(direction: gesture.direction)
        }
    }

    
}
