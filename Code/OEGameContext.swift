//
//  OEGameContext.swift
//  Ocean Explorer
//
//  Created by Kaleb Ho Ching on 10/29/24.

import Combine
import GameplayKit

class OEGameContext: GameContext {
    var gameScene: OEGameScene? {
        scene as? OEGameScene
    }
    let gameMode: GameModeType
    let gameInfo: OEGameInfo
    var layoutInfo: OELayoutInfo = .init(screenSize: .zero)
    
    private(set) var stateMachine: GKStateMachine?
    
    init(dependencies: Dependencies, gameMode: GameModeType) {
        self.gameInfo = OEGameInfo()
        self.gameMode = gameMode
        super.init(dependencies: dependencies)
    }
    
    func configureStates() {
        guard let gameScene else { return }
        print("did configure states")
        stateMachine = GKStateMachine(states: [
            OEGamePlayState(scene: gameScene, context: self)
        ])
    }

}
