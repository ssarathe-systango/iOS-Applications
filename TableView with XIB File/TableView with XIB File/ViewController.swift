//
//  ViewController.swift
//  TableView with XIB File
//
//  Created by macmini01 on 12/07/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var fruits:[String] = ["Apple", "Orange", "Banana", "Papaya", "Chiku"]
    
    @IBOutlet weak var myTable: UITableView!
    
    // Table view datasource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return fruits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = myTable.dequeueReusableCell(withIdentifier: "MyTableCellTableViewCell", for: indexPath) as! MyTableCellTableViewCell
        
        cell.myLabel.text = fruits[indexPath.row]
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Registering XIB
        myTable.register(UINib(nibName: "MyTableCellTableViewCell", bundle: nil), forCellReuseIdentifier: "MyTableCellTableViewCell")
    }
}

extension ViewController {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "This is header"
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        "This is footer"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

