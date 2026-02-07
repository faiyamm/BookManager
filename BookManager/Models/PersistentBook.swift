//
//  PersistentBook.swift
//  BookManager
//
//  Created by Fai on 06/02/26.
//

import Foundation
import SwiftData

@Model
class PersistentBook {
    var id: UUID = UUID()
    var title: String
    var author: String
    var details: String
    var genre: Genre
    var readingStatus: ReadingStatus
    var rating: Int
    var review: String
    var isFavorite: Bool
    var cover: String
    var imageData: Data?

    init(title: String = "", author: String = "", details: String = "", genre: Genre = .fantasy, readingStatus: ReadingStatus = .read, rating: Int = 0, review: String = "", isFavorite: Bool = false, cover: String = "", imageData: Data? = nil) {
        self.title = title
        self.author = author
        self.details = details
        self.genre = genre
        self.readingStatus = readingStatus
        self.rating = rating
        self.review = review
        self.isFavorite = isFavorite
        self.cover = cover
        self.imageData = imageData
    }
}
