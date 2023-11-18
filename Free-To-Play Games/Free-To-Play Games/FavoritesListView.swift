//
//  FavoritesListView.swift
//  Free-To-Play Games
//
//  Created by Quinten De Wolf on 03/11/2023.
//

import SwiftUI

//Shows list of user's favorite games
struct FavoritesListView: View {
    @EnvironmentObject var gamesList: GamesList
    var body: some View {
        if gamesList.favorites.isEmpty {
            Text("U hebt momenteel geen favorieten").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        } else {
            List(gamesList.favorites) { game in
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
    FavoritesListView().environmentObject(GamesList())
}
