//
//  Game.swift
//  Free-To-Play Games
//
//  Created by Quinten De Wolf on 03/11/2023.
//

import Foundation

// Game model
struct Game: Identifiable,Hashable,Codable {
    var id: Int
    var title: String
    var short_description: String
    var genre: String
    var platform: String
    var developer: String
}
