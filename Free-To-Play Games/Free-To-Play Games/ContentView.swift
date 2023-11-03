//
//  ContentView.swift
//  Free-To-Play Games
//
//  Created by Quinten De Wolf on 28/10/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var gameLogic: GameViewModel
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Welkom bij de \nFree-To-Play games lijst").font(.largeTitle).padding().multilineTextAlignment(.center)
            Image(systemName: "gamecontroller.fill").imageScale(.large).font(.largeTitle)
            Spacer()
            HomeScreen()
            //categoryOptions
            Spacer()
        }
    }
    
    private var categoryOptions: some View {
        ScrollView(.horizontal,showsIndicators: true) {
            LazyHStack(spacing:5) {
                ForEach(gameLogic.categories.indices, id: \.self) {
                    index in CategoryOption(gameLogic.categories[index]).aspectRatio(2/3,contentMode: .fit).onTapGesture {
                        gameLogic.selectCategory(gameLogic.categories[index])
                    }
                }
            }.padding([.vertical],50)
        }
        
    }
}



#Preview {
    
    ContentView().environmentObject(GameViewModel())
}
