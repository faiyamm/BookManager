//
//  ContentView.swift
//  BookManager
//
//  Created by Fai on 07/01/26.
//

import SwiftUI

struct ContentView: View {
    @State var books = getBooks()
    @State var newBook = Book()
    @State private var showBookSheet: Bool = false
        
        var body: some View {
            TabView {
                
                BookListView(books: $books)
                .tabItem {
                    Label("Books", systemImage: "books.vertical.fill")
                }
                
                // Favorites View
                FavoritesView(books: $books)
                    .tabItem {
                        Label("Favorites", systemImage: "heart.fill")
                    }
            }
        }
    }

#Preview {
    ContentView()
}
