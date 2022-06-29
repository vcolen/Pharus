//
//  StudentProjectsRankingTabCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 28/06/22.
//

import UIKit

struct StudentProjectsRankingTabCoordinator {
    private weak var rootViewController: UITabBarController?
    private let student: StudentModel

    init(
        rootViewController: UITabBarController,
        student: StudentModel
    ) {
        self.rootViewController = rootViewController
        self.student = student
    }

    func start() {
        let navigationController = UINavigationController()

        StudentProjectsRankingCoordinator(
            navigationController: navigationController,
            student: student
        ).start()

        navigationController.tabBarItem.image = .pharusIcons.rankingTabBarIcon
        navigationController
            .tabBarItem
            .selectedImage = .pharusIcons.rankingTabBarIconSelected?.withRenderingMode(.alwaysOriginal)

        navigationController.title = ""

        if rootViewController?.viewControllers == nil {
            rootViewController?.setViewControllers([navigationController], animated: true)
        } else {
            rootViewController?.viewControllers?.append(navigationController)
        }
    }
}
