//
//  ProjectSubcriptionAlertCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 20/04/22.
//

import UIKit

class ProjectSubcriptionAlertCoordinator {

    // MARK: - Properties
    private let navigationController: UINavigationController
    private let project: ProjectModel

    // MARK: - Initializer
    init(
        navigationController: UINavigationController,
        project: ProjectModel
    ) {
        self.navigationController = navigationController
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

        navigationController.present(alertViewController, animated: true)
    }
}

// MARK: - Actions
extension ProjectSubcriptionAlertCoordinator: ProjectSubcriptionAlertCoordinating {
    func closeModal() {
        navigationController.topViewController?.dismiss(animated: true)
    }

    func subscribeToProject() {
        project.isSubscribed = true
        closeModal()

        let confirmationAlertCoordinator = SingleButtonAlertCoordinator(
            navigationController: navigationController,
            alertMessage: "Inscrição confirmada!",
            alertType: .confirmation
        )

        confirmationAlertCoordinator.start()
    }
}
