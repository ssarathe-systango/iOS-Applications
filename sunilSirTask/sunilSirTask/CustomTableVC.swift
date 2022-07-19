//
//  CustomTableVC.swift
//  sunilSirTask
//
//  Created by macmini01 on 15/07/22.
//

import UIKit

class CustomTableVC: UIViewController {

    //MARK: Outlet's
    @IBOutlet weak var CustomTableVC: UITableView!
    
    var dataArray: [DataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Records"
    }

    //MARK: Action's
    @IBAction func addMoreContent(_ sender: Any) {
        
        let alert = UIAlertController(title: "Add More Content ?", message: "", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Title"
        }
        
        alert.addTextField { textField in
            textField.placeholder = "Sub Title"
        }
            
        let saveAction = UIAlertAction(title: "Add Content", style: .default) {
            action in

            let title = alert.textFields?[0].text
            print(title ?? "")
            
            let subTitle = alert.textFields?[1].text
            print(subTitle ?? "")
           
            if title == "" || subTitle == "" {
                print("Please add more content!!!")
            }
            
            else {
                let data = DataModel(title: title, description: subTitle)
                self.dataArray.append(data)
                
                self.CustomTableVC.reloadData()
            }
        }
        
        let cancelAction = UIAlertAction(title: "Don't Add", style: .cancel) {
            action in
            print("cancel action called!")
        }

        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)

    }
}

//MARK: TableView DataSource and Delegate
extension CustomTableVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    // with reusablecell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "normalCell", for: indexPath)
        
        let data = dataArray[indexPath.row]
         
        cell.textLabel?.text = data.title
        cell.detailTextLabel?.text = data.description
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
           return tableView.estimatedRowHeight
       }
}
