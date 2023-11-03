//
//  GamesOverview.swift
//  Free-To-Play Games
//
//  Created by Quinten De Wolf on 03/11/2023.
//

import SwiftUI

class GamesList: ObservableObject {
    @Published private (set) var games: [Game]
    
    init() {
        self.games = Game.builtins() //initializes with pre-defined games for testing
    }
    
}
