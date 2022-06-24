//
//  LoginCoodinator.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 28/03/22.
//

import UIKit

class LoginCoordinator: Coordinator {

    // MARK: - Properties
    private let navigationController: UINavigationController

    // MARK: - Initializer
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let loginPresenter = LoginPresenter(coordinator: self)
        let loginViewController = LoginViewController(
            presenter: loginPresenter
        )

        navigationController.setNavigationBarHidden(true, animated: true)
        navigationController.tabBarController?.tabBar.isHidden = true
        navigationController.setViewControllers([loginViewController], animated: true)
    }
}

// MARK: - Actions
extension LoginCoordinator: LoginCoordinating {
    func showHome(student: StudentModel) {
        let tabbarViewController = TabBarViewController()
        let tabbarCoordinator = TabBarCoordinator(
            navigationController: navigationController,
            tabBarViewController: tabbarViewController,
            student: student)

        tabbarCoordinator.start()
    }
}
