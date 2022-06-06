//
//  TipCalculator.swift
//  TipCalculator
//
//  Created by David Malicke on 6/6/22.
//

import Foundation

enum TipCalculatorError: Error {
    case invalidInput
}

class TipCalculator {
    
    func calculate(total: Double, tipPercentage: Double) throws -> Double {
       
        
        if total < 0 {
            throw TipCalculatorError.invalidInput
        }
        
        let tip = total * tipPercentage
        return tip
        
    }
    
}

