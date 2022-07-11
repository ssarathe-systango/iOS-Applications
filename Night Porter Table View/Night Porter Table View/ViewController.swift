//
//  ViewController.swift
//  Night Porter Table View
//
//  Created by macmini01 on 05/07/22.
//

import UIKit

class ViewController: UIViewController {
//---------------------------------------------------------------------------//
    @IBOutlet weak var taskTableView: UITableView!
    
    @IBAction func toggleDarkMode(_ sender: Any) {
        let mySwitch = sender as! UISwitch
        if mySwitch.isOn {
            view.backgroundColor = UIColor.darkGray
        } else {
            view.backgroundColor = UIColor.white
        }
    }
//---------------------------------------------------------------------------//

//---------------------------------------------------------------------------//
    //Action for reseting list
    @IBAction func resetList(_ sender: Any) {
        
        //alert controller
        let confirm = UIAlertController(title: "Are You Sure ?", message: "Really", preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Yes", style: .destructive){
            action in
            
            for i in 0..<self.dailyTasks.count {
                self.dailyTasks[i].completed = false
            }
            
            for i in 0..<self.weeklyTasks.count {
                self.weeklyTasks[i].completed = false
            }
            
            for i in 0..<self.monthlyTasks.count {
                self.monthlyTasks[i].completed = false
            }
            self.taskTableView.reloadData()
        }
        let noAction = UIAlertAction(title: "No", style: .cancel) {
            action in
            print("That was a close one!")
        }
        
        //add action to alert controller
        confirm.addAction(yesAction)
        confirm.addAction(noAction)
        
        //show it
        present(confirm, animated: true, completion: nil)
    }
//---------------------------------------------------------------------------//
    var dailyTasks = [
        Task(name: "Check all windows", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Check all doors", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Is the boiler fueled?", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Check the mailbox", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Empty trash containers", type: .daily, completed: false, lastCompleted: nil)
    ]
    
    var weeklyTasks = [
        Task(name: "Test security alarm", type: .weekly, completed: false, lastCompleted: nil),
        
        Task(name: "Cleaning Water Underground Tank", type: .weekly, completed: false, lastCompleted: nil)
    ]
    
    var monthlyTasks = [
        Task(name: "Check inside all cabins", type: .monthly, completed: false, lastCompleted: nil),
        
        Task(name: "Flush all lavotories in cabins", type: .monthly, completed: false, lastCompleted: nil),
        
        Task(name: "Walk the perimeter of property", type: .monthly, completed: false, lastCompleted: nil)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
//---------------------------------------------------------------------------//

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return dailyTasks.count
        case 1:
            return weeklyTasks.count
        case 2:
            return monthlyTasks.count
        default:
            return 0
        }
    }
//---------------------------------------------------------------------------//
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        //to hold the current task
        var currentTask: Task!
        
        switch indexPath.section {
        case 0:
            currentTask = dailyTasks[indexPath.row]
        case 1:
            currentTask = weeklyTasks[indexPath.row]
        case 2:
            currentTask = monthlyTasks[indexPath.row]
        default:
            break
        }
        
        //use the name property to set the value of the cell.
        cell.textLabel?.text = currentTask.name
        
        if currentTask.completed {
            cell.textLabel?.textColor = UIColor.lightGray
            cell.accessoryType = .checkmark
        } else {
            cell.textLabel?.textColor = UIColor.black
            cell.accessoryType = .none
        }
        //clear out the background
        cell.backgroundColor = UIColor.clear
        return cell
    }
//---------------------------------------------------------------------------//
    // Table view delegate methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected row \(indexPath.row) in section \(indexPath.section)")
    }
//---------------------------------------------------------------------------//
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let completeAction = UIContextualAction(style: .normal, title: "Complete") {(action: UIContextualAction, sourceView: UIView, actionPerformed:(Bool) -> Void) in
            
            // find the right object and set it to complete
            switch indexPath.section {
            case 0:
                self.dailyTasks[indexPath.row].completed = true
            case 1:
                self.weeklyTasks[indexPath.row].completed = true
            case 2:
                self.monthlyTasks[indexPath.row].completed = true
            default:
                break
            }
            tableView.reloadData()
            actionPerformed(true)
        }
        return UISwipeActionsConfiguration(actions: [completeAction])
    }
//---------------------------------------------------------------------------//
    
    // Table view datasource methods
    func numberOfSections(in tableView: UITableView) -> Int {
        tableView.backgroundColor = UIColor.clear
        return 3
    }
//---------------------------------------------------------------------------//
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Heading"
    }
//---------------------------------------------------------------------------//
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        "Footer"
    }
//---------------------------------------------------------------------------//
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
}
//---------------------------------------------------------------------------//

   


