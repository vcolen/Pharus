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
    private weak var rootViewController: UITabBarController?

    // MARK: - Initializer
    init(
        rootViewController: UITabBarController,
        student: StudentModel
    ) {
        self.rootViewController = rootViewController
        self.student = student
    }

    // MARK: - Actions
    private func makeStudentHomeCoordinator() {
        StudentHomeTabCoordinator(
            rootViewController: rootViewController ?? UITabBarController(),
            student: student
        ).start()
    }

    private func makeStudentProjectsCoordinator() {
        StudentProjectsTabCoordinator(
            rootViewController: rootViewController ?? UITabBarController(),
            student: student
        ).start()
    }

    private func makeStudentProjectsRankingCoordinator() {
        StudentProjectsRankingTabCoordinator(
            rootViewController: rootViewController ?? UITabBarController(),
            student: student
        ).start()
    }

    private func makeStudentAvatarCoordinator() {
        AvatarSelectionTabCoordinator(
            rootViewController: rootViewController ?? UITabBarController(),
            student: student
        ).start()
    }

    private func makeStudentProfileCoordinator() {
        StudentProfileTabCoordinator(
            rootViewController: rootViewController ?? UITabBarController(),
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
    }
}

// MARK: - Coordinating
extension MainTabBarCoordinator: TabBarCoordinating {}
