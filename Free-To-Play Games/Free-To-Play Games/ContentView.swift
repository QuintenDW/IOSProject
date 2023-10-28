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
        VStack {
            Text("Welkom bij de Free-to-play games lijst").font(.largeTitle).padding()
            Spacer()
            optionsList
            Spacer()
        }
    }
    
    // List with option buttons
    var optionsList: some View {
        VStack {
            Text("Selecteer op welk platform je speelt").font(.headline)
            HStack {
                ForEach(options.indices, id: \.self) {
                    index in Option(text: options[index])
                    
                }
            }
        }

    }
}
struct Option: View {
    var text: String = ""
    var body: some View {
        Button(text) {
            
        }.buttonStyle(.borderedProminent).tint(.green).padding().font(.title3)
    }
}


#Preview {
    ContentView()
}
