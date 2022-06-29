//
//  StudentProfileTabCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 28/06/22.
//

import UIKit

struct StudentProfileTabCoordinator {
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

        StudentProfileCoordinator(
            navigationController: navigationController,
            student: student
        ).start()

        navigationController.tabBarItem.image = .pharusIcons.profileTabBarIcon
        navigationController
            .tabBarItem
            .selectedImage = .pharusIcons.profileTabBarIconSelected?.withRenderingMode(.alwaysOriginal)

        navigationController.title = ""

        if rootViewController?.viewControllers == nil {
            rootViewController?.setViewControllers([navigationController], animated: true)
        } else {
            rootViewController?.viewControllers?.append(navigationController)
        }
    }
}
