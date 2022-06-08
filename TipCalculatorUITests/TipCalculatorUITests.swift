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
