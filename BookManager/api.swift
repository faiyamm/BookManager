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
            review: "An absolute classic. The world-building is unmatched.",
            rating: 5,
            genre: .fantasy,
            readingStatus: .read,
            isFavorite: true
        ),
        
        Book(
            title: "The Two Towers",
            author: "J.R.R. Tolkien",
            details: "The second volume of The Lord of the Rings, chronicling the breaking of the Fellowship, the journey of Frodo and Sam toward Mordor, and the battles that shape Middle-earth's fate.",
            cover: "lotr_towers",
            year: 1954,
            series: "The Lord of the Rings",
            review: "Great pacing and incredible battle scenes.",
            rating: 4,
            genre: .fantasy,
            readingStatus: .read,
            isFavorite: false
        ),
        
        Book(
            title: "The Return of the King",
            author: "J.R.R. Tolkien",
            details: "The concluding volume of The Lord of the Rings, depicting the final struggle against Sauron, the destruction of the One Ring, and the crowning of the true king.",
            cover: "lotr_king",
            year: 1954,
            series: "The Lord of the Rings",
            review: "A perfect conclusion to the greatest fantasy epic of all time.",
            rating: 5,
            genre: .fantasy,
            readingStatus: .read,
            isFavorite: false
        ),
        
        Book(
            title: "Dune",
            author: "Frank Herbert",
            details: "Set on the desert planet Arrakis, Dune is the story of the boy Paul Atreides, heir to a noble family tasked with ruling an inhospitable world where the only thing of value is the 'spice' melange.",
            cover: "dune",
            year: 1965,
            series: "Dune",
            review: "A masterpiece of science fiction. The political intrigue and ecological themes are still incredibly relevant today.",
            rating: 5,
            genre: .scienceFiction,
            readingStatus: .reading,
            isFavorite: true
        ),
        
        Book(
            title: "Harry Potter and the Philosopher's Stone",
            author: "J.K. Rowling",
            details: "Harry Potter has never even heard of Hogwarts when the letters start dropping on the doormat at number four, Privet Drive. Then, on Harry's eleventh birthday, a giant of a man called Rubeus Hagrid bursts in with some astonishing news.",
            cover: "harrypotter",
            year: 1997,
            series: "Harry Potter",
            review: "The book that started it all. Magical, charming, and impossible to put down.",
            rating: 4,
            genre: .fantasy,
            readingStatus: .read,
            isFavorite: false
        )
    ]
}
