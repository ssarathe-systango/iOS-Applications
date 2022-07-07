//
//  ViewController.swift
//  The Night Porter
//
//  Created by macmini01 on 27/06/22.
//

import UIKit

class ViewController: UIViewController {

//    @IBAction func changeBackground(_ sender: Any) {
//        //changing background color to gray
//        view.backgroundColor = UIColor.darkGray
//
//        let everything = view.subviews
//
//        for eachView in everything {
////             eachView.backgroundColor = UIColor.red
//            //is it a label ?
//            if eachView is UILabel {
//                //downcast as UILabel
//                let currentLabel = eachView as! UILabel
//                currentLabel.textColor = UIColor.red
//
//            }
//        }
//    }
//
//    @IBAction func changeBackgroundReverse(_ sender: Any) {
//        //changing background color to white
//        view.backgroundColor = UIColor.white
//
//        let allViews = view.subviews
//
//        for views in allViews {
//            if views is UILabel {
//                let currentViewLabel = views as! UILabel
//                currentViewLabel.textColor = UIColor.blue
//            }
//        }
//    }
    
    @IBAction func toggleDarkMode(_ sender: Any) {
        let mySwitch = sender as! UISwitch
        
        if mySwitch.isOn {
            view.backgroundColor = UIColor.darkGray
            
            let everything = view.subviews
            
            for eachView in everything {
                
                if eachView is UILabel {
                    //downcast as UILabel
                    let currentLabel = eachView as! UILabel
                    currentLabel.textColor = UIColor.red

                }
            }
            
        } else {
            view.backgroundColor = UIColor.white
        
            let allViews = view.subviews

            for views in allViews {
                if views is UILabel {
                    let currentViewLabel = views as! UILabel
                    currentViewLabel.textColor = UIColor.blue
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

