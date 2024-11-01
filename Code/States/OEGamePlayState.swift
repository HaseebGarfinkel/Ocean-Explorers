//
//  OEGameIdle.swift
//  Ocean Explorer
//
//  Created by Kaleb Ho Ching on 10/29/24.
//

import GameplayKit

class OEGamePlayState: GKState {
    weak var scene: OEGameScene?
    weak var context: OEGameContext?
    
    init(scene: OEGameScene, context: OEGameContext) {
        self.scene = scene
        self.context = context
        super.init()
    }
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is OEGamePlayState.Type   // Add any other states later
    }
    
    override func didEnter(from previousState: GKState?) {
        print("Did enter playing state")
        //Ensure swipe gestures are enabled
        scene?.addSwipeGestures()
    }
    
    func handleSwipe(direction: UISwipeGestureRecognizer.Direction) {
        guard let scene = scene else { return }
        guard let box = self.scene?.box else { return }
        guard let context = context else { return }
        let moveDistance: CGFloat = 50.0
        
        let boxWidth = context.layoutInfo.boxSize.width
        let boxHalfWidth = boxWidth / 2.0
        var newPosition = box.position

        switch direction {
            case .up:
                newPosition.y += moveDistance
            case .down:
                newPosition.y -= moveDistance
            case .left:
                newPosition.x -= moveDistance
            case .right:
                newPosition.x += moveDistance
            default:
                return
        }
        
        //Constrain new position to the screen bounds
        newPosition.x = max(boxHalfWidth, min(newPosition.x, scene.size.width - boxWidth))
        
        //Create the move action to the constrained position
        let moveAction = SKAction.move(to: newPosition, duration: 0.2)

        // Run the action on the box
        box.run(moveAction)
        
    }
    
    
}
