//
//  PersistentBook_Assignment1.test.swift
//  BookManager
//
//  Created by Fai on 07/02/26.
//

import Testing
@testable import BookManager

@MainActor @Suite("Persistent Book tests")
struct PersistentBookTests_Assignment1 {
    
    @Test("Persistent Book initializer")
    func testPersistentBookInitializer() {

        let bookTitle = "Test Title"
        let status = ReadingStatus.reading
        let author = "Test Author"
        let isFavorite = true

        let book = PersistentBook(title: bookTitle)

        #expect(book.title == bookTitle)
        #expect(book.readingStatus == .unknown)
        #expect(book.author == "")
        #expect(book.isFavorite == false)
        #expect(book.getNameAndAuthor() == "Test Title by Unknown Author")

        book.readingStatus = status
        book.author = author
        book.isFavorite = isFavorite

        #expect(book.readingStatus == .reading)
        #expect(book.author == "Test Author")
        #expect(book.isFavorite == true)
        #expect(book.getNameAndAuthor() == "Test Title by Test Author")
    }
}
