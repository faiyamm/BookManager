//
//  FavoritesView.test.swift
//  BookManager
//
//  Created by Fai on 07/02/26.
//

import Testing
import SwiftData
@testable import BookManager

@MainActor @Suite("Favorite View Testing")
struct FavoritesViewTests {
    
    // Setup an in-memory container for SwiftData models
    let container: ModelContainer
    
    init() throws {
        let schema = Schema([PersistentBook.self])
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        container = try ModelContainer(for: schema, configurations: [config])
    }
    
    @Test("No filter is applied")
    func noFilterApplied() {
        let books: [PersistentBook] = []
        let filteredBooks = filterFavoriteBooks(books: books)
        #expect(filteredBooks.isEmpty)
    }
    
    @Test("Filter Books with favorites")
    func filterBooksWithFavorites() {
        // You must initialize models within the context of the container
        let books = [
            PersistentBook(title: "Book 1", isFavorite: false),
            PersistentBook(title: "Book 2", isFavorite: true),
            PersistentBook(title: "Book 3", isFavorite: false),
            PersistentBook(title: "Book 4", isFavorite: true)
        ]

        let filteredBooks = filterFavoriteBooks(books: books)
        #expect(filteredBooks.count == 2)
    }

    @Test("Filter Books by Genre")
    func filterBooksByGenre() {
        let books = [
            PersistentBook(title: "Book 1", genre: .fantasy, isFavorite: true),
            PersistentBook(title: "Book 2", genre: .horror, isFavorite: true),
            PersistentBook(title: "Book 3", genre: .fantasy, isFavorite: true),
            PersistentBook(title: "Book 4", genre: .fantasy, isFavorite: false)
        ]

        let filteredBooks = filterFavoriteBooks(books: books, selectedGenre: .fantasy)

        #expect(filteredBooks.count == 2)
        #expect(filteredBooks.allSatisfy { $0.genre == .fantasy })
    }

    @Test("Filter Books by Reading Status")
    func filterBooksByReadingStatus() {
        let books = [
            PersistentBook(title: "Book 1", readingStatus: .reading, isFavorite: true),
            PersistentBook(title: "Book 2", readingStatus: .read, isFavorite: true),
            PersistentBook(title: "Book 3", readingStatus: .reading, isFavorite: true),
            PersistentBook(title: "Book 4", readingStatus: .reading, isFavorite: false)
        ]

        let filteredBooks = filterFavoriteBooks(books: books, selectedReadingStatus: .reading)

        #expect(filteredBooks.count == 2)
        #expect(filteredBooks.allSatisfy { $0.readingStatus == .reading })
    }
}
