//
//  ProjectSubcriptionAlertPresenter.swift
//  Pharus
//
//  Created by Victor Colen on 20/04/22.
//

import UIKit

class ProjectSubcriptionAlertPresenter: BasePresenter<ProjectSubcriptionAlertViewable>,
                                        ProjectSubcriptionAlertPresenting {

    // MARK: - Properties
    private let coordinator: ProjectSubcriptionAlertCoordinating
    let project: ProjectModel

    // MARK: - Initializer

    init(
        coordinator: ProjectSubcriptionAlertCoordinating,
        project: ProjectModel
    ) {
        self.coordinator = coordinator
        self.project = project
    }

    // MARK: - Actions

    func closeModal() {
        coordinator.closeModal()
    }

    func subscribeToProject() {
        project.isSubscribed = true
        coordinator.subscribeToProject()
    }
}
