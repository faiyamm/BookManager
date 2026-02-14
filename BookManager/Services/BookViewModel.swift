//
//  BookViewModel.swift
//  BookManager
//
//  Created by Fai on 26/01/26.
//

import Foundation
internal import Combine

class BookViewModel: ObservableObject {
    @Published var books: [Book] = [] {
        didSet {
            saveBooks()
        }
    }
    
    private var booksKey = "BOOKS_KEY"
    
    init() {
        loadBooks()
        if books.isEmpty {
            books = getBooks()
        }
    }
    
    func addBook(_ book: Book) {
        books.append(book)
    }
    
    private func loadBooks() {
        if let savedBookData = UserDefaults.standard.data(forKey: booksKey),
           let savedDecodeBooks = try? JSONDecoder().decode([Book].self, from: savedBookData) {
            books = savedDecodeBooks
        }
    }
    
    private func saveBooks() {
        if let encoded = try? JSONEncoder().encode(books) {
            UserDefaults.standard.set(encoded, forKey: booksKey)
        }
    }
}
