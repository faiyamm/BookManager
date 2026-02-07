//
//  ContentView.swift
//  BookManager
//
//  Created by Fai on 07/01/26.
//

import SwiftUI

struct ContentView: View {
    @AppStorage(SETTINGS_THEME_KEY) var theme: Theme = DEFAULT_SETTINGS_THEME_VALUE
    
    var body: some View {
        TabView {
            BookListView()
                .tabItem {
                    Label("Books", systemImage: "books.vertical.fill")
                }
            
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
        .preferredColorScheme(theme.colorScheme)
    }
}

#Preview {
    ContentView()
}
