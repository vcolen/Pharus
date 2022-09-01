//
//  StudentProjectDetailPresenter.swift
//  Pharus
//
//  Created by Victor Colen on 11/04/22.
//

import UIKit
import CoreKit

class StudentProjectDetailPresenter: StudentProjectsDetailPresenting {

    // MARK: - Properties
    private let coordinator: StudentProjectDetailCoordinator
    var project: Project

    // MARK: - Initializer
    init(
        coordinator: StudentProjectDetailCoordinator,
        project: Project
    ) {
        self.coordinator = coordinator
        self.project = project
    }

    // MARK: - Actions
    func showProjectRules() {
        coordinator.showProjectRules()
    }

    func showMentorReview() {
        coordinator.showMentorReview()
    }

    func showUploadFileView() {
        coordinator.showSendFileView()
    }

    func toggleTaskCompletedStatus(taskIndex: Int) {
        project.tasks[taskIndex].toggleCompletionStatus()
    }
}
