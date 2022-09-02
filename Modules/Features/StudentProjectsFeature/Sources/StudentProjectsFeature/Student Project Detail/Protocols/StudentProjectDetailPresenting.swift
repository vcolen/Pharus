//
//  StudentProjectDetailPresenting.swift
//  Pharus
//
//  Created by Victor Colen on 17/06/22.
//

import Foundation

protocol StudentProjectDetailPresenting: AnyObject {
    func showProjectRules()
    func showUploadFileView()
    func toggleTaskCompletedStatus(taskId: Int)
    func showMentorReview()
    func loadData()
}
