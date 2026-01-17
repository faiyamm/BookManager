//
//  ContentView.swift
//  BookManager
//
//  Created by Fai on 07/01/26.
//

import SwiftUI

struct ContentView: View {
    var books = [
        Book(
            title: "The Fellowship of the Ring",
            author: "J.R.R. Tolkien",
            details: "The first volume of The Lord of the Rings, following Frodo Baggins as he sets out with the Fellowship to destroy the One Ring and thwart Sauron's rise.",
            cover: "lotr_fellowship",
            year: 1954,
            series: "LOTR"
        ),
        Book(
            title: "The Two Towers",
            author: "J.R.R. Tolkien",
            details: "The second volume of The Lord of the Rings, chronicling the breaking of the Fellowship, the journey of Frodo and Sam toward Mordor, and the battles that shape Middle-earth's fate.",
            cover: "lotr_towers",
            year: 1954,
            series: "LOTR"
        ),
        Book(
            title: "The Return of the King",
            author: "J.R.R. Tolkien",
            details: "The concluding volume of The Lord of the Rings, depicting the final struggle against Sauron, the destruction of the One Ring, and the crowning of the true king.",
            cover: "lotr_king",
            year: 1954,
            series: "LOTR"
        )
    ]
    
    var body: some View {
        NavigationStack {
            List(books, id: \.self) { book in
                NavigationLink(destination: BookDetailView(bookInDetailView: book)) {
                    HStack {
                        Image(book.cover)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 60, maxHeight: 60)
                            
                        Text(book.title)
                    }
                }
            }
            .navigationTitle("Book Manager")
        }
    }
}

#Preview {
    ContentView()
}
