//
//  ViewController.swift
//  TableView XIB Custom Cell 3
//
//  Created by macmini01 on 13/07/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var fruits: [String] = ["Apple", "Orange", "Grapes", "Banana", "Pineapple", "Chiku", "Papaya"]
    var fruitsImages: [String] = ["apple", "orange", "grapes", "banana", "pineapple", "chiku", "papaya"]
    
    
    @IBOutlet weak var tableViewObj: UITableView!
    
    // table view datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewObj.dequeueReusableCell(withIdentifier: "MyTableCell", for: indexPath) as! TableCell
        cell.imageObj.image = UIImage(named: fruitsImages[indexPath.row])
        cell.labelObj.text = fruits[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Fruits Section"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //register XIB
        tableViewObj.register(UINib(nibName: "MyTableCell", bundle: nil), forCellReuseIdentifier: "MyTableCell")
    }
}

extension ViewController {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        80
    }
}

