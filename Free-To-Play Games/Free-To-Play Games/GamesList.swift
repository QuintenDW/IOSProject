//
//  GamesOverview.swift
//  Free-To-Play Games
//
//  Created by Quinten De Wolf on 03/11/2023.
//

import SwiftUI

class GamesList: ObservableObject {
    @Published var games: Games = .none //holds current state of retrieving games progress
    @Published private (set) var favorites: [Game] = [] {
        didSet {
            save()
        }
    }
    init() {
        if let data = try? Data(contentsOf: saveURL), let savedFavorites = try? JSONDecoder().decode([Game].self, from: data) {
            favorites = savedFavorites
        }
    }
    private let saveURL: URL = URL.documentsDirectory.appendingPathComponent("Saved.favorites")
    
    func getGames(platform: Platform,category: Category) {
        Task {
            await fetchData(selectedPlatform:platform,selectedCategory:category)
        }
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
    
    //State machine for retrieving games
    enum Games {
        case none
        case fetching(URL)
        case found([Game])
        case failed(String)
        
        var gamesList: [Game]? {
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
