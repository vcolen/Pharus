//
//  LogoutAlertCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 20/04/22.
//

import UIKit

class LogoutAlertCoordinator: Coordinator {

    // MARK: - Properties

    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []

    // MARK: - Initializer

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let alertPresenter = LogoutAlertPresenter(coordinator: self)

        let alertViewController = LogoutAlertViewController(presenter: alertPresenter)

        alertViewController.modalPresentationStyle = .overFullScreen

        navigationController.present(alertViewController, animated: true)
    }
}

// MARK: - Actions

extension LogoutAlertCoordinator: LogoutAlertCoordinating {
    func closeModal() {
        navigationController.topViewController?.dismiss(animated: true)
    }

    func logout() {
        closeModal()
        let loginCoordinator = LoginCoordinator(
            navigationController: navigationController
        )

        coordinate(to: loginCoordinator)
    }
}
