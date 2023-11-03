//
//  GameViewModel.swift
//  Free-To-Play Games
//
//  Created by Quinten De Wolf on 28/10/2023.
//

import SwiftUI

class OptionsStore: ObservableObject {
    @Published private var GameOptions = createGameOptions()
    
    var platforms: Array<Platform> {
        return GameOptions.platforms
    }
    var categories: Array<Category> {
        return GameOptions.categories
    }
    
    func selectPlatform(_ platform: Platform) {
        GameOptions.selectPlatform(platform)
    }
    
    func selectCategory(_ category: Category) {
        GameOptions.selectCategory(category)
    }
    var selectedCategory: Category {
        return GameOptions.selectedCategory
    }
    private static func createGameOptions() -> Options {
        return Options()
    }
}
