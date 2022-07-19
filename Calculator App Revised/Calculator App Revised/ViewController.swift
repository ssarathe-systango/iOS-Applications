//
//  ViewController.swift
//  Calculator App Revised
//
//  Created by macmini01 on 19/07/22.
//

import UIKit

class ViewController: UIViewController {

    var onScreenNumber: Double = 0;
    var previous: Double = 0;
    var flag = false;
    var operation = 0;
    
    //  MARK: OUTLET
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: ACTIONS
    @IBAction func numbers(_ sender: UIButton) {
        if flag == true {
            print("Flag is true!!!")
            label.text = String(sender.tag - 1)
            onScreenNumber = Double(label.text!)!
            flag = false
        }
        else {
            print("Flag is false!!!")
            label.text = label.text! + String(sender.tag - 1)
            onScreenNumber = Double(label.text!)!
        }
    }
    
    @IBAction func calculate(_ sender: UIButton) {
        if label.text != "" && sender.tag != 11 && sender.tag != 16 {
            
            previous = Double(label.text!)!
            
            if sender.tag == 12 {
                label.text = "/"
            }
            else if sender.tag == 13 {
                label.text = "x"
            }
            else if sender.tag == 14 {
                label.text = "-"
            }
            else if sender.tag == 15 {
                label.text = "+"
            }
            operation = sender.tag
            flag = true
        }
        
        else if sender.tag == 16 {
            if operation == 12 {
                let divide = String(previous / onScreenNumber)
                label.text = String(divide)
            }
            else if operation == 13 {
                label.text = String(previous * onScreenNumber)
            }
            else if operation == 14 {
                label.text = String(previous - onScreenNumber)
            }
            else if operation == 15 {
                label.text = String(previous + onScreenNumber)
            }
        }
        else if sender.tag == 11 {
            label.text = ""
            previous = 0
            onScreenNumber = 0
            operation = 0
        }
    }
}


