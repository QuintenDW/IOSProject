//
//  GamesOverview.swift
//  Free-To-Play Games
//
//  Created by Quinten De Wolf on 03/11/2023.
//

import SwiftUI

class GamesList: ObservableObject {
    @Published private (set) var games: [Game]
    @Published private (set) var favorites: [Game] = [] {
        didSet {
            save()
        }
    }
    init() {
        if let data = try? Data(contentsOf: saveURL), let savedFavorites = try? JSONDecoder().decode([Game].self, from: data) {
            favorites = savedFavorites
        }
        self.games = Game.builtins() //initializes with pre-defined games for testing
    }
    private let saveURL: URL = URL.documentsDirectory.appendingPathComponent("Saved.favorites")
    
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
    
    private func save() {
        do {
            let data = try JSONEncoder().encode(favorites)
            try data.write(to: saveURL)
        } catch let error {
            print("Error during save of favorites \(error.localizedDescription)")
        }

    }
}
