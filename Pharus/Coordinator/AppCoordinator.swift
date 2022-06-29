//
//  AppCoordinator.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 22/03/22.
//

import UIKit

struct AppCoordinator {

    // MARK: - Properties
    private weak var window: UIWindow?

    // MARK: - Initializer
    init(window: UIWindow) {
        self.window = window
    }
}

// MARK: - Coordinator
extension AppCoordinator: Coordinator {
    func start() {
        openLoginScene()
        window?.makeKeyAndVisible()
    }
}

// MARK: - Open Scene
extension AppCoordinator {
    func openLoginScene() {
        let navigationController = UINavigationController()
        LoginCoordinator(
            navigationController: navigationController,
            onLogin: openTabBarScene
        ).start()

        guard let window = window else { return }

        UIView.transition(with: window, duration: 0.3, options: .transitionFlipFromLeft) {
            window.rootViewController = navigationController
        }
    }

    func openTabBarScene(student: StudentModel) {
        let tabBarController = TabBarViewController()
        MainTabBarCoordinator(
            rootViewController: tabBarController,
            student: student,
            onLogout: openLoginScene
        ).start()

        guard let window = window else { return }

        UIView.transition(with: window, duration: 0.3, options: .transitionFlipFromLeft) {
            window.rootViewController = tabBarController
        }
    }
}
