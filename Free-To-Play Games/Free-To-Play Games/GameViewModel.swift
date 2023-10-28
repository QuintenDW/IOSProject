//
//  GameViewModel.swift
//  Free-To-Play Games
//
//  Created by Quinten De Wolf on 28/10/2023.
//

import SwiftUI

class GameViewModel: ObservableObject {
    @Published private var GameOptions = createGameOptions()
    
    var platforms: Array<Platform> {
        return GameOptions.platforms
    }
    
    func selectPlatform(platform: Platform) {
        GameOptions.selectPlatform(platform)
    }
    
    
    private static func createGameOptions() -> GameModel {
        return GameModel()
    }
}
