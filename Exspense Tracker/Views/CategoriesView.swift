//
//  CategoriesView.swift
//  Exspense Tracker
//
//  Created by Ananda Afryan on 19/03/24.
//

import SwiftUI

struct CategoriesView: View {
    @State private var text: String = ""

    var body: some View {
        let lightPurple = Color(red: 128/255.0, green: 72/255.0, blue: 207/255.0)
        let darkPurple = Color(red: 97/255.0, green: 58/255.0, blue: 191/255.0)

        GeometryReader { geomerty in
            VStack(alignment: .leading) {
                LinearGradient(gradient: Gradient(colors: [darkPurple, lightPurple]), startPoint: .bottom, endPoint: .topLeading)
                    .edgesIgnoringSafeArea(.all)
                    .overlay(
                        VStack {
                            HStack {
                                Text("Categories")
                                    .font(.title)
                                    .fontWeight(.semibold)
                                Spacer()
                                Button(action: {
                                    
                                }) {
                                    Image(systemName: "plus.circle")
                                        .font(.system(size: 30))
                                }
                            }
                            VStack {
                                ZStack(alignment: .leading) {
                                    TextField("Search Categories", text: $text)
                                        .padding(EdgeInsets(top: 10, leading: 40, bottom: 10, trailing: 15)) // Set inner padding
                                        .background(Color.white)
                                        .cornerRadius(999)
                                    
                                    Image(systemName: "magnifyingglass")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.gray)
                                        .padding(.leading, 15)
                                }
                            }
                            Spacer()
                        }.padding()
                    )
                    .frame(maxHeight: min(geomerty.size.height, 150))
                    .foregroundColor(.white)
                ScrollView {
                    VStack(alignment: .leading) {
                        VStack(spacing: 20) {
                            ForEach(CategoryData) {data in
                                CategoryCard(categoryName: data.categoryName, categoryIcon: data.categoryIcon
                                )
                            }
                        }
                    }.padding()
                }
                Spacer()
            }
        }
    }
}

#Preview {
    CategoriesView()
}
