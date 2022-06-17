//
//  StudentProjectDetailViewDelegate.swift
//  Pharus
//
//  Created by Victor Colen on 17/06/22.
//

import Foundation

protocol StudentProjectDetailViewDelegate: AnyObject {
    func rulesViewTapped()
    func sendFilesButtonTapped()
    func envelopeIconTapped()
    func taskCheckboxTapped(task: TaskModel)
}
