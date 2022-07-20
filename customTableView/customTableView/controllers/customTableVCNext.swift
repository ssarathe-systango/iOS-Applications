//
//  customTableVCNext.swift
//  customTableView
//
//  Created by macmini01 on 04/07/22.
//

import UIKit
class customTableVCNext: UIViewController {

    // object created of CustomTableVC
    weak var obj: CustomTableVC?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Second VC"
    }
    
    
    @IBAction func buttonAction(_ sender: Any) {
        obj?.title = "Title Changed"
    }
    
    
}
