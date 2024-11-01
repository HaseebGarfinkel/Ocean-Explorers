//
//  TTBoxNode.swift
//  Test
//
//  Created by Hyung Lee on 10/20/24.
//

import SpriteKit

class TTBoxNode: SKNode {
    var box: SKShapeNode = SKShapeNode()
    func setup(screenSize: CGSize, layoutInfo: TTLayoutInfo) {
        let boxNode = SKShapeNode(rect: .init(origin: .zero,
                                          size: layoutInfo.boxSize),
                              cornerRadius: 8.0)
        boxNode.fillColor = .red
        addChild(boxNode)
        box = boxNode
    }
}
