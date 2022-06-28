//
//  MainTabBarCoordinator.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 05/04/22.
//

import UIKit

struct MainTabBarCoordinator {

    // MARK: - Properties
    private let student: StudentModel
    private weak var navigationController: UINavigationController?
    private let rootViewController: UITabBarController

    // MARK: - Initializer
    init(
        navigationController: UINavigationController,
        tabBarViewController: UITabBarController,
        student: StudentModel
    ) {
        self.navigationController = navigationController
        self.rootViewController = tabBarViewController
        self.student = student
    }

    // MARK: - Actions
    private func makeStudentHomeCoordinator() {
        StudentHomeTabCoordinator(
            rootViewController: rootViewController,
            student: student
        ).start()
    }

    private func makeStudentProjectsCoordinator() {
        StudentProjectsTabCoordinator(
            rootViewController: rootViewController,
            student: student
        ).start()
    }

    private func makeStudentProjectsRankingCoordinator() {
        StudentProjectsRankingTabCoordinator(
            rootViewController: rootViewController,
            student: student
        ).start()
    }

    private func makeStudentAvatarCoordinator() {
        AvatarSelectionTabCoordinator(
            rootViewController: rootViewController,
            student: student
        ).start()
    }

    private func makeStudentProfileCoordinator() {
        StudentProfileTabCoordinator(
            rootViewController: rootViewController,
            student: student
        ).start()
    }
}

// MARK: - Coordinator
extension MainTabBarCoordinator: Coordinator {
    func start() {
        makeStudentHomeCoordinator()
        makeStudentProjectsCoordinator()
        makeStudentProjectsRankingCoordinator()
        makeStudentAvatarCoordinator()
        makeStudentProfileCoordinator()

        navigationController?.setViewControllers([rootViewController], animated: true)
    }
}

// MARK: - Coordinating
extension MainTabBarCoordinator: TabBarCoordinating {}
