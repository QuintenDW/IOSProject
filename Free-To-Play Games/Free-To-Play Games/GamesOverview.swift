//
//  GamesOverview.swift
//  Free-To-Play Games
//
//  Created by Quinten De Wolf on 03/11/2023.
//

import SwiftUI

class GamesOverview: ObservableObject {
    @Published private (set) var games: [Game]
    
    init(games: [Game]) {
        self.games = Game.builtins() //initializes with pre-defined games for testing
    }
    
}
