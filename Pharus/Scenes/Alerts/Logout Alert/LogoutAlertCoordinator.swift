//
//  LogoutAlertCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 20/04/22.
//

import UIKit

struct LogoutAlertCoordinator {

    // MARK: - Properties
    private weak var navigationController: UINavigationController?

    // MARK: - Initializer
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

// MARK: - Coordinator
extension LogoutAlertCoordinator: Coordinator {
    func start() {
        let alertPresenter = LogoutAlertPresenter(coordinator: self)
        let alertViewController = LogoutAlertViewController(presenter: alertPresenter)

        alertViewController.modalPresentationStyle = .overFullScreen

        navigationController?.present(alertViewController, animated: true)
    }
}
// MARK: - Actions
extension LogoutAlertCoordinator: LogoutAlertCoordinating {
    func closeModal() {
        navigationController?.topViewController?.dismiss(animated: true)
    }

    func logout() {
        closeModal()
        if let navigationController = navigationController {
            LoginCoordinator(
                navigationController: navigationController,
                onLogin: nil
            ).start()
        }
    }
}
