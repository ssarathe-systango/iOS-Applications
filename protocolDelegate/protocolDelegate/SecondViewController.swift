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

    //MARK: Outlets
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    
    // create delegate of protocol
    var delegate: DataPass!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: Action
    @IBAction func saveBtn(_ sender: Any) {
        
        if txtName.text == "" {
            alert()
        }
        else if txtAddress.text == "" {
            alert()
        }
        else if txtCity.text == "" {
            alert()
        }
        else {
            delegate.dataPassing(name: txtName.text ?? "", address: txtAddress.text ?? "", city: txtCity.text ?? "")
        }
        txtName.text = ""
        txtAddress.text = ""
        txtCity.text = ""
    }
    
    //MARK: Alert
    func alert() {
        let alert = UIAlertController(title: "Alert!", message: "Enter all values", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}
