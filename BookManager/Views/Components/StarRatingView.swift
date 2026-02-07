//
//  StarRatingView.swift
//  BookManager
//
//  Created by Fai on 16/01/26.
//

import SwiftUI

struct StarRatingView: View {
    var rating: Int
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(1...5, id: \.self) { star in
                Image(systemName: star <= self.rating ? "star.fill" : "star")
                    .foregroundColor(.yellow)
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Star rating: \(self.rating)/5")
    }
}
