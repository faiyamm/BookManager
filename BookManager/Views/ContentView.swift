//
//  ContentView.swift
//  BookManager
//
//  Created by Fai on 07/01/26.
//

import SwiftUI

struct ContentView: View {
    @State var books = getBooks()
    @State var newBook = Book()
    @State private var showBookSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($books) { $book in
                    NavigationLink(destination: BookDetailView(book: $book)) {
                        BookListItem(book: book)
                    }
                }
                .onDelete { indices in books.remove(atOffsets: indices) }
            }
            .navigationTitle("My Library")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        newBook = Book() // reset to blank
                        showBookSheet.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title3)
                    }
                }
            }
            .sheet(isPresented: $showBookSheet) {
                AddEditView(book: $newBook)
                    .onDisappear {
                        if !newBook.title.isEmpty {
                            books.append(newBook)
                        }
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
