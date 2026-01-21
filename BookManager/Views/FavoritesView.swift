//
//  FavoritesView.swift
//  BookManager
//
//  Created by Fai on 21/01/26.
//

import SwiftUI

struct FavoritesView: View {
    @Binding var books: [Book]
    let layout = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: layout) {
                    ForEach($books) { $book in
                        if book.isFavorite {
                            NavigationLink(destination: BookDetailView(book: $book)) {
                                FavoriteCard(book: book)
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Favorites")
        }
    }
}
