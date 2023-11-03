//
//  Game.swift
//  Free-To-Play Games
//
//  Created by Quinten De Wolf on 03/11/2023.
//

import Foundation

struct Game: Identifiable {
    let id = UUID()
    var name: String
    var description: String
    var genre: Category
    var platform: Platform
    var developer: String
    
    static var builtins = { [
        Game(name: "Overwatch 2", description: "A hero-focussed first-person team shooter from Blizzard Entertainment", genre: Category.shooter,platform: Platform.pc,developer: "Blizzard Entertainment"),
        Game(name: "Diablo Immortal", description: "Diablo Immortal fills in the gaps between Diablo 2 and 3", genre: Category.mmorpg,platform: Platform.pc,developer: "Blizzard Entertainment") ]
    }
}
