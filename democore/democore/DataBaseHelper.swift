//
//  DataBaseHelper.swift
//  democore
//
//  Created by macmini01 on 01/07/22.
//

import Foundation
import CoreData
import UIKit

class DatabaseHelper {
    static var shareInstance = DatabaseHelper()
    func save(object: [String:String]) {
        let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        
        let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context!) as! Student
        student.name = object["name"]
        student.address = object["address"]
        student.city = object["city"]
        student.mobile = object["mobile"]
        do {
            try context? .save()
        } catch {
            print("data is not saved!")
        }
    }
}
