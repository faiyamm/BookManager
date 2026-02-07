//
//  AddEditView.swift
//  BookManager
//
//  Created by Fai on 16/01/26.
//

import SwiftUI
import SwiftData

struct AddEditView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    var book: PersistentBook?
    
    @State private var title: String = ""
    @State private var author: String = ""
    @State private var details: String = ""
    @State private var genre: Genre = .unknown
    @State private var readingStatus: ReadingStatus = .unknown
    @State private var review: String = ""
    @State private var rating: Int = 0

    var body: some View {
        NavigationStack {
            Form {
                Section("Book Details") {
                    TextField("Title", text: $title)
                    TextField("Author", text: $author)
                    VStack(alignment: .leading) {
                        Text("Description").font(.caption).foregroundStyle(.secondary)
                        TextEditor(text: $details).frame(height: 100)
                    }
                }
                Section("My Review") {
                    StarRatingField(rating: $rating)
                    VStack(alignment: .leading) {
                        Text("Thoughts").font(.caption).foregroundStyle(.secondary)
                        TextEditor(text: $review).frame(height: 100)
                    }
                }
            }
            .navigationTitle(book == nil ? "Add New Book" : "Edit Book")
            .onAppear {
                if let book = book {
                    title = book.title
                    author = book.author
                    details = book.details
                    review = book.review
                    rating = book.rating
                }
            }
            .toolbar {
                Button("Save") {
                    if let book = book {
                        book.title = title
                        book.author = author
                        book.details = details
                        book.genre = genre
                        book.rating = rating
                        book.review = review
                    } else {
                        let newBook = PersistentBook(
                            title: title,
                            author: author,
                            details: details,
                            genre: genre,
                            rating: rating,
                            review: review
                        )
                        modelContext.insert(newBook)

                        do {
                            try modelContext.save()
                            print("Book saved to database!")
                        } catch {
                            print("Error saving: \(error.localizedDescription)")
                        }
                    }
                    dismiss()
                }
                .disabled(title.isEmpty)
            }
        }
    }
}
