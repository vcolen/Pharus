//
//  StudentProfileCoordinator.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 16/04/22.
//

import UIKit

class StudentProfileCoordinator {

    // MARK: - Properties
    weak var rootViewController: UINavigationController?
    private let student: StudentModel
    private let logOutHandler: () -> Void

    // MARK: - Initializer
    init(
        navigationController: UINavigationController,
        student: StudentModel,
        onLogOut logOutHandler: @escaping () -> Void
    ) {
        self.rootViewController = navigationController
        self.student = student
        self.logOutHandler = logOutHandler
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
            let logoutAlertCoordinator = LogoutAlertCoordinator(
                navigationController: navigationController,
                onLogOut: logOutHandler
            )

            logoutAlertCoordinator.start()
        }
    }
}
