//
//  ViewController.swift
//  Action and Outlets
//
//  Created by macmini01 on 28/06/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var basicLabel: UILabel!
    
    
    @IBAction func changeLabel(_ sender: Any) {
            basicLabel.text = "Exciting new value"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

