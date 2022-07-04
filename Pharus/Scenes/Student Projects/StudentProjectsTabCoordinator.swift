//
//  StudentProjectsTabCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 28/06/22.
//

import UIKit
import PharusUI

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
            rootViewController: navigationController,
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

extension StudentProjectsTabCoordinator: Coordinator { }
