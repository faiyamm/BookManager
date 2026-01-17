//
//  AddEditView.swift
//  BookManager
//
//  Created by Fai on 16/01/26.
//

import SwiftUI

struct AddEditView: View {
    @Binding var book: Book
    @State private var workingBook = Book(title: "", author: "", details: "", cover: "", year: 0, series: "")
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Book Details")) {
                    TextField("Title", text: $workingBook.title)
                    TextField("Author", text: $workingBook.author)
                    TextEditor(text: $workingBook.details)
                        .frame(height: 150)
                }
            }
            .navigationTitle(workingBook.title.isEmpty ? "Add Book" : "Edit Book")
            .onAppear {
                workingBook = book
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        book = workingBook // save changes back
                        dismiss()
                    } label: {
                        Image(systemName: "checkmark")
                    }
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
