//
//  BookDetailView.swift
//  BookManager
//
//  Created by Fai on 07/01/26.
//

import SwiftUI

struct BookDetailView: View {
    var book: PersistentBook
    @State private var showEditSheet: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HStack(alignment: .top, spacing: 20) {
                    if let data = book.imageData, let uiImage = UIImage(data: data) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 140, height: 200)
                            .cornerRadius(8)
                            .shadow(radius: 5)
                    } else {
                        Image(book.cover.isEmpty ? "book_icon" : book.cover)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 140, height: 200)
                            .cornerRadius(8)
                            .shadow(radius: 5)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text(book.title)
                            .font(.title.bold())
                        
                        Text(book.author)
                            .font(.title3)
                            .foregroundStyle(.secondary)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            CustomCapsule(text: book.genre.rawValue, color: .blue)
                            CustomCapsule(text: book.readingStatus.rawValue, color: .orange)

                            FavoriteToggle(isFavorite: Binding(
                                get: { book.isFavorite },
                                set: { book.isFavorite = $0 }
                            ))
                        }
                    }
                }
                
                Divider()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Synopsis")
                        .font(.headline)
                    Text(book.details.isEmpty ? "No synopsis provided." : book.details)
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
            ToolbarItem(placement: .topBarTrailing) {
                Button("Edit") {
                    showEditSheet.toggle()
                }
            }
        }
        .sheet(isPresented: $showEditSheet) {
            AddEditView(book: book)
        }
    }
}
