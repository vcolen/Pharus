//
//  StudentHomeTabCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 28/06/22.
//

import UIKit
import CoreApp

public struct StudentHomeTabCoordinator {
    private weak var rootViewController: UITabBarController?

    public init(rootViewController: UITabBarController) {
        self.rootViewController = rootViewController
    }

    public func start() {
        let navigationController = UINavigationController()

        StudentHomeCoordinator(rootViewController: navigationController).start()

        navigationController.tabBarItem.image = .pharusIcons.homeTabBarIcon
        navigationController
            .tabBarItem
            .selectedImage = .pharusIcons.homeTabBarIconSelected?.withRenderingMode(.alwaysOriginal)

        navigationController.title = ""

        rootViewController?.addViewController(navigationController)
    }
}

extension StudentHomeTabCoordinator: Coordinator { }
