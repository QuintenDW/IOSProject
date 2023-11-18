//
//  GameOverviewView.swift
//  Free-To-Play Games
//
//  Created by Quinten De Wolf on 03/11/2023.
//

import SwiftUI

struct GamesListView: View {
    @EnvironmentObject var gamesList: GamesList
    @EnvironmentObject var gameLogic: OptionsStore
    var platform: Platform
    var category: Category
    var body: some View {
        if case .none = gamesList.games {
            Button(action: {
                gamesList.getGames(platform: platform, category: category)
            },label: {
                VStack {
                    Text("Haal games op met")
                    Text("Categorie  \(category.rawValue)")
                    Text("platform \(platform.rawValue)")
                }

            })
        }
        if gamesList.games.isFetching {
            ProgressView()
        }
        if let list = gamesList.games.gamesList {
            List(list){ game in
                NavigationLink(value: game) {
                    Text(game.title)
                }
                
            }.navigationDestination(for: Game.self) { game in
                GamesListDetail(game: game).padding(20)
            }
        }
        }

}



#Preview {
    NavigationStack {
        GamesListView(platform: Platform.pc, category: Category.mmorpg).environmentObject(GamesList()).environmentObject(OptionsStore())
    }
}
