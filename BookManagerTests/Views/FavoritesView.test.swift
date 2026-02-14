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
        let books = [
            PersistentBook(title:"Book 1"),
            PersistentBook(title:"Book 2", isFavorite: true),
            PersistentBook(title:"Book 3"),
        ]

        //act
        let filteredBooks = filterFavoriteBooks(books: books, useFavorite: false)

        //assert
        #expect(filteredBooks.count == 3)
    }

    @Test("Filter Books with favorites")
    func filterBooksWithFavorites() {
        //arrange
        let books = [
            PersistentBook(title:"Book 1"),
            PersistentBook(title:"Book 2", isFavorite: true),
            PersistentBook(title:"Book 3"),
            PersistentBook(title:"Book 4", isFavorite: true),
        ]

        //act
        let filteredBooks = filterFavoriteBooks(books: books, useFavorite: true)

        //assert
        #expect(filteredBooks.count == 2)
        #expect(filteredBooks.first?.title == "Book 2")
        #expect(filteredBooks[1].title == "Book 4")
    }

    @Test("Filter Books by Genre")
    func filterBooksByGenre() {
        //arrange
        let books = [
            PersistentBook(title:"Book 1"),
            PersistentBook(title:"Book 2", isFavorite: true),
            PersistentBook(title:"Book 3", genre: .fantasy),
            PersistentBook(title:"Book 4", genre: .horror, isFavorite: true),
        ]

        //act
        let filteredBooks = filterFavoriteBooks(books: books, genre: .fantasy)
        //assert
        #expect(filteredBooks.count == 1)
        #expect(filteredBooks.first?.title == "Book 3")


        //act II
        let filteredBooks2 = filterFavoriteBooks(books: books, genre: .unknown)
        //assert II
        #expect(filteredBooks2.count == 2)
        #expect(filteredBooks2.first?.title == "Book 1")
        #expect(filteredBooks2[1].title == "Book 2")


        //act III
        let filteredBooks3 = filterFavoriteBooks(books: books, genre: .horror)
        //assert III
        #expect(filteredBooks3.count == 1)
        #expect(filteredBooks3.first?.title == "Book 4")
    }

    @Test("Filter Books by Reading Status")
    func filterBooksByReadingStatus() {
        let books = [
            PersistentBook(title: "Book 1", readingStatus: .reading, isFavorite: true),
            PersistentBook(title: "Book 2", readingStatus: .read, isFavorite: true),
            PersistentBook(title: "Book 3", readingStatus: .reading, isFavorite: true),
            PersistentBook(title: "Book 4", readingStatus: .reading, isFavorite: false)
        ]

        let filteredBooks = filterFavoriteBooks(books: books, useFavorite: true, readingStatus: .reading)

        #expect(filteredBooks.count == 2)
        #expect(filteredBooks.allSatisfy { $0.readingStatus == .reading })
    }
}
