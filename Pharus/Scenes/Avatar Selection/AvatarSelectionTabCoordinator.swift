//
//  AvatarSelectionTabCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 28/06/22.
//

import UIKit

struct AvatarSelectionTabCoordinator {
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

        navigationController.tabBarItem.image = .pharusIcons.avatarTabBarIcon
        navigationController
            .tabBarItem
            .selectedImage = .pharusIcons.avatarTabBarIconSelected?.withRenderingMode(.alwaysOriginal)

        navigationController.title = ""

        AvatarSelectionCoordinator(
            navigationController: navigationController,
            student: student
        ).start()
    }
}
