//
//  ViewController.swift
//  democore
//
//  Created by macmini01 on 01/07/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonSaveClick(_ sender: Any) {
        let dict = ["name": txtName.text, "address": txtAddress.text, "city": txtCity.text, "Mobile": txtCity.text]
        DatabaseHelper.shareInstance.save(object: dict as! [String : String])
    }
}

