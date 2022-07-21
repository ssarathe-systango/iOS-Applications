//
//  SecondViewController.swift
//  protocolDelegateRevised
//
//  Created by macmini01 on 21/07/22.
//

import UIKit

protocol Data {
    func savingData(name: String, address: String, city: String)
}

class SecondViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    
    var delegate: Data!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func save(_ sender: Any) {
        guard let name = txtName.text,
        !name.isEmpty,
        
        let address = txtAddress.text,
        !address.isEmpty,
        
        let city = txtCity.text,
        !city.isEmpty else {
            
            alert()
            return
        }
        
        delegate.savingData(name: name, address: address, city: city)
    }
    
    @IBAction func reset(_ sender: Any) {
        reset()
    }
    
}

extension SecondViewController {
    
    func alert() {
        let alert = UIAlertController(title: "Alert!", message: "All Fields Required", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func reset() {
        let alert = UIAlertController(title: "Alert!", message: "Empty All Fields", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        
        txtName.text = nil
        txtAddress.text = nil
        txtCity.text = nil
    }
    
}


