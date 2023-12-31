//
//  CategoryOverlay.swift
//  Free-To-Play Games
//
//  Created by Quinten De Wolf on 30/12/2023.
//

import SwiftUI

struct CategoryOverlay: View {
    private let category: Category
    
    init(_ category: Category) {
        self.category = category
    }
    var body: some View {
            VStack {
                Image(systemName: category.getLogo()).resizable().scaledToFit().aspectRatio(Constants.aspectRatioImage,contentMode: .fit).padding()
                Text(category.rawValue.uppercased()).font(.system(size: Constants.fontsize)).fontWeight(.bold).minimumScaleFactor(Constants.scaleFactor).aspectRatio(Constants.aspectRatioText,contentMode: .fit)
            }.tint(.white)
    }
    private struct Constants {
        static let fontsize: CGFloat = 50
        static let scaleFactor: CGFloat = 0.01
        static let aspectRatioText: CGFloat = 1
        static let aspectRatioImage: CGFloat = 4
    }
}

#Preview {
    CategoryOverlay(Category.mmorpg)
}
