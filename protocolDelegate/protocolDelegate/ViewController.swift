//
//  ViewController.swift
//  protocolDelegate
//
//  Created by macmini01 on 20/07/22.
//

import UIKit

class ViewController: UIViewController, DataPass { //conforming protocol
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // Go to form button
    @IBAction func btnAction(_ sender: Any) {
        let move = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        move.delegate = self
        navigationController?.pushViewController(move, animated: true)
    }
    
    func dataPassing(name: String, address: String, city: String) {
        lblName.text = name
        lblAddress.text = address
        lblCity.text = city
    }
}

