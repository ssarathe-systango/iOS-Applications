//
//  LoginVC.swift
//  BasicLoginPage
//
//  Created by macmini01 on 28/06/22.
//

import UIKit
class LoginVC: UIViewController {
    
    //objects
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func LoginAction(_ sender: Any) {
        if validateTF() {
//            jumpWithOutNavigation()
            jumpWithNavigation()
        }
        
    }
}
extension LoginVC {
    func jumpWithNavigation() {
        //create object homeVc
        let homeVc = storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
            
        //push homeVc object
        navigationController?.pushViewController(homeVc, animated: true)
    }
        
func jumpWithOutNavigation() {
    let homeVc = storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
    //homeVc.modalPresentationStyle = .fullScreen
    present(homeVc, animated: true, completion: nil)
}
        
func validateTF() -> Bool {
    guard let email = emailTF.text, !email.isEmpty else { return false }
            
    guard let password = passwordTF.text, !password.isEmpty else { return false }
            
    return true
    }
}
