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
    private let logOutHandler: () -> Void

    // MARK: - Initializer
    init(
        navigationController: UINavigationController,
        onLogOut logOutHandler: @escaping () -> Void
    ) {
        self.navigationController = navigationController
        self.logOutHandler = logOutHandler
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
        logOutHandler()
    }
}
