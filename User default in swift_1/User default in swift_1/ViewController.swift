//
//  ViewController.swift
//  User default in swift_1
//
//  Created by macmini01 on 13/07/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //changing background color
        labelText.backgroundColor = UIColor.systemTeal
        textField.backgroundColor = UIColor.systemGray
        
        // fetching value from userdefault
        let value = UserDefaults.standard.string(forKey: "username")
        
        //checking nil condition
        if let value = value {
            labelText.text = "Hello, \(value)"
        }
            //set the value of text label
           

    }

    @IBAction func saveButtonPressed(_ sender: Any) {
        
        //key name is :- username, userdefault saves data in the form of dictionary(key value pair).
        UserDefaults.standard.set(textField.text ?? "", forKey: "username")
        
        let alert = UIAlertController(title: "Saving", message: "Data Saved In User Default Successfully", preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "Ok", style: .default) { action in
            print("Data has been saved!")
        }
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
        textField.text = ""
    }
    
}

