//
//  GamesOverview.swift
//  Free-To-Play Games
//
//  Created by Quinten De Wolf on 03/11/2023.
//

import SwiftUI

class GamesList: ObservableObject {
    
    @Published private var favoriteGames = FavoriteGames() {
        didSet {
            save()
        }
    }
    @Published var games: Games = .none //holds current state of retrieving games progress
    
    
    var userFavorites: [Game] {
        favoriteGames.favorites
    }
    //Loads saved favorites automatically
    init() {
        if  let data = try? Data(contentsOf: saveURL),
            let savedFavorites = try? JSONDecoder().decode(FavoriteGames.self, from: data) {
            favoriteGames = savedFavorites
        }
    }
    private let saveURL: URL = URL.documentsDirectory.appendingPathComponent("Saved.favorites")
    
    //retrieves games from freetogame API for selected platform and category
    func getGamesFor(platform: Platform,category: Category) {
        Task {
            await fetchData(selectedPlatform: platform,selectedCategory: category)
        }
    }
    
    //used when user goes back and selects different platform/category
    func reset() {
        games = .none
    }
    
    @MainActor
    func fetchData(selectedPlatform: Platform,selectedCategory: Category) async {
            let url = URL(string:"https://www.freetogame.com/api/games?platform=\(selectedPlatform.rawValue.lowercased())&category=\(selectedCategory.rawValue.lowercased())")!
            games = .fetching(url)
            do {
                games = .found(try await fetchGames(from: url))
            } catch {
                games = .failed("Kan de games niet vinden \(error.localizedDescription)")
            }
        
    }
    
    
    //Function to get games from api
    private func fetchGames(from url: URL) async throws -> [Game] {
        let (data, _) = try await URLSession.shared.data(from: url)
        if let games = try? JSONDecoder().decode([Game].self, from: data){
            return games
        } else {
            throw FetchError.badGamesData
        }
    }
    
    enum FetchError: Error {
        case badGamesData
    }
    
    //adds a game to user favorites
    func addFavorite(game: Game) {
        favoriteGames.addFavorite(game: game)
    }
    
    //removes a game from user favorites
    func removeFavorite(game: Game) {
        favoriteGames.removeFavorite(game: game)
    }
    
    //check if game is in favorite list of user
    func contains(game: Game) -> Bool {
        return favoriteGames.contains(game: game)
    }
    
    
    private func save() {
        do {
            let data = try JSONEncoder().encode(favoriteGames)
            try data.write(to: saveURL)
        } catch let error {
            print("Error during save of favorites \(error.localizedDescription)")
        }

    }
    
    //State machine for retrieving games
    enum Games {
        case none
        case fetching(URL)
        case found([Game])
        case failed(String)
        
        var list: [Game]? {
            switch self {
            case .found(let games): return games
            default: return nil
            }
        }
        var fetchedURL: URL? {
            switch self {
            case .fetching(let url): return url
            default: return nil
            }
        }
        var isFetching: Bool { fetchedURL != nil }
        
        var failedReason: String? {
            switch self {
            case .failed(let reason): return reason
            default: return nil
            }
        }
    }
}
