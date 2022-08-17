//
//  LoginCoodinator.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 28/03/22.
//

import UIKit

struct LoginCoordinator {

    // MARK: - Properties
    private weak var rootViewController: UINavigationController?
    private let loginHandler: ((StudentModel) -> Void)?

    // MARK: - Initializer
    init(
        rootViewController: UINavigationController,
        onLogin loginHandler: ((StudentModel) -> Void)? = nil
    ) {
        self.rootViewController = rootViewController
        self.loginHandler = loginHandler
    }
}

// MARK: - Coordinator
extension LoginCoordinator: Coordinator {
    func start() {
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
    func showHome(student: StudentModel) {
        if let loginHandler = loginHandler {
            loginHandler(student)
        }
    }
}
