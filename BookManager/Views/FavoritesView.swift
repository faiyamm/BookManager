//
//  FavoritesView.swift
//  BookManager
//
//  Created by Fai on 21/01/26.
//

import SwiftUI
import SwiftData

struct FavoritesView: View {
    @Query private var books: [PersistentBook]
    @State private var showFilterSheet: Bool = false
    @State var selectedGenre: Genre? = nil
    @State var selectedReadingStatus: ReadingStatus? = nil

    @AppStorage(FAVORITE_GRID_COLUMNS_KEY) var numberOfColumns: Int = FAVORITE_GRID_COLUMNS_KEY_DEFAULT

    private var layout: [GridItem] {
        Array(repeating: GridItem(.flexible()), count: numberOfColumns)
    }

    private var favoriteBooks: [PersistentBook] {
        filterFavoriteBooks(books: books, useFavorite: true, genre: selectedGenre, readingStatus: selectedReadingStatus)
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                HStack{
                    if(selectedGenre != nil){
                        Text("Genre: \(selectedGenre!.rawValue)")
                            .foregroundColor(.secondary)
                        Button("X"){
                            selectedGenre = nil
                        }
                    }
                    if(selectedReadingStatus != nil){
                        Text("Status: \(selectedReadingStatus!.rawValue)")
                            .foregroundColor(.secondary)
                        Button("X"){
                            selectedReadingStatus = nil
                        }
                    }
                }
                LazyVGrid(columns: layout, spacing: 20) {
                    ForEach(favoriteBooks, id: \.self) { book in
                        NavigationLink(destination: BookDetailView(book: book)) {
                            FavoriteCard2(book: book)
                                .padding()
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Favorites")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: { showFilterSheet.toggle() }) {
                        Image(systemName: "line.horizontal.3.decrease.circle")
                    }
                }
            }
            .sheet(isPresented: $showFilterSheet) {
                FilterView(selectedGenre: $selectedGenre, selectedReadingStatus: $selectedReadingStatus)
            }
        }
    }
}
