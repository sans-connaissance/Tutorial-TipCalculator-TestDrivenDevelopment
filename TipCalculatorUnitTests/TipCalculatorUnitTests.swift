//
//  TipCalculatorUnitTests.swift
//  TipCalculatorUnitTests
//
//  Created by David Malicke on 6/6/22.
//

import XCTest

class When_Calculating_Tip_Based_On_Total_Amount: XCTestCase {

    func test_should_calculate_tip_successfully() {
        let tipCalculator = TipCalculator()
        let tip = try! tipCalculator.calculate(total:100, tipPercentage: 0.1)
        XCTAssertEqual(10, tip)
    }

}

class When_Calculating_Tip_Based_On_Negative_Total_Amount: XCTestCase {
 
    func test_should_throw_invalid_input_exception() {
        let tipCalculator = TipCalculator()
        
        XCTAssertThrowsError(try tipCalculator.calculate(total: -100, tipPercentage: 0.1), "") { error in
            XCTAssertEqual(error as! TipCalculatorError, TipCalculatorError.invalidInput)
            
        }
    }
    
}
