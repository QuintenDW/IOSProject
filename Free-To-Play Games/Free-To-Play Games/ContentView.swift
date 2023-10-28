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
            optionsList
            Spacer()
        }
    }
    
    // List with option buttons for platform choice
    var optionsList: some View {
        VStack {
            Text("Selecteer op welk platform je speelt").font(.title2).padding()
            LazyVGrid(columns: [GridItem(),GridItem(),GridItem()],spacing: 0) {
                ForEach(gameLogic.platforms.indices, id: \.self) {
                    index in Option(gameLogic.platforms[index],gameLogic).aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/).padding(1)
                }
            }
        }

    }
}
struct Option: View {
    var text: String = ""
    var gameLogic: GameViewModel
    init(_ text: String,_ gameLogic:GameViewModel) {
        self.text = text
        self.gameLogic = gameLogic
    }
    var body: some View {
        Button(text) {
            gameLogic.selectPlatform(platform: text)
        }.buttonStyle(.borderedProminent).tint(.green).font(.title3).controlSize(.large)
    }
}


#Preview {
    ContentView(gameLogic: GameViewModel())
}
