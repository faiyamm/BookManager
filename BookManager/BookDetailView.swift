//
//  BookDetailView.swift
//  BookManager
//
//  Created by Fai on 07/01/26.
//

import SwiftUI

struct BookDetailView: View {
    var bookInDetailView: Book
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HStack(alignment: .top) {
                    Image(bookInDetailView.cover)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 200)
                        .cornerRadius(20)
                        .shadow(radius: 5)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(bookInDetailView.title)
                            .font(.largeTitle)
                        
                        Text(bookInDetailView.author)
                            .font(.headline)
                            .foregroundStyle(.secondary)
                        
                        Text("Series: \(bookInDetailView.series)")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        
                        Text("Published in: \(bookInDetailView.year)")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
                Text(bookInDetailView.details)
            }
            .padding()
        }
    }
}

#Preview {
    BookDetailView(bookInDetailView: Book(
        title: "Cras vehicula et leo non fermentum.",
        author: "Author Name",
        details: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vitae sem viverra ipsum efficitur elementum. Nullam non dui enim. Cras purus diam, rutrum lacinia iaculis sit amet, posuere et lectus. Sed id risus massa. Pellentesque imperdiet elementum gravida. In varius condimentum diam eu venenatis. Phasellus id scelerisque diam. Proin pharetra, purus in consequat hendrerit, quam diam ultrices massa, sit amet iaculis arcu mauris non ante. Vivamus iaculis justo lacus, at laoreet nisl lobortis in. Nam sem lectus, aliquam at odio aliquet, dapibus porttitor odio.",
        cover: "lotr_fellowship",
        year: 2018,
        series: "LOTR"
    ))
}
