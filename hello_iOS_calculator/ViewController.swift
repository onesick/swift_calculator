//
//  ViewController.swift
//  hello_iOS_calculator
//
//  Created by Wonsik Jeong on 1/31/16.
//  Copyright © 2016 Wonsik Jeong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var calc_label: UILabel!
    var values: [String] = []
    
    @IBAction func calculate(sender: UIButton) {
        if let text = sender.titleForState(UIControlState.Normal){
            calc_label.text = text
            values.append(text)
            if values.count == 3{
                if let firstValue = values.first, firstNumber = Double(firstValue),
                    lastValue = values.last, lastNumber = Double(lastValue) {
                        let op = values[1]
                        performOperation(firstNumber, lastNumber: lastNumber, op: op)
                        clear()
                }
            } else if values.count > 3 {
                clear()
            }
        }

        
    }
    
//    mathmatic operations
    func performOperation(firstNumber: Double, lastNumber: Double, op: String) {
        switch op {
        case "+":
            let result = firstNumber + lastNumber
            calc_label.text = String(result)
        case "-":
            let result = firstNumber - lastNumber
            calc_label.text = String(result)
        case "X":
            let result = firstNumber * lastNumber
            calc_label.text = String(result)
        case "/":
            let result = firstNumber / lastNumber
            calc_label.text = String(result)
        default:
            break;
        }
    }
    
    //        clears the numbers entered previously after the math is performed
    func clear() {
        values.removeAll()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        calc_label.text = "Hello, World!"
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

