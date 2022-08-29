//
//  StudentProjectsTabCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 28/06/22.
//

import UIKit
import PharusUI
import CoreApp

public struct StudentProjectsTabCoordinator {
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
