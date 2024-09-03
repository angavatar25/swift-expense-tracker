//
//  CategoryCard.swift
//  Exspense Tracker
//
//  Created by Ananda Afryan on 20/03/24.
//

import SwiftUI

struct CategoryCard: View {
    let categoryName: String;
    let categoryIcon: String;
    
    init(categoryName: String, categoryIcon: String) {
        self.categoryName = categoryName
        self.categoryIcon = categoryIcon
    }

    var body: some View {
        HStack {
            HStack(spacing: 15) {
                ZStack {
                    Circle()
                        .fill(.orange)
                        .frame(width: 40, height: 40)
                    Image(systemName: categoryIcon)
                        .font(.system(size: 15))
                        .foregroundColor(.white)
                }
                Text(categoryName)
            }
            Spacer()
            Image(systemName: "arrow.right")
        }
    }
}

#Preview {
    CategoryCard(categoryName: "Food", categoryIcon: "car")
}
