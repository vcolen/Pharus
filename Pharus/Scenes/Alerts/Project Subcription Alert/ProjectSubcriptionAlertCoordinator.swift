//
//  ProjectSubcriptionAlertCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 20/04/22.
//

import UIKit

class ProjectSubcriptionAlertCoordinator: Coordinator {

    // MARK: - Properties

    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    private var alertView: ProjectSubcriptionAlertView
    private var project: ProjectModel

    // MARK: - Initializer

    init(
        navigationController: UINavigationController,
        alertView: ProjectSubcriptionAlertView,
        project: ProjectModel
    ) {
        self.navigationController = navigationController
        self.alertView = alertView
        self.project = project
    }

    func start() {
        let alertPresenter = ProjectSubcriptionAlertPresenter(coordinator: self)
        let alertViewController = ProjectSubcriptionAlertViewController(
            alertView: alertView,
            coordinator: self,
            presenter: alertPresenter)

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

        coordinate(to: confirmationAlertCoordinator)
    }
}
