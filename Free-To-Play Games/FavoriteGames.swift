//
//  FavoriteGames.swift
//  Free-To-Play Games
//
//  Created by Quinten De Wolf on 30/12/2023.
//

import Foundation

struct FavoriteGames: Codable {
    private (set) var favorites: [Game] = []
    
    //adds a game to user favorites
    mutating func addFavorite(game: Game) {
        favorites.append(game)
    }
    
    //removes a game from user favorites
    mutating func removeFavorite(game: Game) {
        if let index = favorites.firstIndex(where: { $0.id == game.id }) {
            favorites.remove(at: index)
        }
    }
    
    //check if game is in favorite list of user
    func contains(game: Game) -> Bool {
        return favorites.contains(game)
    }
    
    mutating func removeFavoriteAt(index: IndexSet) {
        favorites.remove(atOffsets: index)
    }
}
