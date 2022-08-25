//
//  StudentProjectsRankingTabCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 28/06/22.
//

import UIKit
import CoreApp

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
