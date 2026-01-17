//
//  CustomCapsule.swift
//  BookManager
//
//  Created by Fai on 16/01/26.
//

import SwiftUI

struct CustomCapsule: View {
    let text: String
    var color: Color = .accentColor
    
    var body: some View {
        Text(text)
            .font(.caption2)
            .fontWeight(.bold)
            .foregroundStyle(color)
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .background(color.opacity(0.12))
            .clipShape(Capsule())
    }
}
