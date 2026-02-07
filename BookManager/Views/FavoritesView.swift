//
//  FavoritesView.swift
//  BookManager
//
//  Created by Fai on 21/01/26.
//

//import SwiftUI
//
//struct FavoritesView: View {
//    @Binding var books: [Book]
//    @State private var showFilterSheet: Bool = false
//    @State var selectedGenre: Genre? = nil
//    @State var selectedReadingStatus: ReadingStatus? = nil
//    
//    @AppStorage(FAVORITE_GRID_COLUMNS_KEY) var numberOfColumns: Int = FAVORITE_GRID_COLUMNS_KEY_DEFAULT
//
//    private var layout: [GridItem] {
//        Array(repeating: GridItem(.flexible()), count: numberOfColumns)
//    }
//    
//    // Filtered list of bindings
//    private var favoriteBooks: [Binding<Book>] {
//        $books.filter { $book in
//            let b = $book.wrappedValue
//            return b.isFavorite &&
//                   (selectedGenre == nil || b.genre == selectedGenre) &&
//                   (selectedReadingStatus == nil || b.readingStatus == selectedReadingStatus)
//        }
//    }
//    
//    var body: some View {
//        NavigationStack {
//            ScrollView {
//                LazyVGrid(columns: layout, spacing: 20) {
//                    ForEach(favoriteBooks) { $book in
//                        NavigationLink(destination: BookDetailView(book: $book)) {
//                            FavoriteCard(book: book)
//                        }
//                    }
//                }
//                .padding()
//            }
//            .navigationTitle("Favorites")
//            .toolbar {
//                ToolbarItem(placement: .topBarLeading) {
//                    Button(action: { showFilterSheet.toggle() }) {
//                        Image(systemName: "line.horizontal.3.decrease.circle")
//                    }
//                }
//            }
//            .sheet(isPresented: $showFilterSheet) {
//                FilterView(selectedGenre: $selectedGenre, selectedReadingStatus: $selectedReadingStatus)
//            }
//        }
//    }
//}
