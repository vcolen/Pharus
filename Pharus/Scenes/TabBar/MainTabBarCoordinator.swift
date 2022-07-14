//
//  MainTabBarCoordinator.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 05/04/22.
//

import UIKit

struct MainTabBarCoordinator {

    // MARK: - Properties
    private var student: StudentModel
    private let logoutHandler: () -> Void
    private weak var rootViewController: UITabBarController?

    // MARK: - Initializer
    init(
        rootViewController: UITabBarController,
        student: StudentModel,
        onLogout logoutHandler: @escaping () -> Void
    ) {
        self.rootViewController = rootViewController
        self.student = student
        self.logoutHandler = logoutHandler
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
            student: student,
            onLogout: logoutHandler
        ).start()
    }

    mutating func changeAvatar(to avatar: String) {
        student.avatar = avatar
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
