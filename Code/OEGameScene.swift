//
//  TTGameScene.swift
//  Test
//
//  Created by Hyung Lee on 10/20/24.
//

import SpriteKit
import GameplayKit

class TTGameScene: SKScene {
    weak var context: TTGameContext?
    
    var box: TTBoxNode?
    
    init(context: TTGameContext, size: CGSize) {
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

        context.layoutInfo = TTLayoutInfo(screenSize: size)
        let center = CGPoint(x: size.width / 2.0 - context.layoutInfo.boxSize.width / 2.0,
                             y: size.height / 2.0)
        let box = TTBoxNode()
        box.setup(screenSize: size, layoutInfo: context.layoutInfo)
        box.position = center
        addChild(box)
        self.box = box
        
        
        context.stateMachine?.enter(TTGameIdleState.self)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first, let state = context?.stateMachine?.currentState as? TTGameIdleState else {
            return
        }
        state.handleTouch(touch)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first, let state = context?.stateMachine?.currentState as? TTGameIdleState else {
            return
        }
        state.handleTouchMoved(touch)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first, let state = context?.stateMachine?.currentState as? TTGameIdleState else {
            return
        }
        state.handleTouchEnded(touch)
    }
}
