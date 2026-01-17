//
//  ContentView.swift
//  BookManager
//
//  Created by Fai on 07/01/26.
//

import SwiftUI

struct ContentView: View {
    @State var books = getBooks()
    @State private var showBookSheet = false

    @State var newBook = Book(title: "", author: "", details: "", cover: "", year: 0, series: "")

    var body: some View {
        NavigationStack {
            List($books) { $book in
                NavigationLink(destination: BookDetailView(book: $book)) {
                    HStack {
                        Image(book.cover)
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text(book.title)
                    }
                }
            }
            .toolbar {
                Button(action: { showBookSheet.toggle() }) {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showBookSheet) {
                AddEditView(book: $newBook)
            }

            .onChange(of: showBookSheet) { oldValue, newValue in
                if newValue == false && !newBook.title.isEmpty {
                    books.append(newBook)
                    newBook = Book(title: "", author: "", details: "", cover: "", year: 0, series: "")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
