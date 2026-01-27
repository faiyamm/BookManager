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
    
    @State private var tempSelectedGenre: Genre? = nil
    @State private var tempSelectedReadingStatus: ReadingStatus? = nil
    @Environment(\.dismiss) private var dismiss

    init(selectedGenre: Binding<Genre?>, selectedReadingStatus: Binding<ReadingStatus?>) {
        self._selectedGenre = selectedGenre
        self._selectedReadingStatus = selectedReadingStatus
        // initializing the temp states with the current values so the
        // pickers show what is already selected when the sheet opens.
        self._tempSelectedGenre = State(initialValue: selectedGenre.wrappedValue)
        self._tempSelectedReadingStatus = State(initialValue: selectedReadingStatus.wrappedValue)
    }

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Filter Preferences")) {
                    Picker("Genre", selection: $tempSelectedGenre) {
                        Text("All Genres").tag(nil as Genre?)
                        ForEach(Genre.allCases, id: \.self) { genre in
                            if genre != .unknown {
                                Text(genre.rawValue).tag(genre as Genre?)
                            }
                        }
                    }
                    
                    Picker("Status", selection: $tempSelectedReadingStatus) {
                        Text("All Statuses").tag(nil as ReadingStatus?)
                        ForEach(ReadingStatus.allCases, id: \.self) { status in
                            if status != .unknown {
                                Text(status.rawValue).tag(status as ReadingStatus?)
                            }
                        }
                    }
                }
                
                Section {
                    Button("Clear All", role: .destructive) {
                        tempSelectedGenre = nil
                        tempSelectedReadingStatus = nil
                    }
                }
            }
            .navigationTitle("Filters")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Apply") {
                        selectedGenre = tempSelectedGenre
                        selectedReadingStatus = tempSelectedReadingStatus
                        dismiss()
                    }
                }
            }
        }
    }
}
