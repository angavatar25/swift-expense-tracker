//
//  ContentView.swift
//  Exspense Tracker
//
//  Created by Ananda Afryan on 19/03/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.blue
            TabView() {
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                    .tag(0)
                CategoriesView()
                    .tabItem {
                        Image(systemName: "square.grid.2x2.fill")
                        Text("Category")
                    }
                    .tag(1)
            }
            .accentColor(.purple)
        }
    }
}

#Preview {
    ContentView()
}
