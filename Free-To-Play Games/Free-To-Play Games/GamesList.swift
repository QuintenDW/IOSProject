//
//  GamesOverview.swift
//  Free-To-Play Games
//
//  Created by Quinten De Wolf on 03/11/2023.
//

import SwiftUI

class GamesList: ObservableObject {
    @Published private (set) var games: [Game]
    @Published private (set) var favorites: [Game] = []
    init() {
        self.games = Game.builtins() //initializes with pre-defined games for testing
    }
    func addFavorite(game: Game) {
        favorites.append(game)
    }
    func removeFavorite(game: Game) {
        if let index = favorites.firstIndex(where: { $0.id == game.id }) {
            favorites.remove(at: index)
        }
    }
    func contains(agame: Game) -> Bool {
        return favorites.contains(agame)
    }
}
