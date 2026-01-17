//
//  ReadingStatus.swift
//  BookManager
//
//  Created by Fai on 16/01/26.
//

import Foundation

enum ReadingStatus: String, Codable, CaseIterable {
    case wantToRead = "Want to read"
    case reading = "Reading"
    case dropped = "Dropped"
    case read = "Read"
    
    // base case
    case unknown = "Unknown"
}
