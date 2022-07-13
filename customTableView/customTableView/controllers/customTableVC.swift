//
//  customTableVC.swift
//  customTableView
//
//  Created by macmini01 on 04/07/22.
//

import UIKit

class CustomTableVC: UIViewController {
    
    
    @IBOutlet weak var userListTableView: UITableView!
    
    @IBAction func goBack(_ sender: Any) {
//        jumpWithNavigation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "First VC"
    }
}

// datasource methods
extension CustomTableVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
                            //without dequeuing
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let myCell = UITableViewCell()
//        myCell.textLabel?.text = "This is row number \(indexPath.row)"
//        return myCell
//    }
                            // with dequeuing
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let myCell = tableView.dequeueReusableCell(withIdentifier: "normalCell", for: indexPath)
        //set text
        myCell.textLabel?.text = "This is row number \(indexPath.row)"
        
        //set image
        myCell.imageView?.image = UIImage(named: "Image")
        
        //set accessory type
//        myCell.accessoryType = .disclosureIndicator
        myCell.accessoryType = .detailDisclosureButton
        myCell.detailTextLabel?.text = "This is something detail text This is something detail textThis is something detail textThis is something detail textThis is something detail text"
        return myCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Header"
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Footer"
    }
}

// delegate methods
extension CustomTableVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.estimatedRowHeight
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        print("Index:", indexPath.section," . ", indexPath.row)
    }
}

// jump with navigation
extension CustomTableVC {
    func jumpWithNavigation() {
        let tableVC = storyboard?.instantiateViewController(withIdentifier: "customTableVCNext") as! customTableVCNext
        
        navigationController?.pushViewController(tableVC, animated: true)
    }
}
