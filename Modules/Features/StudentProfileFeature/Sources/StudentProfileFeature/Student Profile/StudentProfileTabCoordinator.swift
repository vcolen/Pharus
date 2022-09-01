//
//  StudentProfileTabCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 28/06/22.
//

import UIKit
import CoreApp

public struct StudentProfileTabCoordinator {
    private weak var rootViewController: UITabBarController?
    private let logoutHandler: () -> Void

    public init(
        rootViewController: UITabBarController,
        onLogout logoutHandler: @escaping () -> Void
    ) {
        self.rootViewController = rootViewController
        self.logoutHandler = logoutHandler
    }

    public func start() {
        let navigationController = UINavigationController()

        StudentProfileCoordinator(
            rootViewController: navigationController,
            onLogout: logoutHandler
        ).start()

        navigationController.tabBarItem.image = .pharusIcons.profileTabBarIcon
        navigationController
            .tabBarItem
            .selectedImage = .pharusIcons.profileTabBarIconSelected?.withRenderingMode(.alwaysOriginal)

        navigationController.title = ""

        rootViewController?.addViewController(navigationController)
    }
}

extension StudentProfileTabCoordinator: Coordinator { }
