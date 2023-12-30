//
//  GameViewModel.swift
//  Free-To-Play Games
//
//  Created by Quinten De Wolf on 28/10/2023.
//

import SwiftUI

//viewmodel for options
class OptionsStore: ObservableObject {
    @Published private var GameOptions = createGameOptions()
    
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
