//
//  Theme.test.swift
//  BookManager
//
//  Created by Fai on 07/02/26.
//

import Testing
@testable import BookManager
internal import SwiftUI

@MainActor @Suite("Theme tests")
struct ThemeTests {
    
    @Test("Theme inits light correctly")
    func themeInitsLightCorrectly(){
        //arrange
        let theme: Theme = .Light
        
        //act
        let colorScheme = theme.colorScheme
        
        //assert
        #expect( colorScheme == .light)
    }
    
    @Test("Theme inits dark correctly")
    func themeInitsDarkCorrectly(){
        //arrange
        let theme: Theme = .Dark
        
        //act
        let colorScheme = theme.colorScheme
        
        //assert
        #expect( colorScheme == .dark)
    }
    
    @Test("Theme inits system correctly")
    func themeInitsSystemCorrectly(){
        //arrange
        let theme: Theme = .System
        
        //act
        let colorScheme = theme.colorScheme
        
        //assert
        #expect( colorScheme == nil)
    }
    
}
