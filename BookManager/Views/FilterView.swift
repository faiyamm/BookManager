//
//  FilterView.swift
//  BookManager
//
//  Created by Fai on 26/01/26.
//

import SwiftUI

struct FilterView: View {
    
    @Binding var selectedGenre: Genre?
    @Binding var selectedReadingStatus: ReadingStatus?
    @Environment(\.dismiss) var dismiss
    
    @State private var workingGenre: Genre?
    @State private var workingReadingStatus: ReadingStatus?
    
    init(selectedGenre: Binding<Genre?>, selectedReadingStatus: Binding<ReadingStatus?>) {
        _selectedGenre = selectedGenre
        _selectedReadingStatus = selectedReadingStatus
        _workingGenre = State(initialValue: selectedGenre.wrappedValue)
        _workingReadingStatus = State(initialValue: selectedReadingStatus.wrappedValue)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Select a genre")) {
                    Picker("Genre", selection: $workingGenre) {
                        Text("All Genres").tag(nil as Genre?)
                        ForEach(Genre.allCases, id: \.self) { genre in
                            if genre != .unknown {
                                Text(genre.rawValue.capitalized).tag(genre as Genre?)
                            }
                        }
                    }
                }
                
                Section(header: Text("Select a reading status")) {
                    Picker("Reading Status", selection: $workingReadingStatus) {
                        Text("All Statuses").tag(nil as ReadingStatus?)
                        ForEach(ReadingStatus.allCases, id: \.self) { status in
                            if status != .unknown {
                                Text(status.rawValue.capitalized).tag(status as ReadingStatus?)
                            }
                        }
                    }
                }
                
                Section {
                    Button("Clear All Filters", role: .destructive) {
                        workingGenre = nil
                        workingReadingStatus = nil
                    }
                }
            }
            .navigationTitle("Filter favorite books")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Apply") {
                        selectedGenre = workingGenre
                        selectedReadingStatus = workingReadingStatus
                        dismiss()
                    }
                }
            }
        }
    }
}

func filterFavoriteBooks(
    books: [PersistentBook],
    useFavorite: Bool = false,
    genre: Genre? = nil,
    readingStatus: ReadingStatus? = nil
) -> [PersistentBook] {
    return books.filter{
        (!useFavorite || $0.isFavorite)
        && (
            genre == nil
            || $0.genre == genre
        )
        && (
            readingStatus == nil
            || $0.readingStatus == readingStatus
        )
    }
}
