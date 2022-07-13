//
//  ViewController.swift
//  NightPorterTableViewRevised
//
//  Created by macmini01 on 11/07/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var taskTableview: UITableView!
    
    @IBOutlet weak var taskTF: UITextField!
    
    // Dark mode action
    @IBAction func toggleDarkMode(_ sender: Any) {
        let mySwitch = sender as! UISwitch
        if mySwitch.isOn {
            view.backgroundColor = UIColor.darkGray
        } else {
            view.backgroundColor = UIColor.white
        }
    }
    
    // Add button action
    @IBAction func addTasks(_ sender: Any) {
//          let text = taskTF.text
            let alert = UIAlertController(title: "Enter Task Name?", message: "", preferredStyle: .alert)
            alert.addTextField {(textField) in
            textField.placeholder = "Task"
        }
        
        let saveAction = UIAlertAction(title: "Add", style: .default) {
            action in

            let inputName = alert.textFields![0].text
//          print(inputName ?? "")
            let task = Task(name: inputName ?? "", type: .daily, completed: false, lastCompleted: nil)
            self.dailyTask.append(task)
            self.weeklyTask.append(task)
            self.monthlyTask.append(task)
            self.taskTableview.reloadData()
        }
        
        let saveActionForNo = UIAlertAction(title: "Don't Add", style: .cancel) {
            action in
            print("cancel action called!")
        }

        alert.addAction(saveAction)
        alert.addAction(saveActionForNo)
        present(alert, animated: true, completion: nil)
        
//        let task = Task(name: text ?? "", type: .daily, completed: false, lastCompleted: nil)
//        dailyTask.append(task)
//        weeklyTask.append(task)
//        monthlyTask.append(task)
            
//        let indexPath = IndexPath(row: dailyTask.count - 1, section: 0)
//        taskTableview.reloadRows(at: [indexPath], with: .fade)
    }
    
    // Reset button action
    @IBAction func resetList(_ sender: Any) {
        let confirm = UIAlertController(title: "Are you sure ?", message: "Really", preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Yes", style: .destructive) {
            action in
            
            for i in 0..<self.dailyTask.count {
                self.dailyTask[i].completed = false
            }
            
            for i in 0..<self.weeklyTask.count {
                self.weeklyTask[i].completed = false
            }
            
            for i in 0..<self.monthlyTask.count {
                self.monthlyTask[i].completed = false
            }
            self.taskTableview.reloadData()
        }
        
        let noAction = UIAlertAction(title: "No", style: .cancel) {
            action in
            print("That was close one!!!")
        }
        // Add actions to UIAlertController
        confirm.addAction(yesAction)
        confirm.addAction(noAction)
        
        //present
        present(confirm, animated: true, completion: nil)
    }
    
    var dailyTask = [
        Task(name: "Check all windows", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Check all doors", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Is the boiler fueled", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Check the mail box", type: .daily, completed: false, lastCompleted: nil)
    ]
    
    var weeklyTask = [
        Task(name: "Test Security Alarm", type: .weekly, completed: false, lastCompleted: nil),
        Task(name: "Cleaning the water underground tank", type: .weekly, completed: false, lastCompleted: nil)
    ]

    var monthlyTask = [
        Task(name: "Check inside all cabins", type: .monthly, completed: false, lastCompleted: nil),
        Task(name: "Wash all floors", type: .monthly, completed: false, lastCompleted: nil)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


// Table view datasource methods
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return dailyTask.count
        case 1:
            return weeklyTask.count
        case 2:
            return monthlyTask.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        var currentTask: Task!
        
        switch indexPath.section {
        case 0:
            currentTask = dailyTask[indexPath.row]
        case 1:
            currentTask = weeklyTask[indexPath.row]
        case 2:
            currentTask = monthlyTask[indexPath.row]
        default:
            break
        }
        
        cell.textLabel?.text = currentTask.name
        
        // Set the value of completed = true, then see output.
        if currentTask.completed {
            cell.textLabel?.textColor = UIColor.lightGray
            cell.accessoryType = .checkmark
        } else {
            cell.textLabel?.textColor = UIColor.black
            cell.accessoryType = .none
        }
        
        cell.backgroundColor = UIColor.clear
        return cell
    }

// Table view delegate methods
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("You have selected \(indexPath.row) row in \(indexPath.section) section")
}


// Swipe action
func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    
    let completeAction = UIContextualAction(style: .normal, title: "Complete") {(action: UIContextualAction, sourceView: UIView, actionPerformed:(Bool) -> Void) in
        
        // find the right object and set it to complete
        switch indexPath.section {
        case 0:
            self.dailyTask[indexPath.row].completed = true
        case 1:
            self.weeklyTask[indexPath.row].completed = true
        case 2:
            self.monthlyTask[indexPath.row].completed = true
        default:
            break
        }
        tableView.reloadData()
        actionPerformed(true)
    }
    return UISwipeActionsConfiguration(actions: [completeAction])
}

func numberOfSections(in tableView: UITableView) -> Int {
    tableView.backgroundColor = UIColor.clear
    return 3
}

func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "Header"
}

func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
    return "Footer"
}

func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 50
}

func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 60
}
}







