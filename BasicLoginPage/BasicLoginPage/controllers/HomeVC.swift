//
//  HomeVC.swift
//  BasicLoginPage
//
//  Created by macmini01 on 28/06/22.
//

import UIKit

class HomeVC: UIViewController {
    
//    @IBOutlet weak var backButton: UIBarButtonItem!
    
    @IBAction func goBack(_ sender: UIButton) {
        
        let tableVC = storyboard?.instantiateViewController(withIdentifier: "UserListVC") as! UserListVC
        
        navigationController?.pushViewController(tableVC, animated: true)
                        
        //present(tableVC, animated: true, completion: nil)
        
        //present is used for move to the next screen without using navigation.
}
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        backButton.tintColor = UIColor.blue
//        self.navigationItem.backButtonTitle = "hohoho"

    }
}



// Explanation of dismiss :- Present is use for move Ahead and Dismiss is used for move back (ex :- backButton).

/*
 
dismiss(animated: true, completion: nil) :- Dismisses the view controller that was presented modally by the view controller.

// Parameter Explanation :-
 
1. flag: Pass true to animate the transition.

2. completion: The block to execute after the view controller is dismissed. This block has no return value and takes no parameters. You may specify nil for this parameter.
 
 */
