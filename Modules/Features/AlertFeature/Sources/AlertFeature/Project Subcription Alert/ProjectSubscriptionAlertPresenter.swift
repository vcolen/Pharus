//
//  ProjectSubscriptionAlertPresenter.swift
//  Pharus
//
//  Created by Victor Colen on 20/04/22.
//

import UIKit
import CoreKit
import CoreApp
import InjectionKit

class ProjectSubscriptionAlertPresenter: BasePresenter<ProjectSubscriptionAlertViewable>,
                                        ProjectSubscriptionAlertPresenting {

    // MARK: - Properties
    private let coordinator: ProjectSubscriptionAlertCoordinating
    let projectId: Int
    private let subscriptionHandler: () -> Void
    @Injected var getProjectUseCaseProtocol: GetProjectUseCaseProtocol

    // MARK: - Initializer
    init(
        coordinator: ProjectSubscriptionAlertCoordinating,
        projectId: Int,
        onSubscription subscriptionHandler: @escaping () -> Void
    ) {
        self.coordinator = coordinator
        self.projectId = projectId
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

    func loadData() {
        view?.updateView(with: getProjectUseCaseProtocol(id: projectId))
    }
}
