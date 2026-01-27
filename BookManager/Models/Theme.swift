//
//  Theme.swift
//  BookManager
//
//  Created by Fai on 26/01/26.
//

import Foundation
import SwiftUI

enum Theme: String, CaseIterable {
    case Light
    case Dark
    case System
    
    var colorScheme: ColorScheme? {
        switch self {
        case .Light:
            return ColorScheme.light
        case .Dark:
            return ColorScheme.dark
        case .System:
            return nil
        }
    }
}
