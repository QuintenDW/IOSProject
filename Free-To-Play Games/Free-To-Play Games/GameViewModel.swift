//
//  GameViewModel.swift
//  Free-To-Play Games
//
//  Created by Quinten De Wolf on 28/10/2023.
//

import SwiftUI

class GameViewModel: ObservableObject {
    private static let platforms = ["PC","Playstation","Xbox"]
    @Published private var GameOptions = createGameOptions()
    
    var platforms: Array<String> {
        return GameOptions.platforms
    }
    
    func selectPlatform(platform: String) {
        GameOptions.selectPlatform(platform: platform)
    }
    
    
    private static func createGameOptions() -> GameModel {
        return GameModel(platforms: platforms)
    }
}
