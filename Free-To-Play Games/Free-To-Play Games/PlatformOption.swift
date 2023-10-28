//
//  PlatformOption.swift
//  Free-To-Play Games
//
//  Created by Quinten De Wolf on 28/10/2023.
//

import SwiftUI

struct PlatformOption: View {
    var platform: Platform
    var gameLogic: GameViewModel
    init(_ platform: Platform,_ gameLogic:GameViewModel) {
        self.platform = platform
        self.gameLogic = gameLogic
    }
    var body: some View {
        Button(platform.rawValue) {
            gameLogic.selectPlatform(platform: platform)
        }.buttonStyle(.borderedProminent).tint(.green).font(.title3).controlSize(.large)
    }
}

#Preview {
    PlatformOption(Platform.PC,GameViewModel())
}
