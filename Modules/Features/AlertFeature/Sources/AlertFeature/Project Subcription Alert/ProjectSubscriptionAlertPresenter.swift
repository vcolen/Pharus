//
//  ProjectSubscriptionAlertPresenter.swift
//  Pharus
//
//  Created by Victor Colen on 20/04/22.
//

import UIKit
import CoreApp

class ProjectSubscriptionAlertPresenter: BasePresenter<ProjectSubscriptionAlertViewable>,
                                        ProjectSubscriptionAlertPresenting {

    // MARK: - Properties
    private let coordinator: ProjectSubscriptionAlertCoordinating
    let project: Project
    private let subscriptionHandler: () -> Void

    // MARK: - Initializer

    init(
        coordinator: ProjectSubscriptionAlertCoordinating,
        project: Project,
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
