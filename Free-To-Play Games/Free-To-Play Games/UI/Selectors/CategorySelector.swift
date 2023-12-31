//
//  CategorySelector.swift
//  Free-To-Play Games
//
//  Created by Quinten De Wolf on 03/11/2023.
//

import SwiftUI

struct CategorySelector: View {
    let gameLogic = OptionsStore()
    @EnvironmentObject var gamesList: GamesList
    private let platform: Platform
    
    init(platform: Platform) {
        self.platform = platform
    }
    var body: some View {
        ScrollView(.horizontal,showsIndicators: true) {
            LazyHStack(spacing:5) {
                ForEach(gameLogic.categories.indices, id: \.self) {
                    index in CategoryOption(gameLogic.categories[index])
                        .aspectRatio(2/3,contentMode: .fit)
                        .padding([.vertical],20)
                }
            }
            .navigationTitle("Categorie selectie")
            .padding([.vertical],50)
            .navigationDestination(for: Category.self) { value in
                GamesListView(platform: platform, category: value)
            }.onAppear() {
                gamesList.reset()
            }
        }
    }
}

#Preview {
    CategorySelector(platform: Platform.pc).environmentObject(GamesList())
}
