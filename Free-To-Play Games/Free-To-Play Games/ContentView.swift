//
//  ContentView.swift
//  Free-To-Play Games
//
//  Created by Quinten De Wolf on 28/10/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var gameLogic: GameViewModel
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Welkom bij de \nFree-To-Play games lijst").font(.largeTitle).padding().multilineTextAlignment(.center)
            Image(systemName: "gamecontroller.fill").imageScale(.large).font(.largeTitle)
            Spacer()
            //platformOptions
            categoryOptions
            Spacer()
        }
    }
    
    // List with option buttons for platform choice
    private var platformOptions: some View {
        VStack {
            Text("Selecteer op welk platform je speelt").font(.title2).padding()
            LazyVGrid(columns: [GridItem(),GridItem(),GridItem()],spacing: 0) {
                ForEach(gameLogic.platforms.indices, id: \.self) {
                    index in PlatformOption(gameLogic.platforms[index],gameLogic).aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/).padding(1)
                }
            }
        }
    }
    private var categoryOptions: some View {
        ScrollView(.horizontal,showsIndicators: true) {
            HStack(spacing:5) {
                CategoryOption(category: Category.mmorpg).aspectRatio(2/3,contentMode: .fit)
                CategoryOption(category: Category.moba).aspectRatio(2/3,contentMode: .fit)
                CategoryOption(category: Category.moba).aspectRatio(2/3,contentMode: .fit)
            }.padding([.vertical],50)
        }
        
    }
}



#Preview {
    ContentView(gameLogic: GameViewModel())
}
