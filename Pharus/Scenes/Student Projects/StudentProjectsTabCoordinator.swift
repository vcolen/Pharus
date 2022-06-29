//
//  StudentProjectsTabCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 28/06/22.
//

import UIKit

struct StudentProjectsTabCoordinator {
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

        StudentProjectsCoordinator(
            navigationController: navigationController,
            student: student
        ).start()

        navigationController.tabBarItem.image = .pharusIcons.projecsTabBarIcon
        navigationController
            .tabBarItem
            .selectedImage = .pharusIcons.projecsTabBarIconSelected?.withRenderingMode(.alwaysOriginal)

        navigationController.title = ""

        rootViewController?.addViewController(navigationController)
    }
}
