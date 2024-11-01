//
//  KalebContentView.swift
//  Ocean Explorer
//
//  Created by Kaleb Ho Ching on 10/31/24.
//

import SwiftUI
import SpriteKit

struct KalebContentView: View {
    let context = OEGameContext(dependencies: .init(),
                                gameMode: .single)
    let screenSize: CGSize = UIScreen.main.bounds.size
    
    var body: some View {
        SpriteView(scene: TTGameScene(context: context,
                                      size: screenSize))
    }
}

#Preview {
    ContentView()
        .ignoresSafeArea()
}

