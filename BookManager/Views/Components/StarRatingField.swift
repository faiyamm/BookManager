//
//  StarRatingField.swift
//  BookManager
//
//  Created by Fai on 06/02/26.
//

import SwiftUI

struct StarRatingField: View {
    @Binding var rating: Int
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(1...5, id: \.self) { star in
                Button(action: {
                    rating = star
                }) {
                    Image(systemName: star <= rating ? "star.fill" : "star")
                        .font(.title3)
                        .foregroundColor(.yellow)
                }
                .buttonStyle(.plain)
            }
        }
    }
}
