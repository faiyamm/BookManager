//
//  BookListView.swift
//  BookManager
//
//  Created by Fai on 21/01/26.
//

import SwiftUI

struct BookListView: View {
    @Binding var books: [Book]
    @State private var tempBook: Book = Book()
    @State private var showBookSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            List($books) { $book in
                NavigationLink(destination: BookDetailView(book: $book)) {
                    BookListItem(book: book)
                }
            }
            .navigationTitle("My Books")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        tempBook = Book()
                        showBookSheet.toggle()
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showBookSheet, onDismiss: {
                if !tempBook.title.isEmpty {
                    books.append(tempBook)
                }
            }) {
                AddEditView(book: $tempBook)
            }
        }
    }
}
