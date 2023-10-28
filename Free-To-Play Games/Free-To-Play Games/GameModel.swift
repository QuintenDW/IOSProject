//
//  GameModel.swift
//  Free-To-Play Games
//
//  Created by Quinten De Wolf on 28/10/2023.
//

import Foundation

struct GameModel {
    private (set) var platforms: Array<String>
    private (set) var selectedPlatform: String = "PC"
    mutating func selectPlatform(platform: String) {
        selectedPlatform = platform
    }
}
