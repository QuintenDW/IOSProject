//
//  ContentView.swift
//  Free-To-Play Games
//
//  Created by Quinten De Wolf on 28/10/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var gameLogic: OptionsStore
    var body: some View {
        VStack(alignment: .center) {
            Text("Welkom bij de \nFree-To-Play games lijst").font(.largeTitle).padding().multilineTextAlignment(.center)
            Image(systemName: "gamecontroller.fill").imageScale(.large).font(.largeTitle)
            Spacer()
            NavigationStack {
                PlatformSelector()
            }
            Spacer()
        }
    }
    
}



#Preview {
    
    ContentView().environmentObject(OptionsStore())
}
