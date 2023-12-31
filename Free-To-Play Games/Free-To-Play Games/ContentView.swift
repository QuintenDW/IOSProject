//
//  ContentView.swift
//  Free-To-Play Games
//
//  Created by Quinten De Wolf on 28/10/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center) {
            NavigationStack {
                Text("Welkom bij de \nFree-To-Play games lijst").font(.largeTitle).padding().multilineTextAlignment(.center)
                Image(systemName: "gamecontroller.fill").imageScale(.large).font(.largeTitle)
                Spacer()
                PlatformSelector()
                Spacer()
                favorites
            }
        }
    }
    private var favorites: some View {
        HStack {
            NavigationLink(value: "favorites") {
                Text("Ga naar favorieten")
            }
        }.navigationDestination(for: String.self) { value in
            FavoritesListView()
        }
    }
}



#Preview {
    ContentView().environmentObject(GamesList())
}
