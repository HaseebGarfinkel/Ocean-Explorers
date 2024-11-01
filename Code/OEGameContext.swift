//
//  TTGameContext.swift
//  Test
//
//  Created by Hyung Lee on 10/20/24.
//

import Combine
import GameplayKit

class TTGameContext: GameContext {
    var gameScene: TTGameScene? {
        scene as? TTGameScene
    }
    let gameMode: GameModeType
    let gameInfo: TTGameInfo
    var layoutInfo: TTLayoutInfo = .init(screenSize: .zero)
    
    private(set) var stateMachine: GKStateMachine?
    
    init(dependencies: Dependencies, gameMode: GameModeType) {
        self.gameInfo = TTGameInfo()
        self.gameMode = gameMode
        super.init(dependencies: dependencies)
    }
    
    func configureStates() {
        guard let gameScene else { return }
        print("did configure states")
        stateMachine = GKStateMachine(states: [
            TTGameIdleState(scene: gameScene, context: self)
        ])
    }

}
