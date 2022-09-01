//
//  StudentProjectsTabCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 28/06/22.
//

import UIKit
import PharusUI
import CoreApp

public struct StudentProjectsTabCoordinator {
    private weak var rootViewController: UITabBarController?

    public init(rootViewController: UITabBarController) {
        self.rootViewController = rootViewController
    }

    public func start() {
        let navigationController = UINavigationController()

        StudentProjectsCoordinator(rootViewController: navigationController).start()

        navigationController.tabBarItem.image = .pharusIcons.projecsTabBarIcon
        navigationController
            .tabBarItem
            .selectedImage = .pharusIcons.projecsTabBarIconSelected?.withRenderingMode(.alwaysOriginal)

        navigationController.title = ""

        rootViewController?.addViewController(navigationController)
    }
}

extension StudentProjectsTabCoordinator: Coordinator { }
