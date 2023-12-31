//
//  GameListDetail.swift
//  Free-To-Play Games
//
//  Created by Quinten De Wolf on 03/11/2023.
//

import SwiftUI


struct GamesListDetail: View {
    @EnvironmentObject var gamesList: GamesList
    @Environment(\.dismiss) private var dismiss
    private let selectedGame: Game
    init(game: Game) {
        self.selectedGame = game
    }
    var body: some View {

        ScrollView(.vertical) {
            Text(selectedGame.title).font(.largeTitle).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundStyle(.green).multilineTextAlignment(.center).padding()
            
            VStack(alignment: .leading,spacing: 20) {
                Text("Beschrijving").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundStyle(.green)
                Text(selectedGame.short_description).font(.subheadline).multilineTextAlignment(.leading)
                Text("Genre").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundStyle(.green)
                Text(selectedGame.genre)
                Text("Developer").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundStyle(.green)
                Text(selectedGame.developer)
                Text("Platform").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundStyle(.green)
                Text(selectedGame.platform)
            }
            .navigationTitle("Details game")
            .toolbar {
                if (!gamesList.contains(game: selectedGame)) {
                    Button {
                       gamesList.addFavorite(game: selectedGame)
                    } label: {
                        Image(systemName: "bookmark.fill")
                    }
                } else {
                    Button {
                        gamesList.removeFavorite(game: selectedGame)
                        dismiss()
                    } label: {
                        Image(systemName: "bookmark.slash.fill")
                    }
                }
                
            }
        }.scrollIndicators(.hidden)

    }
    
}
#Preview {
    GamesListDetail(game: Game(id:1,title:"overwatch 2",short_description: "lorem ipsum tekst",genre: Category.mmorpg.rawValue,platform: Platform.pc.rawValue, developer: "Blizard")).environmentObject(GamesList())
}
