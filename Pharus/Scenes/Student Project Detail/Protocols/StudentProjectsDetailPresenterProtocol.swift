//
//  StudentProjectsDetailPresenterProtocol.swift
//  Pharus
//
//  Created by Victor Colen on 17/06/22.
//

import Foundation

protocol StudentProjectsDetailPresenterProtocol {
    func showProjectRules()
    func showUploadFileView()
    func toggleTaskCompletedStatus(task: TaskModel)
    func showMentorReview()
}
