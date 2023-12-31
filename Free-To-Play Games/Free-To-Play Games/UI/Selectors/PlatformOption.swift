//
//  PlatformOption.swift
//  Free-To-Play Games
//
//  Created by Quinten De Wolf on 28/10/2023.
//

import SwiftUI

struct PlatformOption: View {
    private var platform: Platform
    
    init(_ platform: Platform) {
        self.platform = platform
    }
    //NavigationLink works like button
    var body: some View {
        NavigationLink(value: platform) {
            Text(platform.rawValue)
        }.buttonStyle(.borderedProminent).tint(.green).font(.title3).controlSize(.large)
    }
}

#Preview {
    PlatformOption(Platform.pc)
}
