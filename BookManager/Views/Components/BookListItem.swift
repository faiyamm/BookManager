//
//  BookListItem.swift
//  BookManager
//
//  Created by Fai on 16/01/26.
//

import SwiftUI

struct BookListItem: View {
    let book: PersistentBook
    
    var body: some View {
        HStack(spacing: 15) {
            if let data = book.cover, let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 70)
                    .cornerRadius(4)
            } else {
                Image(systemName: "book.closed.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 70)
                    .foregroundStyle(.secondary)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(4)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(book.title)
                    .font(.headline)
                    .lineLimit(1)
                StarRatingView(rating: book.rating)
                    .font(.footnote)
            }
        }
        .padding(.vertical, 4)
    }
}
