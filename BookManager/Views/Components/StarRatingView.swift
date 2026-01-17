//
//  StarRatingView.swift
//  BookManager
//
//  Created by Fai on 16/01/26.
//

import SwiftUI

struct StarRatingView: View {
    @Binding var rating: Int
    
    var body: some View {
        HStack {
            ForEach(1...5, id: \.self) { star in
                Button(action: {
                    self.rating = star
                }) {
                    Image(systemName: star <= self.rating ? "star.fill" : "star")
                        .foregroundColor(Color.yellow)
                }.buttonStyle(.plain)
            }
        }
    }
}
