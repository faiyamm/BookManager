//
//  FavoriteCard.swift
//  BookManager
//
//  Created by Fai on 21/01/26.
//

import SwiftUI

struct FavoriteCard: View {
    let book: Book
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {

                Image(book.cover.isEmpty ? "default_cover" : book.cover)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()

                LinearGradient(
                    gradient: Gradient(colors: [.clear, .black.opacity(0.7), .black.opacity(0.9)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                
                VStack(spacing: 2) {
                    Text(book.title)
                        .font(.system(size: 14, weight: .bold))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .lineLimit(2)
                    
                    Text(book.author)
                        .font(.system(size: 10))
                        .foregroundColor(.white.opacity(0.8))
                        .lineLimit(1)
                }
                .padding(.horizontal, 8)
                .padding(.bottom, 12)
            }
        }
        .aspectRatio(0.7, contentMode: .fit)
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}
