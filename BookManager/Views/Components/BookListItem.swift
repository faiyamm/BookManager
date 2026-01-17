//
//  BookListItem.swift
//  BookManager
//
//  Created by Fai on 16/01/26.
//

import SwiftUI

struct BookListItem: View {
    let book: Book
    
    var body: some View {
        HStack(spacing: 15) {
            Image(book.cover.isEmpty ? "default_cover" : book.cover)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 70)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(4)
                .shadow(radius: 2)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(book.title)
                    .font(.headline)
                    .lineLimit(1)
                Text(book.author)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}
