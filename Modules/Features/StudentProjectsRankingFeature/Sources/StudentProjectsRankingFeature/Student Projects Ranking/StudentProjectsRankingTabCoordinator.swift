//
//  StudentProjectsRankingTabCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 28/06/22.
//

import UIKit
import CoreApp

public struct StudentProjectsRankingTabCoordinator {
    private weak var rootViewController: UITabBarController?

    public init(rootViewController: UITabBarController) {
        self.rootViewController = rootViewController
    }

    public func start() {
        let navigationController = UINavigationController()

        StudentProjectsRankingCoordinator(
            rootViewController: navigationController
        ).start()

        navigationController.tabBarItem.image = .pharusIcons.rankingTabBarIcon
        navigationController
            .tabBarItem
            .selectedImage = .pharusIcons.rankingTabBarIconSelected?.withRenderingMode(.alwaysOriginal)

        navigationController.title = ""

        rootViewController?.addViewController(navigationController)
    }
}

extension StudentProjectsRankingTabCoordinator: Coordinator { }
