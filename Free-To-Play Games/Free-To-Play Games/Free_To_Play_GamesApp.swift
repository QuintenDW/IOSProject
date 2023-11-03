//
//  Free_To_Play_GamesApp.swift
//  Free-To-Play Games
//
//  Created by Quinten De Wolf on 28/10/2023.
//

import SwiftUI

@main
struct Free_To_Play_GamesApp: App {
    @StateObject var gameLogic = OptionsStore()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(gameLogic)
        }
    }
}
