//
//  FavoritesView.swift
//  BookManager
//
//  Created by Fai on 21/01/26.
//

import SwiftUI

struct FavoritesView: View {
    @Binding var favoriteBooks: [Book]
    @State private var showFilterSheet = false
    
    @State private var selectedGenre: Genre? = nil
    @State private var selectedReadingStatus: ReadingStatus? = nil

    // Logic: Filters correctly using the Professor's optional pattern
    var onlyFavorites: [Binding<Book>] {
        $favoriteBooks.filter { $book in
            let isFav = book.isFavorite
            let genreMatch = selectedGenre == nil || book.genre == selectedGenre
            let statusMatch = selectedReadingStatus == nil || book.readingStatus == selectedReadingStatus
            
            return isFav && genreMatch && statusMatch
        }
    }

    // Fixed layout with spacing
    let layout = [
        GridItem(.adaptive(minimum: 160), spacing: 20)
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                // Added spacing: 20 here for vertical gaps
                LazyVGrid(columns: layout, spacing: 20) {
                    ForEach(onlyFavorites, id: \.id) { $book in
                        NavigationLink(destination: BookDetailView(book: $book)) {
                            FavoriteCard(book: book)
                        }
                    }
                }
                .padding() // This restores the side margins!
            }
            .navigationTitle("My Favorite Books")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: { showFilterSheet.toggle() }) {
                        Image(systemName: "line.horizontal.3.decrease.circle")
                    }
                    .accessibilityLabel("Filter Books")
                }
            }
            .sheet(isPresented: $showFilterSheet) {
                FilterView(selectedGenre: $selectedGenre,
                           selectedReadingStatus: $selectedReadingStatus)
            }
        }
    }
}

