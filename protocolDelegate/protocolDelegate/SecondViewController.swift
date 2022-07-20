//
//  SecondViewController.swift
//  protocolDelegate
//
//  Created by macmini01 on 20/07/22.
//

import UIKit
protocol DataPass {
    func dataPassing(name: String, address: String, city: String)
}

class SecondViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    
    // create delegate of protocol
    var delegate: DataPass!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        
        delegate.dataPassing(name: txtName.text ?? "", address: txtAddress.text ?? "", city: txtCity.text ?? "")
        
        txtName.text = ""
        txtAddress.text = ""
        txtCity.text = ""
    }
}
