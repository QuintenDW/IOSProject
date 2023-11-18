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
    var body: some View {
        if case .none = gamesList.games {
            Button(action: {
                gamesList.getGames(platform: gameLogic.selectedPlatform, category: gameLogic.selectedCategory)
            },label: {
                Text("Haal games op met categorie \(gameLogic.selectedCategory.rawValue) en platform \(gameLogic.selectedPlatform.rawValue)")
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
        GamesListView().environmentObject(GamesList())
    }
}
