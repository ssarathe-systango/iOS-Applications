//
//  ViewController.swift
//  UIVIEWXIB
//
//  Created by macmini01 on 12/07/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var newView: TestView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newView.titleLbl.text = "Festival HUB"
    }
}

