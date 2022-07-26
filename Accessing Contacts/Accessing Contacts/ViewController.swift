//
//  ViewController.swift
//  Accessing Contacts
//
//  Created by macmini01 on 25/07/22.
//

import Contacts
import ContactsUI
import UIKit

struct Person {
    var name: String
    var id: String
}

class ViewController: UIViewController, CNContactPickerDelegate, UITableViewDataSource {

    private let table: UITableView = {
        let cell = UITableView()
        cell.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return cell
    }()
    
    var models = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(table)
        table.frame = view.bounds
        table.dataSource = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
    }
}
extension ViewController {
    
    @objc func didTapAdd(){
        let vc = CNContactPickerViewController()
        vc.delegate = self
        present(vc, animated: true)
    }
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        let name = contact.givenName + " " + contact.familyName
        let identifier  = contact.identifier
        let model = Person(name: name,
                           id: identifier)
        models.append(model)
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].name
        return cell
    }
}

