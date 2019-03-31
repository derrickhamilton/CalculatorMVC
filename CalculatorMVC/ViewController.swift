//
//  ViewController.swift
//  CalculatorMVC
//
//  Created by Derrick J. Hamilton on 3/11/19.
//  Copyright © 2019 Derrick J. Hamilton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var outLabel: UILabel!
    var myModel: calcModel = calcModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func digitBtn(_ sender: UIButton) {
        guard let btnTitle = sender.currentTitle else {
            return
        }
        
        let newLabel: String = myModel.appendDigit(digit: btnTitle)
        outLabel.text = newLabel
    }
    
    @IBAction func binOpBtn(_ sender: UIButton) {
        guard let btnOperator = sender.currentTitle else {
            return
        }
        
        guard let currValue = outLabel.text else {
            return
        }
        
        let newLabel: String = myModel.setOperator(op: btnOperator, val: currValue)
        outLabel.text = newLabel
    }
    
    @IBAction func equalsBtn(_ sender: UIButton) {
        guard let currValue = outLabel.text else {
            return
        }
        let newLabel: String = myModel.performOperation(val: currValue)
        outLabel.text = newLabel
    }
    
    @IBAction func negateBtn(_ sender: UIButton) {
        guard let currValue = outLabel.text else {
            return
        }
        let newLabel: String = myModel.negateVal(val: currValue)
        outLabel.text = newLabel
    }
    
    @IBAction func percentBtn(_ sender: UIButton) {
        guard let currValue = outLabel.text else {
            return
        }
        let newLabel: String = myModel.percent(val: currValue)
        outLabel.text = newLabel
    }
    
    @IBAction func clearBtn(_ sender: UIButton) {
        let newLabel: String = myModel.clearLabel()
        outLabel.text = newLabel
    }
    
}
