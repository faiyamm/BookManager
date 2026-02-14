//
//  AddEditView.uitest.swift
//  BookManager
//
//  Created by Fai on 13/02/26.
//

import XCTest

class AddEditView_UITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testAddBookWorks() throws {
        let app = XCUIApplication()
        app.launch()
        _ = app.collectionViews.firstMatch.waitForExistence(timeout: 3)

        let beforeAddingBookCount = app.collectionViews.firstMatch.cells.count
        let addButton = app.buttons["Add Book"]
        addButton.tap()
        let saveButton = app.buttons["Save"]

        //Check if the save button is disabled
        XCTAssertTrue(!saveButton.isEnabled)

        let titleTextField = app.textFields["Title of the book"]
        let newTitle = "New Book \(beforeAddingBookCount+1)"
        titleTextField.tap()
        titleTextField.typeText(newTitle)
        saveButton.tap()

        // Wait for the new book to appear in the list by its title
        let newBookCell = app.staticTexts[newTitle]
        XCTAssertTrue(newBookCell.waitForExistence(timeout: 5), "The new book should appear in the list")
    }
}
