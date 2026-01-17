//
//  api.swift
//  BookManager
//
//  Created by Fai on 16/01/26.
//

import Foundation

func getBooks() -> [Book] {
    return [
        Book(
            title: "The Fellowship of the Ring",
            author: "J.R.R. Tolkien",
            details: "The first volume of The Lord of the Rings, following Frodo Baggins as he sets out with the Fellowship to destroy the One Ring and thwart Sauron's rise.",
            cover: "lotr_fellowship",
            year: 1954,
            series: "The Lord of the Rings",
            review: "Sed id facilisis elit, vitae fringilla leo. Nam ultrices est ac sapien pretium, in lacinia elit iaculis. Cras sed iaculis eros. Curabitur maximus felis turpis, tempor tincidunt ante dapibus vel. Suspendisse commodo condimentum quam, eu fringilla lectus dictum non. Mauris felis magna, aliquet eget luctus quis, posuere sit amet nulla.",
            rating: 5,
            genre: .fantasy,
            readingStatus: .read
        ),
        
        Book(
            title: "The Two Towers",
            author: "J.R.R. Tolkien",
            details: "The second volume of The Lord of the Rings, chronicling the breaking of the Fellowship, the journey of Frodo and Sam toward Mordor, and the battles that shape Middle-earth's fate.",
            cover: "lotr_towers",
            year: 1954,
            series: "The Lord of the Rings",
            review: "Sed id facilisis elit, vitae fringilla leo. Nam ultrices est ac sapien pretium, in lacinia elit iaculis. Cras sed iaculis eros. Curabitur maximus felis turpis, tempor tincidunt ante dapibus vel. Suspendisse commodo condimentum quam, eu fringilla lectus dictum non. Mauris felis magna, aliquet eget luctus quis, posuere sit amet nulla.",
            rating: 4,
            genre: .fantasy,
            readingStatus: .read
        ),
        
        Book(
            title: "The Return of the King",
            author: "J.R.R. Tolkien",
            details: "The concluding volume of The Lord of the Rings, depicting the final struggle against Sauron, the destruction of the One Ring, and the crowning of the true king.",
            cover: "lotr_king",
            year: 1954,
            series: "The Lord of the Rings",
            review: "Sed id facilisis elit, vitae fringilla leo. Nam ultrices est ac sapien pretium, in lacinia elit iaculis. Cras sed iaculis eros. Curabitur maximus felis turpis, tempor tincidunt ante dapibus vel. Suspendisse commodo condimentum quam, eu fringilla lectus dictum non. Mauris felis magna, aliquet eget luctus quis, posuere sit amet nulla.",
            rating: 1,
            genre: .fantasy,
            readingStatus: .read
        ),
    ]
}
