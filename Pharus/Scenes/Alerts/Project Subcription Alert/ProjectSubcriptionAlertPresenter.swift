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
    private let subscriptionHandler: () -> Void

    // MARK: - Initializer

    init(
        coordinator: ProjectSubcriptionAlertCoordinating,
        project: ProjectModel,
        onSubscription subscriptionHandler: @escaping () -> Void
    ) {
        self.coordinator = coordinator
        self.project = project
        self.subscriptionHandler = subscriptionHandler
    }

    // MARK: - Actions

    func closeModal() {
        coordinator.closeModal()
    }

    func subscribeToProject() {
        subscriptionHandler()
        coordinator.subscribeToProject()
    }
}
