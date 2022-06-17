//
//  TabBarCoordinator.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 05/04/22.
//

import UIKit

class TabBarCoordinator: Coordinator {

    // MARK: - Properties

    private var student: StudentModel
    var navigationController: UINavigationController
    var tabBarViewController: UITabBarController
    var childCoordinators: [Coordinator] = []

    // MARK: - Initializer

    init(
        navigationController: UINavigationController,
        tabBarViewController: UITabBarController,
        student: StudentModel
    ) {
        self.navigationController = navigationController
        self.tabBarViewController = tabBarViewController
        self.student = student
    }

    func start() {
        let studentHomeCoordinator = makeStudentHomeCoordinator()
        let studentProjectsCoordinator = makeStudentProjectsCoordinator()
        let studentProjectsRankingCoordinator = makeStudentProjectsRankingCoordinator()
        let studentAvatarCoordinator = makeStudentAvatarCoordinator()
        let studentProfileCoordinator = makeStudentProfileCoordinator()

        childCoordinators = [
            studentHomeCoordinator,
            studentProjectsCoordinator,
            studentAvatarCoordinator,
            studentProjectsRankingCoordinator,
            studentProfileCoordinator
        ]

        tabBarViewController.setViewControllers(
            [
                studentHomeCoordinator.navigationController,
                studentProjectsCoordinator.navigationController,
                studentProjectsRankingCoordinator.navigationController,
                studentAvatarCoordinator.navigationController,
                studentProfileCoordinator.navigationController
            ],
            animated: true
        )

        navigationController.setViewControllers([tabBarViewController], animated: true)
    }

    // MARK: - Actions

    private func makeStudentHomeCoordinator() -> StudentHomeCoordinator {
        let coordinator = StudentHomeCoordinator(
            navigationController: UINavigationController(),
            student: student
        )

        coordinator
            .navigationController
            .tabBarItem
            .image = .pharusIcons.homeTabBarIcon

        coordinator
            .navigationController
            .tabBarItem
            .selectedImage = .pharusIcons.homeTabBarIconSelected?.withRenderingMode(.alwaysOriginal)

        coordinator.start()

        return coordinator
    }

    private func makeStudentProjectsCoordinator() -> StudentProjectsCoordinator {
        let coordinator = StudentProjectsCoordinator(
            navigationController: UINavigationController(),
            student: student
        )

        coordinator
            .navigationController
            .tabBarItem
            .image = .pharusIcons.projecsTabBarIcon

        coordinator
            .navigationController
            .tabBarItem
            .selectedImage = .pharusIcons.projecsTabBarIconSelected?.withRenderingMode(.alwaysOriginal)

        coordinator.start()

        return coordinator
    }

    private func makeStudentProjectsRankingCoordinator() -> StudentProjectsRankingCoordinator {
        let coordinator = StudentProjectsRankingCoordinator(
            navigationController: UINavigationController(),
            student: student
        )

        coordinator
            .navigationController
            .tabBarItem
            .image = .pharusIcons.rankingTabBarIcon

        coordinator
            .navigationController
            .tabBarItem
            .selectedImage = .pharusIcons.rankingTabBarIconSelected?.withRenderingMode(.alwaysOriginal)

        coordinator.start()

        return coordinator
    }

    private func makeStudentAvatarCoordinator() -> AvatarSelectionCoordinator {
        let coordinator = AvatarSelectionCoordinator(
            navigationController: UINavigationController(),
            student: student
        )

        coordinator
            .navigationController
            .tabBarItem
            .image = .pharusIcons.avatarTabBarIcon

        coordinator
            .navigationController
            .tabBarItem
            .selectedImage = .pharusIcons.avatarTabBarIconSelected?.withRenderingMode(.alwaysOriginal)

        coordinator.start()

        return coordinator
    }

    private func makeStudentProfileCoordinator() -> StudentProfileCoordinator {
        let coordinator = StudentProfileCoordinator(
            navigationController: UINavigationController(),
            student: student
        )

        coordinator
            .navigationController
            .tabBarItem
            .image = .pharusIcons.profileTabBarIcon

        coordinator
            .navigationController
            .tabBarItem
            .selectedImage = .pharusIcons.profileTabBarIconSelected?.withRenderingMode(.alwaysOriginal)

        coordinator.start()

        return coordinator
    }
}

extension TabBarCoordinator: TabBarFlow {

}
