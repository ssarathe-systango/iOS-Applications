//
//  SecondViewController.swift
//  protocolDelegate
//
//  Created by macmini01 on 20/07/22.
//

import UIKit

protocol DataPass: AnyObject {
    func dataPassing(name: String, address: String, city: String)
}

class SecondViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    
    // create delegate of protocol
    weak var delegate: DataPass!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: Action
    @IBAction func saveBtn(_ sender: Any) {
        
        guard let name = txtName.text,
              !name.isEmpty,
              let address = txtAddress.text,
              !address.isEmpty,
              let city = txtCity.text,
              !city.isEmpty else {
                  alert()
                  return
              }
        
        delegate.dataPassing(name: name, address: address, city: city)
        txtName.text = nil // Do this instead of using this txtName.text = ""
        txtAddress.text = nil
        txtCity.text = nil
    }
    
    //MARK: Alert
    func alert() {
        let alert = UIAlertController(title: "Alert!", message: "Enter all values", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}
