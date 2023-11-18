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
            VStack(spacing: 20) {
                Text("Geselecteerde categorie:  \(category.rawValue)").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundStyle(.green)
                Text("Geselecteerde platform: \(platform.rawValue)").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundStyle(.green)
                Button(action: {
                    gamesList.getGames(platform: platform, category: category)
                },label: {
                    Text("Haal games")
                }).buttonStyle(.borderedProminent).tint(.green).font(.title3).controlSize(.large)
            }

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
