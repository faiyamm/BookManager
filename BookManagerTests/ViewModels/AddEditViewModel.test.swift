//
//  AddEditViewModel.test.swift
//  BookManager
//
//  Created by Fai on 13/02/26.
//

import Testing
import SwiftData
@testable import BookManager

@MainActor
struct AddEditViewModelTests {

    @Test("View Model inits correctly for a new book")
    func testNewBookInit() throws {
        // arrange
        let container = try ModelContainer(
            for: PersistentBook.self,
            configurations: .init(isStoredInMemoryOnly: true)
        )
        let modelContext = container.mainContext

        // act
        let viewModel = AddEditViewModel(
            modelContext: modelContext
        )

        // assert
        #expect(viewModel.title == "")
        #expect(viewModel.author == "")
        #expect(viewModel.genre == .unknown)
        #expect(viewModel.readingStatus == .unknown)
        #expect(viewModel.details == "")
        #expect(viewModel.rating == 0)
        #expect(viewModel.review == "")
        #expect(viewModel.isFavorite == false)

        #expect(viewModel.navigationTitle == "Add New Book")
        #expect(viewModel.isNotSavable == true)
    }

    @Test("View Model init correctly for an existing book")
    func testExistingBookInit() throws {
        // arrange
        let container = try ModelContainer(
            for: PersistentBook.self,
            configurations: .init(isStoredInMemoryOnly: true)
        )
        let modelContext = container.mainContext
        let book = PersistentBook(title: "Test", author: "Test Author", rating: 3, genre: .fantasy, isFavorite: true)

        //act
        let viewModel = AddEditViewModel(
            book: book,
            modelContext: modelContext
        )

        //assert
        #expect(viewModel.title == "Test")
        #expect(viewModel.author == "Test Author")
        #expect(viewModel.isFavorite == true)
        #expect(viewModel.genre == .fantasy)
        #expect(viewModel.rating == 3)

        #expect(viewModel.navigationTitle == "Edit Book")
        #expect(viewModel.isNotSavable == true)
    }

    @Test("View Model saves correctly for a new book")
    func testAddNewBook() throws{
        // arrange
        let container = try ModelContainer(
            for: PersistentBook.self,
            configurations: .init(isStoredInMemoryOnly: true)
        )
        let modelContext = container.mainContext

        // act
        let viewModel = AddEditViewModel(
            modelContext: modelContext
        )
        viewModel.title = "New Title"
        viewModel.author = "New Author"
        viewModel.saveBook()

        // assert
        let descriptor = FetchDescriptor<PersistentBook>()
        let savedBooks = try modelContext.fetch(descriptor)

        #expect(savedBooks.count == 1)
        if let firstBook = savedBooks.first {
            #expect(firstBook.title == "New Title")
            #expect(firstBook.author == "New Author")
        }
    }

    @Test("View Model saves correctly an existing book")
    func testEditExistingBook() throws {
        //arrange
        let container = try ModelContainer(
            for: PersistentBook.self,
            configurations: .init(isStoredInMemoryOnly: true)
        )
        let modelContext = container.mainContext
        let book = PersistentBook(title: "Test", author: "Test Author", rating: 3, genre: .fantasy, isFavorite: true)
        modelContext.insert(book)
        try modelContext.save()

        // act
        let viewModel = AddEditViewModel(
            book: book,
            modelContext: modelContext
        )
        viewModel.title = "Updated Title"
        viewModel.author = "Updated Author"
        viewModel.saveBook()

        // assert
        let descriptor = FetchDescriptor<PersistentBook>()
        let savedBooks = try modelContext.fetch(descriptor)

        #expect(savedBooks.count == 1)
        if let firstBook = savedBooks.first {
            #expect(firstBook.title == "Updated Title")
            #expect(firstBook.author == "Updated Author")
        }
    }

    @Test("View Model isNotSavable works correctly for a new book")
    func testAddNewBook_isNotSavable() throws {
        // arrange
        let container = try ModelContainer(
            for: PersistentBook.self,
            configurations: .init(isStoredInMemoryOnly: true)
        )
        let modelContext = container.mainContext

        // act
        let viewModel = AddEditViewModel(
            modelContext: modelContext
        )

        #expect(viewModel.isNotSavable == true)

        viewModel.author = "Test Author"
        #expect(viewModel.isNotSavable == true)

        viewModel.title = "Test"
        #expect(viewModel.isNotSavable == false)
    }

    @Test("View Model isNotSavable works correctly for an existing book")
    func testEditExistingBook_isNotSavable() throws {
        let container = try ModelContainer(
            for: PersistentBook.self,
            configurations: .init(isStoredInMemoryOnly: true)
        )
        let modelContext = container.mainContext
        let book = PersistentBook(title: "Test", author: "Test Author", rating: 3, genre: .fantasy, isFavorite: true)

        //act
        let viewModel = AddEditViewModel(
            book: book,
            modelContext: modelContext
        )

        // assert
        #expect(viewModel.isNotSavable == true)

        viewModel.author = "New Author"
        #expect(viewModel.isNotSavable == false)

        viewModel.author = "Test Author"
        #expect(viewModel.isNotSavable == true)
    }
}
