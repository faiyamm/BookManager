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
                    Image(book.cover)
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
            Button { showEditSheet.toggle() } label: {
                Text("Edit")
            }
        }
        .sheet(isPresented: $showEditSheet) {
            AddEditView(book: $book)
        }
    }
}

#Preview {
    BookDetailView(book: .constant(Book(
        title: "Cras vehicula et leo non fermentum.",
        author: "Author Name",
        details: "Sed rutrum porta massa. Ut sed lorem elementum, aliquam lectus quis, aliquet velit. Cras libero sem, fermentum sed feugiat sit amet, euismod gravida libero. Aenean cursus egestas nunc et placerat. Mauris maximus dui lectus, vitae rutrum metus fringilla et. Sed mollis, nibh non iaculis fringilla, turpis dolor varius tortor, ac ullamcorper dolor justo sed arcu. Vivamus in dui pulvinar, pellentesque mi non, posuere nisl. Cras id orci ex. Integer neque nunc, condimentum eu tristique eget, dapibus quis mauris. Phasellus nec quam non est euismod laoreet non sed lorem.",
        cover: "lotr_fellowship",
        year: 2018,
        series: "LOTR",
        review: "Praesent a sem a neque pretium fermentum. Nullam facilisis tincidunt tortor, a bibendum odio maximus vel. In hac habitasse platea dictumst. Curabitur in tempor lacus, at dignissim massa.",
        rating: 3
    )))
}
