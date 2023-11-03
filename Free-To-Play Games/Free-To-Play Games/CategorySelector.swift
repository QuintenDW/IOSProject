//
//  CategorySelector.swift
//  Free-To-Play Games
//
//  Created by Quinten De Wolf on 03/11/2023.
//

import SwiftUI

struct CategorySelector: View {
    @EnvironmentObject var gameLogic: OptionsStore
    @EnvironmentObject var gamesList: GamesList
    var body: some View {
        ScrollView(.horizontal,showsIndicators: true) {
            LazyHStack(spacing:5) {
                ForEach(gameLogic.categories.indices, id: \.self) {
                    index in CategoryOption(gameLogic.categories[index]).aspectRatio(2/3,contentMode: .fit).onTapGesture {
                        gameLogic.selectCategory(gameLogic.categories[index])
                    }
                }

            }
            .padding([.vertical],50)
            .navigationDestination(for: Category.self) { value in
                GamesListView()
            }
        }
    }
}

#Preview {
    CategorySelector().environmentObject(OptionsStore()).environmentObject(GamesList())
}
