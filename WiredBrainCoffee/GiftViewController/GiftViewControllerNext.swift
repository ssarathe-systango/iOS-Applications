//
//  GiftViewControllerNext.swift
//  WiredBrainCoffee
//
//  Created by macmini01 on 21/07/22.
//

import UIKit

class GiftViewControllerNext: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    weak var obj: GiftViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "New Title!"
    }
    
    @IBAction func changeTitle(_ sender: Any) {
        obj?.title = "Title Updated!"
    }
}
