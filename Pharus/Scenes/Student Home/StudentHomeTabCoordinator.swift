//
//  StudentHomeTabCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 28/06/22.
//

import UIKit

struct StudentHomeTabCoordinator {
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

        StudentHomeCoordinator(
            navigationController: navigationController,
            student: student
        ).start()

        navigationController.tabBarItem.image = .pharusIcons.homeTabBarIcon
        navigationController
            .tabBarItem
            .selectedImage = .pharusIcons.homeTabBarIconSelected?.withRenderingMode(.alwaysOriginal)

        navigationController.title = ""

        rootViewController?.addViewController(navigationController)
    }
}
