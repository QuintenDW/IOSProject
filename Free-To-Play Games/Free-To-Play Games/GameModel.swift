//
//  GameModel.swift
//  Free-To-Play Games
//
//  Created by Quinten De Wolf on 28/10/2023.
//

import Foundation

struct GameModel {
    private (set) var platforms: Array<Platform>
    private (set) var selectedPlatform: Platform = Platform.pc
    private (set) var categories: Array<Category>
    private (set) var selectedCategory: Category = Category.moba
    
    init() {
        platforms = []
        categories = []
        for platform in Platform.allCases {
            platforms.append(platform)
        }
        for category in Category.allCases {
            categories.append(category)
        }
    }
    mutating func selectPlatform(_ platform: Platform) {
        selectedPlatform = platform
    }
    mutating func selectCategory(_ category: Category) {
        selectedCategory = category
    }
}
