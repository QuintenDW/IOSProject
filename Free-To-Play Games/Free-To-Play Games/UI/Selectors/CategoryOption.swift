//
//  CategoryOption.swift
//  Free-To-Play Games
//
//  Created by Quinten De Wolf on 28/10/2023.
//

import SwiftUI

struct CategoryOption: View {
    private let category: Category
    init(_ category: Category) {
        self.category = category
    }
    var body: some View {
        NavigationLink(value: category) {
            ZStack {
                let base = RoundedRectangle(cornerRadius: Constants.cornerRadius)
                base.strokeBorder(.black,lineWidth: Constants.border)
                    .background(base.fill(.green))
                    .overlay {
                        CategoryOverlay(category).padding(Constants.padding)
                    }
            }
        }.buttonStyle(.borderless)
    }
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let border: CGFloat = 4
        static let padding: CGFloat = 20
    }
}


#Preview {
    CategoryOption(Category.pve)
}
