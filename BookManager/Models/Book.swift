//
//  Book.swift
//  BookManager
//
//  Created by Fai on 07/01/26.
//

import Foundation

struct Book: Hashable, Identifiable {
    let id: UUID = UUID()
    
    var title: String
    var author: String
    var details: String
    var cover: String
    
    // extra challenge class 1
    var year: Int
    var series: String
}
