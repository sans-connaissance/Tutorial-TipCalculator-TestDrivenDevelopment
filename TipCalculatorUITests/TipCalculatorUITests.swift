//
//  TipCalculatorUITests.swift
//  TipCalculatorUITests
//
//  Created by David Malicke on 6/8/22.
//

import XCTest

class When_Content_View_Is_Shown: XCTestCase {
    
    func test_should_make_sure_that_total_text_field_contains_default_value() {
        
        let app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
        
        let totalTextField = app.textFields["totalTextField"]
        XCTAssertEqual(totalTextField.value as! String, "Enter total")
        
    }
    
    func test_should_make_sure_the_20_percent_default_tip_option_is_selected() {
        
        let app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
        
        let picker = app.segmentedControls["selectedTipAmount"]
        let pickerButton = picker.buttons.element(boundBy: 1)
        
        XCTAssertEqual(pickerButton.label, "20%")
        XCTAssertTrue(pickerButton.isSelected)
    }
}
