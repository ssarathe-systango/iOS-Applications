//
//  SecondVC.swift
//  ChangeTitleUsingReference
//
//  Created by macmini01 on 18/07/22.
//

import UIKit

class SecondVC: UIViewController {
    
    weak var obj: FirstVC?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Second VC"
    }
    
    @IBAction func changeAction(_ sender: Any) {
        obj?.title = "New Title!!!"
    }
}
