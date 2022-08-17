//
//  StudentProjectsDetailPresenting.swift
//  Pharus
//
//  Created by Victor Colen on 17/06/22.
//

import Foundation

protocol StudentProjectsDetailPresenting: AnyObject {
    func showProjectRules()
    func showUploadFileView()
    func toggleTaskCompletedStatus(taskIndex: Int)
    func showMentorReview()
}
