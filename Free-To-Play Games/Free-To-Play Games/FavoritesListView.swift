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
        List(gamesList.favorites) { game in
            Text(game.name)
        }
    }
}

#Preview {
    FavoritesListView().environmentObject(GamesList())
}
