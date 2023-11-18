//
//  GameOverviewView.swift
//  Free-To-Play Games
//
//  Created by Quinten De Wolf on 03/11/2023.
//

import SwiftUI

struct GamesListView: View {
    @EnvironmentObject var gamesList: GamesList
    var body: some View {
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
