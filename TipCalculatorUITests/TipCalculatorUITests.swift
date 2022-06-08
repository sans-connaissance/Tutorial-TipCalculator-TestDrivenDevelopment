//
//  TipCalculatorUITests.swift
//  TipCalculatorUITests
//
//  Created by David Malicke on 6/8/22.
//

import XCTest

class When_Content_View_Is_Shown: XCTestCase {
    
    private var app: XCUIApplication!
    
    //run for each app
    override func setUp() {
        app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
    }
    
    func test_should_make_sure_that_total_text_field_contains_default_value() {
        
        let totalTextField = app.textFields["totalTextField"]
        XCTAssertEqual(totalTextField.value as! String, "Enter total")
        
    }
    
    func test_should_make_sure_the_20_percent_default_tip_option_is_selected() {
        
        
        let picker = app.segmentedControls["selectedTipAmount"]
        let pickerButton = picker.buttons.element(boundBy: 1)
        
        XCTAssertEqual(pickerButton.label, "20%")
        XCTAssertTrue(pickerButton.isSelected)
    }
    
    override func tearDown() {
        //delete test files here if something is saved.
        //clean up
    }
    
}

class when_calculate_tip_button_is_pressed: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUp() {
        app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
    }
    
    func test_should_make_sure_that_tip_is_displayed_on_the_screen() {
        
        //add value to field
        let totalTextField = app.textFields["totalTextField"]
        totalTextField.tap()
        totalTextField.typeText("100")
        
        //tap tip button
        let tipButton = app.buttons["tipButton"]
        tipButton.tap()
        
        let tipText = app.staticTexts["tipText"]
        let _ = tipText.waitForExistence(timeout: 0.5)
        XCTAssertEqual(tipText.label, "$20.00")
    }
    
    func test_should_clear_tip_label_for_invalid_input() {
        
        //add value to field
        let totalTextField = app.textFields["totalTextField"]
        totalTextField.tap()
        totalTextField.typeText("-100")
        
        //tap tip button
        let tipButton = app.buttons["tipButton"]
        tipButton.tap()
        
        let tipText = app.staticTexts["tipText"]
        let _ = tipText.waitForExistence(timeout: 0.5)
        XCTAssertEqual(tipText.label, "")
    }
    
    func test_should_display_error_message_for_invalid_input() {
        
        //add value to field
        let totalTextField = app.textFields["totalTextField"]
        totalTextField.tap()
        totalTextField.typeText("-100")
        
        //tap tip button
        let tipButton = app.buttons["tipButton"]
        tipButton.tap()
        
        let messageText = app.staticTexts["messageText"]
        let _ = messageText.waitForExistence(timeout: 0.5)
        XCTAssertEqual(messageText.label, "Invalid Input")
    }
    
}
