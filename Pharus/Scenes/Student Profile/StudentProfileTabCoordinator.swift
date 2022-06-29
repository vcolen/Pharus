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
    private let logoutHandler: () -> Void

    init(
        rootViewController: UITabBarController,
        student: StudentModel,
        onLogout logoutHandler: @escaping () -> Void
    ) {
        self.rootViewController = rootViewController
        self.student = student
        self.logoutHandler = logoutHandler
    }

    func start() {
        let navigationController = UINavigationController()

        StudentProfileCoordinator(
            navigationController: navigationController,
            student: student,
            onLogout: logoutHandler
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
