//
//  ProjectSubcriptionAlertPresenter.swift
//  Pharus
//
//  Created by Victor Colen on 20/04/22.
//

import UIKit

class ProjectSubcriptionAlertPresenter: ProjectSubcriptionPresenting {

    // MARK: - Properties

    private let coordinator: ProjectSubcriptionAlertCoordinator
    let project: ProjectModel

    // MARK: - Initializer

    init(
        coordinator: ProjectSubcriptionAlertCoordinator,
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
        coordinator.subscribeToProject()
    }
}
