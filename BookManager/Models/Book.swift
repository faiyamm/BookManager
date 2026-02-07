//
//  Book.swift
//  BookManager
//
//  Created by Fai on 07/01/26.
//

import Foundation

struct Book: Hashable, Identifiable, Codable {
    var id: UUID = UUID()
    var title: String
    var author: String = ""
    var details: String = ""
    var cover: String = ""
    
    var review: String = ""
    var rating: Int = 0
    
    var genre: Genre = .unknown
    var readingStatus: ReadingStatus = .unknown
    
    var isFavorite: Bool = false
}
