//
//  FirstVC.swift
//  ChangeTitleUsingReference
//
//  Created by macmini01 on 18/07/22.
//

import UIKit

class FirstVC: UIViewController {

    @IBOutlet var tableVC: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "FirstVC"
    }
    
    @IBAction func btnAction(_ sender: Any) {
        jumpWithNavigation()
    }
}

extension FirstVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableVC", for: indexPath)
        
        cell.textLabel?.text = "row number \(indexPath.row)"
        return cell
    }
    
    func jumpWithNavigation() {
        let tableVC = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
        tableVC.obj = self
        navigationController?.pushViewController(tableVC, animated: true)
    }
}

