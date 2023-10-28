//
//  ContentView.swift
//  Free-To-Play Games
//
//  Created by Quinten De Wolf on 28/10/2023.
//

import SwiftUI

struct ContentView: View {
let options = ["PC","Playstation","Xbox"]
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Welkom bij de \nFree-To-Play games lijst").font(.largeTitle).padding().multilineTextAlignment(.center)
            Image(systemName: "gamecontroller.fill").imageScale(.large).font(.largeTitle)
            Spacer()
            
            optionsList
            Spacer()
        }
    }
    
    // List with option buttons
    var optionsList: some View {
        VStack {
            Text("Selecteer op welk platform je speelt").font(.title2).padding()
            LazyVGrid(columns: [GridItem(),GridItem(),GridItem()],spacing: 0) {
                ForEach(options.indices, id: \.self) {
                    index in Option(text: options[index]).aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                }
            }
        }

    }
}
struct Option: View {
    var text: String = ""
    var body: some View {
        Button(text) {
            
        }.buttonStyle(.borderedProminent).tint(.green).font(.title3).controlSize(.large)
    }
}


#Preview {
    ContentView()
}
