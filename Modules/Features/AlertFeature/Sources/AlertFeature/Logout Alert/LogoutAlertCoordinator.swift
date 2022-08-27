//
//  LogoutAlertCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 20/04/22.
//

import UIKit
import CoreApp

public struct LogoutAlertCoordinator {

    // MARK: - Properties
    private weak var rootViewController: UINavigationController?
    private let logoutHandler: () -> Void

    // MARK: - Initializer
    public init(
        rootViewController: UINavigationController,
        onLogout logoutHandler: @escaping () -> Void
    ) {
        self.rootViewController = rootViewController
        self.logoutHandler = logoutHandler
    }
}

// MARK: - Coordinator
extension LogoutAlertCoordinator: Coordinator {
    public func start() {
        let logoutAlertPresenter = LogoutAlertPresenter(coordinator: self)
        let alertViewController = LogoutAlertViewController(
            presenter: logoutAlertPresenter
        )

        alertViewController.modalPresentationStyle = .overFullScreen

        rootViewController?.present(alertViewController, animated: true)
    }
}
// MARK: - Actions
extension LogoutAlertCoordinator: LogoutAlertCoordinating {
    func closeModal() {
        rootViewController?.dismiss(animated: true)
    }

    func logout() {
        rootViewController?.dismiss(animated: true, completion: logoutHandler)
    }
}
