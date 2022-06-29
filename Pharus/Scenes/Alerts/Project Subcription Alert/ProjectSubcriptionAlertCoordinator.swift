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

    // MARK: - Initializer
    init(
        navigationController: UINavigationController,
        project: ProjectModel
    ) {
        self.rootViewController = navigationController
        self.project = project
    }
}

// MARK: - Coordinator
extension ProjectSubcriptionAlertCoordinator: Coordinator {
    func start() {
        let alertPresenter = ProjectSubcriptionAlertPresenter(
            coordinator: self,
            project: project
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
        rootViewController?.topViewController?.dismiss(animated: true)
    }

    func subscribeToProject() {
        project.isSubscribed = true
        closeModal()

        if let navigationController = rootViewController {
            let confirmationAlertCoordinator = SingleButtonAlertCoordinator(
                navigationController: navigationController,
                alertMessage: "Inscrição confirmada!",
                alertType: .confirmation
            )

            confirmationAlertCoordinator.start()
        }
    }
}
