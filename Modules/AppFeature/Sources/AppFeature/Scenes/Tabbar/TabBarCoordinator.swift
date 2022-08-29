//
//  TabBarCoordinator.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 05/04/22.
//

import UIKit
import CoreApp
import CoreScene
import InjectionKit

public struct TabBarCoordinator {

    // MARK: - Properties
    private let student: StudentModel
    private let logoutHandler: () -> Void
    private weak var rootViewController: UITabBarController?

    @Injected var studentHomeScene: HomeSceneProtocol
    @Injected var studentProjectsScene: StudentProjectsSceneProtocol
    @Injected var studentProjectsRankingScene: StudentProjectsRankingSceneProtocol
    @Injected var avatarSelectionScene: AvatarSelectionSceneProtocol
    @Injected var studentProfileScene: StudentProfileSceneProtocol

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
        studentHomeScene(
            rootViewController: rootViewController ?? UITabBarController(),
            student: Student.shared
        )
    }

    private func makeStudentProjectsCoordinator() {
        studentProjectsScene(
            rootViewController: rootViewController ?? UITabBarController(),
            student: Student.shared
        )
    }

    private func makeStudentProjectsRankingCoordinator() {
        studentProjectsRankingScene(
            rootViewController: rootViewController ?? UITabBarController(),
            student: student
        )
    }

    private func makeStudentAvatarCoordinator() {
        avatarSelectionScene(
            rootViewController: rootViewController ?? UITabBarController(),
            student: Student.shared
        )
    }

    private func makeStudentProfileCoordinator() {
        studentProfileScene(
            rootViewController: rootViewController ?? UITabBarController(),
            student: Student.shared,
            onLogout: logoutHandler
        )
    }
}

// MARK: - Coordinator
extension TabBarCoordinator: Coordinator {
    public func start() {
        makeStudentHomeCoordinator()
        makeStudentProjectsCoordinator()
        makeStudentProjectsRankingCoordinator()
        makeStudentAvatarCoordinator()
        makeStudentProfileCoordinator()
    }
}

// MARK: - Coordinating
extension TabBarCoordinator: TabBarCoordinating {}
