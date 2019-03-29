//
//  calcModel.swift
//  CalculatorMVC
//
//  Created by Derrick J. Hamilton on 3/15/19.
//  Copyright © 2019 Derrick J. Hamilton. All rights reserved.
//

import Foundation

class calcModel {
    var lblString: String;
    
    init() {
        lblString = "0";
    }
    
    func appendDigit(digit: String)->String{
        if (lblString == "0") {
            lblString = digit;
        } else if (digit == "." && lblString.contains(".")) {
            return lblString
        } else {
            lblString = lblString + digit
        }
        return lblString;
    }
    
    func clearLabel()->String {
        lblString = "0"
        return lblString
    }
}
