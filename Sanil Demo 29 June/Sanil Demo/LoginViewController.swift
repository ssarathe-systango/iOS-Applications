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
//        jumpWithOutNavigation()
        if validateTF() {
            jumpWithNavigation()
        }
    }
}



extension LoginViewController {
    func jumpWithNavigation() {
        let homeVc = storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        navigationController?.pushViewController(homeVc, animated: true)
    }

    func jumpWithOutNavigation() {
        let homeVc = storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
//        homeVc.modalPresentationStyle = .fullScreen
        present(homeVc, animated: true, completion: nil)
    }
    
    func validateTF() -> Bool {
        guard let email = emailTF.text, !email.isEmpty else { return false}
        
        guard let password = passwordTF.text, !password.isEmpty else { return false}
        
        return true
    }
}
