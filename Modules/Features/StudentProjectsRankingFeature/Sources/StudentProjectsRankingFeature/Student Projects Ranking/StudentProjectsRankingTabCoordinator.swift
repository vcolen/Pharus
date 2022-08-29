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
    private let student: Student

    public init(
        rootViewController: UITabBarController,
        student: Student
    ) {
        self.rootViewController = rootViewController
        self.student = student
    }

    public func start() {
        let navigationController = UINavigationController()

        StudentProjectsRankingCoordinator(
            rootViewController: navigationController,
            student: student
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
