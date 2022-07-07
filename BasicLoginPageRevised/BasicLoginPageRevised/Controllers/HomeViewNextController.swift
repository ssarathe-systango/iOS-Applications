//
//  HomeViewNextController.swift
//  BasicLoginPageRevised
//
//  Created by macmini01 on 30/06/22.
//

import UIKit

class HomeViewNextController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
    }
}

extension HomeViewNextController {
    func assignbackground() {
            let background = UIImage(named: "Image-2")
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
