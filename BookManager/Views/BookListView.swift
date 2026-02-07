//
//  BookListView.swift
//  BookManager
//
//  Created by Fai on 21/01/26.
//

import SwiftUI
import SwiftData

struct BookListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \PersistentBook.title) var storedBooks: [PersistentBook]

    @State private var showBookSheet: Bool = false

    var body: some View {
        NavigationStack {
            List(storedBooks, id: \.id) { book in
                NavigationLink(destination: BookDetailView(book: book)) {
                    BookListItem(book: book)
                }
            }
            .navigationTitle("My Library")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add") { showBookSheet.toggle() }
                }
            }
            .sheet(isPresented: $showBookSheet) {
                AddEditView(book: nil)
            }
            .onAppear {
                seedBooksIfNeeded()
            }
        }
    }

    private func seedBooksIfNeeded() {
        if storedBooks.isEmpty {
            for book in getBooks() {
                let persistentBook = PersistentBook(
                    title: book.title,
                    author: book.author,
                    details: book.details,
                    genre: book.genre,
                    readingStatus: book.readingStatus,
                    rating: book.rating,
                    review: book.review,
                    isFavorite: book.isFavorite,
                    cover: book.cover
                )
                modelContext.insert(persistentBook)
            }
        }
    }
}
