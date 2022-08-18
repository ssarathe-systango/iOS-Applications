//
//  ViewController.swift
//  SDWebImage Image Download URL
//
//  Created by macmini01 on 18/08/22.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var urlTextField: UITextField!
    
    @IBOutlet weak var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: Actions
    @IBAction func downloadButton(_ sender: Any) {
        myImageView.image = nil
        //converting textfield data into url
        if let imageURL = URL(string: urlTextField.text ?? "") {
            myImageView.sd_imageIndicator = SDWebImageProgressIndicator()
            myImageView.sd_imageIndicator?.startAnimatingIndicator()
            
            self.myImageView.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "emptyImage"), options: .continueInBackground, completed: nil)
            
            self.myImageView.sd_imageIndicator?.stopAnimatingIndicator()
            
        } else {
            print("Invalid Image URL Entered!")
        }
    }
}

