//
//  ViewController.swift
//  Calculator
//
//  Created by macmini01 on 19/07/22.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen: Double = 0;
    var previousNumber: Double = 0;
    var performingMath = false;
    var operation = 0;
    
    //MARK: Outlet
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet var cornerStyleOfButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cornerStyleOfButtons.forEach{ $0.layer.cornerRadius = 37 }
    }
    
//  MARK: Action of numeric values

    @IBAction func numbers(_ sender: UIButton) {
        if performingMath == true {
//            print("Performing math True!")
//            o/p :- single value like:- 1 or 2 or 3 etc...
            label.text = String(sender.tag - 1)
            numberOnScreen = Double(label.text!)!
            performingMath = false
        } else {
//            print("Performing math False!")
//            o/p :- string concatinate :- 12345 or 56789
            label.text = label.text! + String(sender.tag - 1)
            numberOnScreen = Double(label.text!)!
        }
    }
    
//  MARK: Action of operations values

    @IBAction func Calculate(_ sender: UIButton) {
        if label.text != "" && sender.tag != 11 && sender.tag != 16 {
            
            previousNumber = Double(label.text!)!
            
            if sender.tag == 12 {
                label.text = "/"
            }
            else if sender.tag == 13
            {
                label.text = "x"
            }
            else if sender.tag == 14
            {
                label.text = "-"
            }
            else if sender.tag == 15
            {
                label.text = "+"
            }
            else if sender.tag == 17
            {
                label.text = nil
            }
            else if sender.tag == 18
            {
                label.text = "%"
            }
            else if sender.tag == 19
            {
                label.text = "."
            }
            
            operation = sender.tag
            performingMath = true
        }
        
        else if sender.tag == 16 {
            
            if operation == 12 {
                label.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 13 {
                label.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 14 {
                label.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 15 {
                label.text = String(previousNumber + numberOnScreen)
            }
            else if operation == 18 {
                label.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 19 {
                
            }
        }
        
        else if sender.tag == 11 {
            label.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
        }
    }
}
