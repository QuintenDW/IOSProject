//
//  ContentView.swift
//  Free-To-Play Games
//
//  Created by Quinten De Wolf on 28/10/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            option(text: "PC")
            option(text: "Playstation")
            option(text: "Xbox")
        }
        
    }
}
struct option: View {
    var text: String = ""
    var body: some View {
        Button(action: {
            
        }) {
            Text(text)
        }.buttonStyle(.bordered)
    }
}

#Preview {
    ContentView()
}
