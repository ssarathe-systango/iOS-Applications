//
//  customTableVC.swift
//  customTableView
//
//  Created by macmini01 on 04/07/22.
//

import UIKit

class CustomTableVC: UIViewController {
    
    
    @IBOutlet weak var userListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "First VC"
        
    }
}

// datasource and delegates methods
extension CustomTableVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    // with reusablecell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "normalCell", for: indexPath)
        
        //set text
        cell.textLabel?.text = "Row Number \(indexPath.row)"
        
        //set image
        cell.imageView?.image = UIImage(named: "Image")
        
        //set accessory type
        cell.accessoryType = .detailDisclosureButton
        
        cell.detailTextLabel?.text = "Increase table view cell height dynamically.Increase table view cell height dynamically.Increase table view cell height dynamically.Increase table view cell height dynamically.Increase table view cell height dynamically."
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
    
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return tableView.estimatedRowHeight
//    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("Index:", indexPath.section," . ", indexPath.row)
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Header"
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Footer"
    }
    
    //Jump with navigation
    func jumpWithNavigation() {
        let tableVC = storyboard?.instantiateViewController(withIdentifier: "customTableVCNext") as! customTableVCNext
        
        navigationController?.pushViewController(tableVC, animated: true)
    }
}





























//    @IBAction func goBack(_ sender: Any) {
//        jumpWithNavigation()
//    }






//without reusablecell

//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let myCell = UITableViewCell()
//        myCell.textLabel?.text = "This is row number \(indexPath.row)"
//        return myCell
//    }
