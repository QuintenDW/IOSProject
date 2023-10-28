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
            Option(text: "PC")
            Option(text: "Playstation")
            Option(text: "Xbox")
        }
        
    }
}
struct Option: View {
    var text: String = ""
    var body: some View {
        Button(action: {
            
        }) {
            Text(text)
        }.buttonStyle(.borderedProminent).tint(.green).padding()
    }
}


#Preview {
    ContentView()
}
