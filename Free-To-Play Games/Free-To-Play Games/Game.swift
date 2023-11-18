//
//  Game.swift
//  Free-To-Play Games
//
//  Created by Quinten De Wolf on 03/11/2023.
//

import Foundation


struct Game: Identifiable,Hashable,Codable {
    var id: Int
    var title: String
    var short_description: String
    var genre: String
    var platform: String
    var developer: String

    
    static var builtins = { [
        Game(id: 1,title: "Overwatch 2", short_description: "A hero-focussed first-person team shooter from Blizzard Entertainment", genre: Category.shooter.rawValue,platform: Platform.pc.rawValue,developer: "Blizzard Entertainment"),
        Game(id: 2,title: "Diablo Immortal", short_description: "Diablo Immortal fills in the gaps between Diablo 2 and 3", genre: Category.mmorpg.rawValue,platform: Platform.pc.rawValue,developer: "Blizzard Entertainment") ]
    }
}
