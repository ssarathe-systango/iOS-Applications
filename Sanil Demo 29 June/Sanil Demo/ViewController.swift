//
//  ViewController.swift
//  Sanil Demo
//
//  Created by macmini37 on 27/06/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("1", #function, #line)
    }

    override func viewWillAppear(_ animated: Bool) {
        print("2", #function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("3", #function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("4", #function)
    }

}

extension ViewController {
    
}
