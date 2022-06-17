//
//  StudentProjectsDetailPresenting.swift
//  Pharus
//
//  Created by Victor Colen on 17/06/22.
//

import Foundation

protocol StudentProjectsDetailPresenting {
    func showProjectRules()
    func showUploadFileView()
    func toggleTaskCompletedStatus(task: TaskModel)
    func showMentorReview()
}
