//
//  ViewController.swift
//  Table View Using Filter Method SearchBar
//
//  Created by macmini01 on 15/07/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchText: UISearchBar!
    @IBOutlet weak var tableViewObject: UITableView!
    
    // array of country names
    var data: [String] = ["India", "Canada", "US", "Sri Lanka", "England", "Australia", "Thailand"]
    
    // blank array
    var filteredData = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // copying data array into filteredData array
        filteredData = data
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableViewObject.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = filteredData[indexPath.row]
        return cell
    }
}

// searching elements in array using filter method
extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText != "" {
            
            filteredData = data.filter{ $0.contains(searchText) }
            tableViewObject.reloadData()
            
        } else {
            print("Kindly Enter Text First!")
            filteredData = data
            tableViewObject.reloadData()
        }
    }
}

