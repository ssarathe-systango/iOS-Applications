//
//  HomeVC.swift
//  Sanil Demo
//
//  Created by macmini37 on 27/06/22.
//

import UIKit

struct User {
    var name: String
    var age: Int
}

class HomeVC: UIViewController {
    
    @IBOutlet weak var userListTableView: UITableView!
    
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        users.append(User(name: "John", age: 20))
        users.append(User(name: "David", age: 34))
        users.append(User(name: "Jenny", age: 56))
        users.append(User(name: "Jerry", age: 78))
        users.append(User(name: "Radha", age: 12))
        users.append(User(name: "Gopal", age: 34))
        users.append(User(name: "Jofghfghhn", age: 5))
        users.append(User(name: "eerrr", age: 8))
    }

}
// datasource methods
extension HomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let user = users[indexPath.row]
        cell.textLabel?.text = "User Name: " + user.name + "💁"
        cell.backgroundColor = .red
        cell.textLabel?.textColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Header title"
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        "Footer title"
    }
}

//delegates methods
extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Index:",indexPath.section, " : ", indexPath.row)
        print("Name: ", users[indexPath.row].name)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}
