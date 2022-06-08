//
//  TipCalculatorUITests.swift
//  TipCalculatorUITests
//
//  Created by David Malicke on 6/8/22.
//

import XCTest

class When_Content_View_Is_Shown: XCTestCase {
    
    private var app: XCUIApplication!
    private var contentViewPage: ContentViewPage!
    
    //run for each app
    override func setUp() {
        app = XCUIApplication()
        contentViewPage = ContentViewPage(app: app)
        continueAfterFailure = false
        app.launch()
    }
    
    func test_should_make_sure_that_total_text_field_contains_default_value() {

        XCTAssertEqual(contentViewPage.totalTextField.value as! String, "Enter total")
        
    }
    
    func test_should_make_sure_the_20_percent_default_tip_option_is_selected() {
        
        
       // let picker = app.segmentedControls["selectedTipAmount"]
        let pickerButton = contentViewPage.picker.buttons.element(boundBy: 1)
        
        XCTAssertEqual(pickerButton.label, "20%")
        XCTAssertTrue(pickerButton.isSelected)
    }
    
    override func tearDown() {
        //delete test files here if something is saved.
        //clean up
    }
    
}

class when_calculate_tip_button_is_pressed_for_valid_input: XCTestCase {
    
    private var app: XCUIApplication!
    private var contentViewPage: ContentViewPage!
    
    override func setUp() {
        app = XCUIApplication()
        contentViewPage = ContentViewPage(app: app)
        continueAfterFailure = false
        app.launch()
        
        //add value to field
        //let totalTextField = app.textFields["totalTextField"]
        contentViewPage.totalTextField.tap()
        contentViewPage.totalTextField.typeText("100")
        
        //tap tip button
       // let tipButton = app.buttons["tipButton"]
        contentViewPage.tipButton.tap()
    }
    
    func test_should_make_sure_that_tip_is_displayed_on_the_screen() {
        
      //  let tipText = app.staticTexts["tipText"]
        let _ = contentViewPage.tipText.waitForExistence(timeout: 0.5)
        XCTAssertEqual(contentViewPage.tipText.label, "$20.00")
    }
}

class when_calculate_tip_button_is_pressed_for_invalid_input: XCTestCase {
    private var app: XCUIApplication!
    private var contentViewPage: ContentViewPage!
    
    override func setUp() {
        app = XCUIApplication()
        contentViewPage = ContentViewPage(app: app)
        continueAfterFailure = false
        app.launch()
        
        //add value to field
        //let totalTextField = app.textFields["totalTextField"]
        contentViewPage.totalTextField.tap()
        contentViewPage.totalTextField.typeText("-100")
        
        //tap tip button
       // let tipButton = app.buttons["tipButton"]
        contentViewPage.tipButton.tap()
        
    }
    
    func test_should_clear_tip_label_for_invalid_input() {
        
        //let tipText = app.staticTexts["tipText"]
        let _ = contentViewPage.tipText.waitForExistence(timeout: 0.5)
        XCTAssertEqual(contentViewPage.tipText.label, "")
    }
    
    func test_should_display_error_message_for_invalid_input() {
        
       // let messageText = app.staticTexts["messageText"]
        let _ = contentViewPage.messageText.waitForExistence(timeout: 0.5)
        XCTAssertEqual(contentViewPage.messageText.label, "Invalid Input")
    }
    
}
