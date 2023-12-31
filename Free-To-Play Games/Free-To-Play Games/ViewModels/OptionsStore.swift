//
//  GameViewModel.swift
//  Free-To-Play Games
//
//  Created by Quinten De Wolf on 28/10/2023.
//

import SwiftUI

//Stores the available options for category and platforms
class OptionsStore {
    private var GameOptions = createGameOptions()
    
    var platforms: Array<Platform> {
        return GameOptions.platforms
    }
    var categories: Array<Category> {
        return GameOptions.categories
    }
    
    
    private static func createGameOptions() -> Options {
        return Options()
    }
}
