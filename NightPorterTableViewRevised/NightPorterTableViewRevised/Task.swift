//
//  Task.swift
//  NightPorterTableViewRevised
//
//  Created by macmini01 on 11/07/22.
//

import Foundation

enum TaskType {
    case daily, weekly, monthly
}

struct Task {
    var name: String
    var type: TaskType
    var completed: Bool
    var lastCompleted: NSData?
}
