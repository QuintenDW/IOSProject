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
        if gamesList.userFavorites.isEmpty {
            Text("U hebt momenteel geen favorieten").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        } else {
            List(gamesList.userFavorites) { game in
                    NavigationLink(value: game) {
                        Text(game.title)
                            .swipeActions() {
                                Button(role: .destructive) {
                                    gamesList.removeFavorite(game: game)
                                } label: {
                                    Label("Verwijder uit favorieten", systemImage: "trash.fill")
                                }
                            }
                    }
            }
            .navigationDestination(for: Game.self) { game in
                GamesListDetail(game: game).padding(20)
            }.toolbar {
                ShareLink(item: gamesList.userFavorites
                    .map{$0.title}
                    .joined(separator: "\n"),
                    preview: SharePreview("Versturen van favorieten"))
            }

        }
  
    }
}

#Preview {
    FavoritesListView().environmentObject(GamesList())
}
