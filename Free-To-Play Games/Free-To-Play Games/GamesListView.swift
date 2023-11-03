//
//  GameOverviewView.swift
//  Free-To-Play Games
//
//  Created by Quinten De Wolf on 03/11/2023.
//

import SwiftUI

struct GameOverviewView: View {
    @ObservedObject var gamesList: GamesList
    var body: some View {
        List(gamesList.games) { game in
            Text(game.name)
        }
    }
}

#Preview {
    GameOverviewView(gamesList: GamesList())
}
