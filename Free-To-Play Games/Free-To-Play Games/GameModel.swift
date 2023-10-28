//
//  GameModel.swift
//  Free-To-Play Games
//
//  Created by Quinten De Wolf on 28/10/2023.
//

import Foundation

struct GameModel {
    private (set) var platforms: Array<Platform>
    private (set) var selectedPlatform: Platform = Platform.PC
    
    init() {
        platforms = []
        for platform in Platform.allCases {
            platforms.append(platform)
        }
    }
    mutating func selectPlatform(_ platform: Platform) {
        selectedPlatform = platform
    }
}
