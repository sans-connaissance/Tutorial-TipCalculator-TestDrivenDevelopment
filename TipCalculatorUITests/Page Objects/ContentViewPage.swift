//
//  ContentViewPage.swift
//  TipCalculatorUITests
//
//  Created by David Malicke on 6/8/22.
//

import Foundation
import XCTest

class ContentViewPage {
    
    var app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    var totalTextField: XCUIElement {
        app.textFields["totalTextField"]
    }
    
    var tipButton: XCUIElement {
        app.buttons["tipButton"]
    }
    
    var tipText: XCUIElement {
        app.staticTexts["tipText"]
    }
    
    var messageText: XCUIElement {
        app.staticTexts["messageText"]
    }
    
    var picker: XCUIElement {
        app.segmentedControls["selectedTipAmount"]
    }
    
}
