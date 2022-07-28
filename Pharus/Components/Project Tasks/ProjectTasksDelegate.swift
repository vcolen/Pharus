//
//  ProjectTasksDelegate.swift
//  Pharus
//
//  Created by Victor Colen on 28/07/22.
//

import Foundation

protocol ProjectTaskDelegate: AnyObject {
    func checkmarkButtonTapped(task: TaskModel)
}
