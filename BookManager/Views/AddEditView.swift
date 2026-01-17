//
//  AddEditView.swift
//  BookManager
//
//  Created by Fai on 16/01/26.
//

import SwiftUI

struct AddEditView: View {
    @Binding var book: Book
    @State var workingBook: Book
    @Environment(\.dismiss) private var dismiss

    init(book: Binding<Book>) {
        _book = book
        _workingBook = .init(initialValue: book.wrappedValue)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Book Details")) {
                    TextField("Title", text: $workingBook.title)
                    TextField("Author", text: $workingBook.author)
                    
                    Picker("Genre", selection: $workingBook.genre){
                        ForEach(Genre.allCases, id: \.self) { genre in
                            Text(genre.rawValue).tag(genre)
                        }
                    }
                    
                    Picker("Reading Status", selection: $workingBook.readingStatus){
                        ForEach(ReadingStatus.allCases, id: \.self) { status in
                            Text(status.rawValue).tag(status)
                        }
                    }
                    TextEditor(text: $workingBook.details)
                        .frame(height: 150)
                }
                
                Section(header: Text("Ratings & Review")) {
                    StarRatingView(rating: $workingBook.rating)
                    TextEditor(text: $workingBook.review)
                        .frame(height: 150)
                }
            }
            .navigationTitle(book.title.isEmpty ? "Add Book" : "Edit \(book.title)")

            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        book.title = workingBook.title
                        book.author = workingBook.author
                        book.details = workingBook.details
                        book.review = workingBook.review
                        book.rating = workingBook.rating
                        book.genre = workingBook.genre
                        book.readingStatus = workingBook.readingStatus
                        dismiss()
                    } label: {
                        Image(systemName: "checkmark")
                    }
                    .disabled(workingBook.title.isEmpty || (workingBook.author.isEmpty && workingBook.details.isEmpty))
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button { dismiss() } label: {
                        Image(systemName: "xmark")
                    }
                }
            }
        }
    }
}
