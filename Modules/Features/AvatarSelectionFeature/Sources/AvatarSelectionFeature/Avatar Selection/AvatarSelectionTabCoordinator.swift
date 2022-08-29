//
//  AvatarSelectionTabCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 28/06/22.
//

import UIKit
import CoreApp

public struct AvatarSelectionTabCoordinator {
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

        AvatarSelectionCoordinator(
            rootViewController: navigationController,
            student: student
        ).start()

        navigationController.tabBarItem.image = .pharusIcons.avatarTabBarIcon
        navigationController
            .tabBarItem
            .selectedImage = .pharusIcons.avatarTabBarIconSelected?.withRenderingMode(.alwaysOriginal)

        navigationController.title = ""

        rootViewController?.addViewController(navigationController)
    }
}

extension AvatarSelectionTabCoordinator: Coordinator { }
