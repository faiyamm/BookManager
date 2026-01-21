//
//  FavoriteToggle.swift
//  BookManager
//
//  Created by Fai on 17/01/26.
//

import SwiftUI

import SwiftUI

struct FavoriteToggle: View {
    @Binding var isFavorite: Bool
    
    @State private var scale: CGFloat = 1
    @State private var opacity: CGFloat = 0
    @State private var offsetY: CGFloat = 0
    
    var body: some View {
        ZStack {
            Image(systemName: "heart.fill")
                .foregroundColor(.red)
                .font(.largeTitle)
                .opacity(opacity)
                .scaleEffect(scale)
                .offset(y: offsetY)
            
            Toggle(isOn: $isFavorite) {
                Label(isFavorite ? "Remove from Favorites" : "Add to Favorites",
                      systemImage: isFavorite ? "heart.fill" : "heart")
                    .foregroundColor(isFavorite ? .red : .gray)
            }
            .toggleStyle(.button)
            .buttonStyle(.plain)
            .onChange(of: isFavorite) { _, newValue in
                guard newValue == true else { return }

                withAnimation(.spring(response: 0.3, dampingFraction: 0.5)) {
                    opacity = 1
                    scale = 1.5
                }
                
                withAnimation(.easeOut(duration: 0.6).delay(0.2)) {
                    offsetY = -100
                    opacity = 0
                    scale = 0.5
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                    offsetY = 0
                    scale = 1
                }
            }
        }
    }
}
