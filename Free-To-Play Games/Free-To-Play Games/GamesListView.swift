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
        List(gamesList.games) { game in
            NavigationLink(value: game) {
                Text(game.name)
            }
            
        }.navigationDestination(for: Game.self) { game in
            GamesListDetail(game: game).padding(20)
        }
    }
}



#Preview {
    NavigationStack {
        GamesListView().environmentObject(GamesList())
    }
}
