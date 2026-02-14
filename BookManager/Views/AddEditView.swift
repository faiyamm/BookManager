//
//  AddEditView.swift
//  BookManager
//
//  Created by Fai on 16/01/26.
//

import SwiftUI
import SwiftData

struct AddEditView: View {

    @StateObject private var viewModel: AddEditViewModel

    @Environment(\.dismiss) var dismiss

    init(book: PersistentBook? = nil, modelContext: ModelContext) {
        _viewModel = StateObject(
            wrappedValue: AddEditViewModel(
                book: book,
                modelContext: modelContext
            )
        )
    }

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Book cover")){
                    ImagePicker(image: $viewModel.coverUI)
                }
                Section("Book Details") {
                    TextField("Title of the book", text: $viewModel.title)
                    TextField("Author", text: $viewModel.author)
                    Picker("Genre", selection: $viewModel.genre){
                        ForEach(Genre.allCases, id: \.self) { genre in
                            Text(genre.rawValue).tag(genre)
                        }
                    }

                    Picker("Reading Status", selection: $viewModel.readingStatus){
                        ForEach(ReadingStatus.allCases, id: \.self) { status in
                            Text(status.rawValue).tag(status)
                        }
                    }
                    TextEditor(text: $viewModel.details)
                        .frame(height: 150)
                }
                Section(header: Text("Book review")){
                    StarRatingField(rating: $viewModel.rating)
                    TextEditor(text: $viewModel.review)
                        .frame(height: 150)
                }
            }
            .navigationTitle(viewModel.navigationTitle)
            .toolbar{
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        viewModel.saveBook()
                        dismiss()
                    }.disabled(viewModel.isNotSavable)
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}
