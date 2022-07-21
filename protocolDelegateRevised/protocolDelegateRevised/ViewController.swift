//
//  ViewController.swift
//  protocolDelegateRevised
//
//  Created by macmini01 on 21/07/22.
//

import UIKit

class ViewController: UIViewController, Data {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func goToForm(_ sender: Any) {
        let move = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        move.delegate = self
        navigationController?.pushViewController(move, animated: true)
    }
    
    func savingData(name: String, address: String, city: String) {
        lblName.text = name
        lblAddress.text = address
        lblCity.text = city
    }
    
}



