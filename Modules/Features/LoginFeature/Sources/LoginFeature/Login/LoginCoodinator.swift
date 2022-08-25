//
//  LoginCoodinator.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 28/03/22.
//

import UIKit
import CoreApp

public struct LoginCoordinator {

    // MARK: - Properties
    private weak var rootViewController: UINavigationController?
    private let loginHandler: (() -> Void)?

    // MARK: - Initializer
    public init(
        rootViewController: UINavigationController,
        onLogin loginHandler: (() -> Void)? = nil
    ) {
        self.rootViewController = rootViewController
        self.loginHandler = loginHandler
    }
}

// MARK: - Coordinator
extension LoginCoordinator: Coordinator {
    public func start() {
        let loginPresenter = LoginPresenter(coordinator: self)
        let loginViewController = LoginViewController(
            presenter: loginPresenter
        )

        rootViewController?.setNavigationBarHidden(true, animated: true)
        rootViewController?.tabBarController?.tabBar.isHidden = true
        rootViewController?.setViewControllers([loginViewController], animated: true)
    }
}
// MARK: - Actions
extension LoginCoordinator: LoginCoordinating {
    func showHome() {
        if let loginHandler = loginHandler {
            loginHandler()
        }
    }
}
