//
//  calcModel.swift
//  CalculatorMVC
//
//  Created by Derrick J. Hamilton on 3/15/19.
//  Copyright © 2019 Derrick J. Hamilton. All rights reserved.
//

import Foundation

class calcModel {
    var lblString: String
    var storedVal: Int
    var storedOp: String?
    var newLblSet: Bool
    
    init() {
        lblString = "0"
        storedVal = 0
        storedOp = nil
        newLblSet = false
    }
    
    func appendDigit(digit: String)->String{
        guard !newLblSet else {
            lblString = "" + digit
            newLblSet = false
            return lblString
        }
        
        if (lblString == "0") {
            lblString = digit
        } else if (digit == "." && lblString.contains(".")) {
            return lblString
        } else {
            lblString = lblString + digit
        }
        
        return lblString
    }
    
    func setOperator(op: String, val: String)->String {
        if (storedVal == 0 && storedOp == nil) {
            storedVal = Int(val)!
            storedOp = op
            newLblSet = true
        } else {
            let result = performOperation(val: val)
            storedVal = Int(result)!
            storedOp = op
            lblString = result
            newLblSet = true
        }
        
        return lblString
    }
    
    func performOperation(val: String)->String {
        switch storedOp {
        case "+":
            let computed = storedVal + Int(val)!
            lblString = "\(computed)"
            storedVal = 0
            storedOp = nil
        case "-":
            let computed = storedVal - Int(val)!
            lblString = "\(computed)"
            storedVal = 0
            storedOp = nil
        case "*":
            let computed = storedVal * Int(val)!
            lblString = "\(computed)"
            storedVal = 0
            storedOp = nil
        case "/":
            let computed = storedVal / Int(val)!
            lblString = "\(computed)"
            storedVal = 0
            storedOp = nil
        default:
            return "Error"
        }
        
        return lblString
    }
    
    func clearLabel()->String {
        lblString = "0"
        return lblString
    }
}
