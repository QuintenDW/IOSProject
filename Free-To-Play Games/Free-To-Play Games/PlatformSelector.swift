//
//  HomeScreen.swift
//  Free-To-Play Games
//
//  Created by Quinten De Wolf on 03/11/2023.
//

import SwiftUI

struct PlatformSelector: View {
    
    @EnvironmentObject var gameLogic: OptionsStore
    var body: some View {
        VStack {
            Text("Selecteer op welk platform je speelt").font(.title2).padding()
            LazyVGrid(columns: [GridItem(),GridItem(),GridItem()],spacing: 0) {
                ForEach(gameLogic.platforms.indices, id: \.self) {index in
                    PlatformOption(gameLogic.platforms[index]).aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/).padding(1)
                    }
                    
            }.navigationDestination(for: Platform.self) { value in
                CategorySelector()
            }
        }
    }
}

#Preview {
    PlatformSelector().environmentObject(OptionsStore())
}
