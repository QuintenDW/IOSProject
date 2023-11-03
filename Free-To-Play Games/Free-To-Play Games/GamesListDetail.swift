//
//  GameListDetail.swift
//  Free-To-Play Games
//
//  Created by Quinten De Wolf on 03/11/2023.
//

import SwiftUI


struct GamesListDetail: View {
    @EnvironmentObject var gamesList: GamesList
    let game: Game
    
    var body: some View {
        Text(game.name).font(.largeTitle).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundStyle(.green).multilineTextAlignment(.center).padding()
        VStack(alignment: .leading,spacing: 20) {
            Text("Beschrijving").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundStyle(.green)
            Text(game.description).font(.subheadline).multilineTextAlignment(.leading)
            Text("genre").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundStyle(.green)
            Text(game.genre.rawValue)
            Text("developer").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundStyle(.green)
            Text(game.developer)
            Text("Platform").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundStyle(.green)
            Text(game.platform.rawValue)
        }
        .navigationTitle("Details game")
        .toolbar {
            if (!gamesList.contains(agame: game)) {
                Button {
                    gamesList.addFavorite(game: game)
                } label: {
                    Image(systemName: "bookmark.fill")
                }
            } else {
                Button {
                    gamesList.removeFavorite(game: game)
                } label: {
                    Image(systemName: "bookmark.slash.fill")
                }
            }
            
        }
    }
    
}
#Preview {
    GamesListDetail(game: Game(name:"overwatch 2",description: "lorem ipsum",genre: Category.mmorpg,platform: Platform.pc, developer: "Blizard")).environmentObject(GamesList())
}
