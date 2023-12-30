//
//  CategoryOverlay.swift
//  Free-To-Play Games
//
//  Created by Quinten De Wolf on 30/12/2023.
//

import SwiftUI

struct CategoryOverlay: View {
    var category: Category
    var body: some View {
        NavigationLink(value: category) {
            VStack {
                Image(systemName: "poweroutlet.type.b.fill").resizable().scaledToFit().aspectRatio(4,contentMode: .fit).padding()
                Text(category.rawValue.uppercased()).font(.system(size: 50)).fontWeight(.bold).minimumScaleFactor(0.01).aspectRatio(1,contentMode: .fit)
            }.tint(.white)
        }
    }
}

#Preview {
    CategoryOverlay(category: Category.mmorpg)
}
