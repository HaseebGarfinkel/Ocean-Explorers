//
//  OEBoxNode.swift
//  Ocean Explorer
//
//  Created by Kaleb Ho Ching on 10/29/24.
//

import SpriteKit

class OEBoxNode: SKNode {
    var box: SKShapeNode = SKShapeNode()
    func setup(screenSize: CGSize, layoutInfo: OELayoutInfo) {
        let boxNode = SKShapeNode(rect: .init(origin: .zero,
                                          size: layoutInfo.boxSize),
                              cornerRadius: 8.0)
        boxNode.fillColor = .red
        addChild(boxNode)
        box = boxNode
    }
}
