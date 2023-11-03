//
//  HomeScreen.swift
//  Free-To-Play Games
//
//  Created by Quinten De Wolf on 03/11/2023.
//

import SwiftUI

struct HomeScreen: View {
    
    @EnvironmentObject var gameLogic: GameViewModel
    var body: some View {
        VStack {
            Text("Selecteer op welk platform je speelt").font(.title2).padding()
            LazyVGrid(columns: [GridItem(),GridItem(),GridItem()],spacing: 0) {
                ForEach(gameLogic.platforms.indices, id: \.self) {
                    index in PlatformOption(gameLogic.platforms[index],gameLogic).aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/).padding(1)
                }
            }
        }
    }
}

#Preview {
    HomeScreen().environmentObject(GameViewModel())
}
