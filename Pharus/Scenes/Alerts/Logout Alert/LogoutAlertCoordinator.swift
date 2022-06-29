//
//  LogoutAlertCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 20/04/22.
//

import UIKit

struct LogoutAlertCoordinator {

    // MARK: - Properties
    private weak var rootViewController: UINavigationController?
    private let logoutHandler: () -> Void

    // MARK: - Initializer
    init(
        navigationController: UINavigationController,
        onLogout logoutHandler: @escaping () -> Void
    ) {
        self.rootViewController = navigationController
        self.logoutHandler = logoutHandler
    }
}

// MARK: - Coordinator
extension LogoutAlertCoordinator: Coordinator {
    func start() {
        let alertPresenter = LogoutAlertPresenter(coordinator: self)
        let alertViewController = LogoutAlertViewController(presenter: alertPresenter)

        alertViewController.modalPresentationStyle = .overFullScreen

        rootViewController?.present(alertViewController, animated: true)
    }
}
// MARK: - Actions
extension LogoutAlertCoordinator: LogoutAlertCoordinating {
    func closeModal() {
        rootViewController?.topViewController?.dismiss(animated: true)
    }

    func logout() {
        closeModal()
        logoutHandler()
    }
}
