//
//  Genre.swift
//  BookManager
//
//  Created by Fai on 16/01/26.
//

import Foundation

enum Genre: String, CaseIterable, Codable {
    case classic = "Classic"
    case fantasy = "Fantasy"
    case horror = "Horror"
    case mystery = "Mystery"
    case romance = "Romance"
    case scienceFiction = "Science Fiction"
    
    // base case
    case unknown = "Unknown"
}
