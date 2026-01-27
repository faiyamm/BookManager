//
//  BookListView.swift
//  BookManager
//
//  Created by Fai on 21/01/26.
//

import SwiftUI

struct BookListView: View {
    @Binding var books: [Book]

    @ObservedObject var bookViewModel: BookViewModel
    
    @State private var newBook: Book = Book(title: "", author: "", details: "", cover: "", series: "", review: "", rating: 1)
    @State private var showBookSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            List($books) { $book in
                NavigationLink(destination: BookDetailView(book: $book)) {
                    BookListItem(book: book)
                }
            }
            .navigationTitle("Books List")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        newBook = Book(title: "", author: "", details: "", cover: "", series: "", review: "", rating: 1)
                        showBookSheet.toggle()
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showBookSheet, onDismiss: {
                if !newBook.title.isEmpty {
                    bookViewModel.addBook(newBook)
                }
            }) {
                AddEditView(book: $newBook)
            }
        }
    }
}
