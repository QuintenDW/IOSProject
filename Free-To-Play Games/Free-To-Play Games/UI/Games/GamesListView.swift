//
//  GameOverviewView.swift
//  Free-To-Play Games
//
//  Created by Quinten De Wolf on 03/11/2023.
//

import SwiftUI

struct GamesListView: View {
    @EnvironmentObject var gamesList: GamesList
    private let platform: Platform
    private let category: Category
    
    init(platform: Platform,category: Category) {
        self.platform = platform
        self.category = category
    }
    
    var body: some View {
        if case .none = gamesList.games {
            VStack(spacing: 20) {
                Text("Geselecteerde categorie:  \(category.rawValue)").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundStyle(.green)
                Text("Geselecteerde platform: \(platform.rawValue)").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundStyle(.green)
                Button(action: {
                    gamesList.getGamesFor(platform: platform, category: category)
                },label: {
                    Text("Haal games op")
                }).buttonStyle(.borderedProminent).tint(.green).font(.title3).controlSize(.large)
            }.navigationTitle("Overzicht")

        }
        else if let reason = gamesList.games.failedReason {
            Text(reason)
        }
        else if gamesList.games.isFetching {
            ProgressView()
        }
        else if let list = gamesList.games.list {
            List(list){ game in
                NavigationLink(value: game) {
                    Text(game.title)
                }
                
            }
            .navigationTitle("Lijst van games")
            .navigationDestination(for: Game.self) { game in
                GamesListDetail(game: game).padding(20)
            }
        }
        }

}



#Preview {
    NavigationStack {
        GamesListView(platform: Platform.pc, category: Category.mmorpg).environmentObject(GamesList())
    }
}
