//
//  AppCoordinator.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 22/03/22.
//

import UIKit
import CoreApp
import LoginFeature
import CoreKit
import InjectionKit

public struct AppCoordinator {

    // MARK: - Properties
    private weak var window: UIWindow?
    @Injected var getStudentUseCaseProtocol: GetStudentUseCaseProtocol
    @Injected var getUserTokenUseCaseProtocol: GetUserTokenUseCaseProtocol

    // MARK: - Initializer
    public init(window: UIWindow) {
        self.window = window
    }
}

// MARK: - Coordinator
extension AppCoordinator: Coordinator {
    public func start() {
        guard let token = getUserTokenUseCaseProtocol() else {
            openLoginScene()
            window?.makeKeyAndVisible()
            return
        }

        if tokenIsExpired(token) {
            openLoginScene()
        } else {
            openTabBarScene()
        }

        window?.makeKeyAndVisible()
    }
}

// MARK: - Open Scene
extension AppCoordinator {
    func openLoginScene() {
        let navigationController = UINavigationController()
        LoginCoordinator(
            rootViewController: navigationController,
            onLogin: openTabBarScene
        ).start()

        transitionWindow(to: navigationController)
    }

    func openTabBarScene() {
        let tabBarController = UITabBarController()
        TabBarCoordinator(
            rootViewController: tabBarController,
            student: getStudentUseCaseProtocol(),
            onLogout: openLoginScene
        ).start()

        transitionWindow(to: tabBarController)
    }

    func transitionWindow(to controller: UIViewController) {
        guard let window = window else { return }
        UIView.transition(with: window, duration: 0.3, options: .transitionFlipFromLeft) {
            window.rootViewController = controller
        }
    }
}

// MARK: - Additional Methods
extension AppCoordinator {
    func tokenIsExpired(_ token: Date) -> Bool {
        return Date() > token
    }
}
