//
//  CategoryOption.swift
//  Free-To-Play Games
//
//  Created by Quinten De Wolf on 28/10/2023.
//

import SwiftUI

struct CategoryOption: View {
    var category: Category
    init(_ category: Category) {
        self.category = category
    }
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: Constants.cornerRadius)
            base.strokeBorder(lineWidth: Constants.border)
                .background(base.fill(.green))
            CategoryOverlay(category: category).padding(20)
        }
    }
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let border: CGFloat = 4
    }
}

struct CategoryOverlay: View {
    var category: Category
    var body: some View {
        NavigationLink(value: category) {
            VStack {
                Image(systemName: "poweroutlet.type.b.fill").resizable().scaledToFit().aspectRatio(4,contentMode: .fit).padding()
                Text(category.rawValue.uppercased()).font(.system(size: 50)).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).minimumScaleFactor(0.01).aspectRatio(1,contentMode: .fit)
            }.tint(.white)
        }
    }
}

#Preview {
    CategoryOption(Category.pve)
}
