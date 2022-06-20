//
//  StudentProjectDetailPresenter.swift
//  Pharus
//
//  Created by Victor Colen on 11/04/22.
//

import UIKit

class StudentProjectDetailPresenter: StudentProjectsDetailPresenting {

    // MARK: - Properties

    private var coordinator: StudentProjectDetailCoordinator
    let project: ProjectModel

    // MARK: - Initializer

    init(
        coordinator: StudentProjectDetailCoordinator,
        project: ProjectModel
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

    func toggleTaskCompletedStatus(task: TaskModel) {
        task.toggleCompletionStatus()
    }
}
