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
    var tempVal: Int
    var tempOp: String?
    
    init() {
        lblString = "0"
        storedVal = 0
        storedOp = nil
        newLblSet = false
        tempVal = 0
        tempOp = nil
    }
    
    func appendDigit(digit: String)->String{
        guard !newLblSet else {
            lblString = "" + digit
            tempVal = 0
            tempOp = nil
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
        // Prevent divide by zero errors
        guard !(storedOp == "/" && val == "0") else {
            // Reset all values
            lblString = "0"
            storedOp = nil
            storedVal = 0
            tempOp = nil
            tempVal = 0
            newLblSet = false
            return "Error: Divide by zero"
        }
        
        // Perform operation on consecutive equals presses
        guard storedOp != nil else {
            newLblSet = true
            switch tempOp {
            case "+":
                let computed = Int(lblString)! &+ tempVal
                lblString = "\(computed)"
            case "-":
                let computed = Int(lblString)! &- tempVal
                lblString = "\(computed)"
            case "*":
                let computed = Int(lblString)! &* tempVal
                lblString = "\(computed)"
            case "/":
                let computed = Int(lblString)! / tempVal
                lblString = "\(computed)"
            default:
                return lblString
            }
            return lblString
        }
        
        // Set the temp value for consecutive equals presses
        tempVal = Int(val)!
        tempOp = storedOp
        
        // Perform the operation
        switch storedOp {
        case "+":
            let computed = storedVal &+ Int(val)!
            lblString = "\(computed)"
            storedVal = 0
            storedOp = nil
        case "-":
            let computed = storedVal &- Int(val)!
            lblString = "\(computed)"
            storedVal = 0
            storedOp = nil
        case "*":
            let computed = storedVal &* Int(val)!
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
