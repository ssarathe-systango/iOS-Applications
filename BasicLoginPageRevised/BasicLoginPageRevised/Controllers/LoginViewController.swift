//
//  LoginViewController.swift
//  BasicLoginPageRevised
//
//  Created by macmini01 on 30/06/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBAction func LoginButton(_ sender: Any) {
        if Validation() {
            jumpWithNavigation()
        //  jumpWithoutNavigation()
        }
      
    }
    override func viewDidLoad() {
        assignbackground()
        super.viewDidLoad()
    }
}
extension LoginViewController{
    //backgroundImage
    func assignbackground() {
            let background = UIImage(named: "Image")
            var imageView : UIImageView!
            imageView = UIImageView(frame: view.bounds)
            imageView.contentMode =  UIView.ContentMode.scaleAspectFill
            imageView.clipsToBounds = true
            imageView.image = background
            imageView.center = view.center
            view.addSubview(imageView)
            self.view.sendSubviewToBack(imageView)
        }
}

//extension
extension LoginViewController {
    func jumpWithNavigation() {
    let homeVC = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
    navigationController?.pushViewController(homeVC, animated: true)
    }
    
//    func jumpWithoutNavigation() {
//        let homeVC = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
//        present(homeVC, animated: true, completion: nil)
//    }
    
    func Validation() -> Bool{
        guard let email = emailTF.text, !email.isEmpty else { return false }
        
        guard let password = passwordTF.text, !password.isEmpty else { return false }
        
        return true
    }
}
