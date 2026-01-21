//
//  BookDetailView.swift
//  BookManager
//
//  Created by Fai on 07/01/26.
//

import SwiftUI

struct BookDetailView: View {
    @Binding var book: Book
    @State private var showEditSheet: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HStack(alignment: .top, spacing: 20) {
                    Image(book.cover.isEmpty ? "default_cover" : book.cover)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 140, height: 200)
                        .cornerRadius(8)
                        .shadow(radius: 5)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text(book.title)
                            .font(.title.bold())
                        
                        Text(book.author)
                            .font(.title3)
                            .foregroundStyle(.secondary)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            CustomCapsule(text: book.genre.rawValue, color: .blue)
                            CustomCapsule(text: book.readingStatus.rawValue, color: .orange)
                            FavoriteToggle(isFavorite: $book.isFavorite)
                        }
                    }
                }
                
                Divider()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Synopsis")
                        .font(.headline)
                    Text(book.details)
                        .foregroundStyle(.primary)
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("My Review")
                        .font(.headline)
                    
                    HStack {
                        ForEach(0..<5) { index in
                            Image(systemName: index < book.rating ? "star.fill" : "star")
                                .foregroundColor(.yellow)
                        }
                    }
                    
//                    FavoriteToggle(isFavorite: $book.isFavorite)
                    
                    Text(book.review.isEmpty ? "No review yet." : book.review)
                        .font(.body)
                        .italic(book.review.isEmpty)
                }
            }
            .padding()
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button("Edit") { showEditSheet.toggle() }
        }
        .sheet(isPresented: $showEditSheet) {
            AddEditView(book: $book)
        }
    }
}
