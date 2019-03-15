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
    var myModel: calcModel = calcModel();
    
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
            return;
        }
        
        let newLabel: String = myModel.appendDigit(digit: btnTitle);
        outLabel.text = newLabel;
    }
    
    @IBAction func binOpBtn(_ sender: UIButton) {
    
    }
    
    @IBAction func equalsBtn(_ sender: UIButton) {
    
    }
    
    @IBAction func clearBtn(_ sender: UIButton) {
    
    }
    
}
