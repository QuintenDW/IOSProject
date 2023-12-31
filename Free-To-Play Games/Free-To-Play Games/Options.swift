//
//  GameModel.swift
//  Free-To-Play Games
//
//  Created by Quinten De Wolf on 28/10/2023.
//

import Foundation

//model for options
struct Options {
    private (set) var platforms: Array<Platform>
    private (set) var categories: Array<Category>
    
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
}
