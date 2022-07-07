//
//  HomeViewController.swift
//  BasicLoginPageRevised
//
//  Created by macmini01 on 30/06/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBAction func moveNext(_ sender: Any) {
        jumpWithNavigation()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
    }
}
extension HomeViewController {
    //backgroundImage
    func assignbackground() {
            let background = UIImage(named: "Image-1")
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

extension HomeViewController {
    func jumpWithNavigation() {
    let homeVC = storyboard?.instantiateViewController(withIdentifier: "HomeViewNextController") as! HomeViewNextController
        
    navigationController?.pushViewController(homeVC, animated: true)
    }
}
