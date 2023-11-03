//
//  PlatformOption.swift
//  Free-To-Play Games
//
//  Created by Quinten De Wolf on 28/10/2023.
//

import SwiftUI

struct PlatformOption: View {
    var platform: Platform
    @EnvironmentObject var gameLogic: GameViewModel
    init(_ platform: Platform) {
        self.platform = platform
    }
    //NavigationLink works like button
    var body: some View {
        NavigationLink(value: platform) {
            Text(platform.rawValue)
        }.buttonStyle(.borderedProminent).tint(.green).font(.title3).controlSize(.large)
            .onTapGesture {
                gameLogic.selectPlatform(platform)
            }
    }
}

#Preview {
    PlatformOption(Platform.pc).environmentObject(GameViewModel())
}
