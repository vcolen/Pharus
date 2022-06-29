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
    private let logOutHandler: () -> Void

    init(
        rootViewController: UITabBarController,
        student: StudentModel,
        onLogOut logOutHandler: @escaping () -> Void
    ) {
        self.rootViewController = rootViewController
        self.student = student
        self.logOutHandler = logOutHandler
    }

    func start() {
        let navigationController = UINavigationController()

        StudentProfileCoordinator(
            navigationController: navigationController,
            student: student,
            onLogOut: logOutHandler
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
