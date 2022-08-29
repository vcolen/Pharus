//
//  StudentProfileCoordinator.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 16/04/22.
//

import UIKit
import CoreApp
import AlertFeature

class StudentProfileCoordinator {

    // MARK: - Properties
    weak var rootViewController: UINavigationController?
    private let student: Student
    private let logoutHandler: () -> Void

    // MARK: - Initializer
    init(
        rootViewController: UINavigationController,
        student: Student,
        onLogout logoutHandler: @escaping () -> Void
    ) {
        self.rootViewController = rootViewController
        self.student = student
        self.logoutHandler = logoutHandler
    }
}

// MARK: - Coordinator
extension StudentProfileCoordinator: Coordinator {
    func start() {
        let studentProfilePresenter = StudentProfilePresenter(
            coordinator: self,
            student: student
        )

        let studentProfileViewController = StudentProfileViewController(
            presenter: studentProfilePresenter
        )

        studentProfileViewController.title = "Perfil"

        rootViewController?.setNavigationBarHidden(false, animated: true)
        rootViewController?.pushViewController(studentProfileViewController, animated: true)
    }
}
// MARK: - Actions
extension StudentProfileCoordinator: StudentProfileCoordinating {
    func showLogOutAlert() {
        if let navigationController = rootViewController {
            LogoutAlertCoordinator(
                rootViewController: navigationController,
                onLogout: logoutHandler
            ).start()
        }
    }
}
