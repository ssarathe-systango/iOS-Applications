//
//  UserListVC.swift
//  BasicLoginPage
//
//  Created by macmini01 on 29/06/22.
//

import UIKit

//creating model
struct User {
    var name: String
    var age: Int
}

//Inheriting UIViewController Class
class UserListVC: UIViewController {
    
    var users = [User]() //Empty array
    
    @IBOutlet weak var userListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        users.append(User(name: "John", age: 20))
        users.append(User(name: "Sanil", age: 22))
        users.append(User(name: "Rajat", age: 24))
        users.append(User(name: "Aman", age: 22))
        users.append(User(name: "Ritik", age: 23))
        users.append(User(name: "Chetan", age: 23))
        users.append(User(name: "Antim", age: 23))
        users.append(User(name: "Himanshu", age: 25))
        users.append(User(name: "John", age: 20))
        users.append(User(name: "Sanil", age: 22))
        users.append(User(name: "Rajat", age: 24))
        users.append(User(name: "Aman", age: 22))
        users.append(User(name: "Ritik", age: 23))
        users.append(User(name: "Aman", age: 22))
        users.append(User(name: "Ritik", age: 23))
        users.append(User(name: "Chetan", age: 23))
        users.append(User(name: "Antim", age: 23))
        users.append(User(name: "Himanshu", age: 25))
        users.append(User(name: "John", age: 20))
        users.append(User(name: "Sanil", age: 22))
    }
    
}

extension UserListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let myCell = tableView.dequeueReusableCell(withIdentifier: "normalCell", for: indexPath)
        //set the content
        myCell.textLabel?.text = "This is row number \(indexPath.row)"
        
        return myCell
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
//        let user = users[indexPath.row]
//        print(user)
//        let age = "\(user.age)" //typecasting int into string
//        //for typecasting we can also do like this :- String(user.age)
//        cell.textLabel?.text = "User Name: " + user.name + "💁😝" + "Age is: " + age
//        cell.backgroundColor = .lightGray
//        cell.textLabel?.textColor = .white
//        return cell
//
//                                    // OR
//
////        let myCell = UITableViewCell()
////        myCell.textLabel?.text = "This is row number \(indexPath.row)"
////        return myCell
//    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Header Title"
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        "Footer Title"
    }
}

//delegate methods
extension UserListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Index:", indexPath.section, " . " , indexPath.row)
        print("Name:", users[indexPath.row].name)
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}
