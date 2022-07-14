//
//  ProjectSubcriptionAlertCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 20/04/22.
//

import UIKit

struct ProjectSubcriptionAlertCoordinator {

    // MARK: - Properties
    private weak var rootViewController: UINavigationController?
    private let project: ProjectModel
    private let projectSubscriptionHandler: () -> Void

    // MARK: - Initializer
    init(
        rootViewController: UINavigationController,
        project: ProjectModel,
        onSubscription projectSubscriptionHandler: @escaping () -> Void
    ) {
        self.rootViewController = rootViewController
        self.project = project
        self.projectSubscriptionHandler = projectSubscriptionHandler
    }
}

// MARK: - Coordinator
extension ProjectSubcriptionAlertCoordinator: Coordinator {
    func start() {
        let alertPresenter = ProjectSubcriptionAlertPresenter(
            coordinator: self,
            project: project,
            onSubscription: projectSubscriptionHandler
        )

        let alertViewController = ProjectSubcriptionAlertViewController(
            presenter: alertPresenter
        )

        alertViewController.modalPresentationStyle = .fullScreen

        rootViewController?.present(alertViewController, animated: true)
    }
}

// MARK: - Actions
extension ProjectSubcriptionAlertCoordinator: ProjectSubcriptionAlertCoordinating {
    func closeModal() {
        rootViewController?.dismiss(animated: true)
    }

    func subscribeToProject() {
        closeModal()
        if let navigationController = rootViewController {
            SingleButtonAlertCoordinator(
                rootViewController: navigationController,
                alertMessage: "Inscrição confirmada!",
                alertType: .confirmation
            ).start()
        }
    }
}
