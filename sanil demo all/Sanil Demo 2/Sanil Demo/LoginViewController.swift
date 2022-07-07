//
//  LoginViewController.swift
//  Sanil Demo
//
//  Created by macmini37 on 27/06/22.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginAction(_ sender: UIButton) {
        let homeVc = storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        self.present(homeVc, animated: true, completion: nil)
    }
}
