//
//  StudentProfileCoordinator.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 16/04/22.
//

import UIKit

class StudentProfileCoordinator {

    // MARK: - Properties
    let navigationController: UINavigationController
    private let student: StudentModel

    // MARK: - Initializer
    init(
        navigationController: UINavigationController,
        student: StudentModel
    ) {
        self.navigationController = navigationController
        self.student = student
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

        navigationController.setNavigationBarHidden(false, animated: true)
        navigationController.pushViewController(studentProfileViewController, animated: true)
    }
}
// MARK: - Actions
extension StudentProfileCoordinator: StudentProfileCoordinating {
    func showLogOutAlert() {
        let logoutAlertCoordinator = LogoutAlertCoordinator(
            navigationController: navigationController
        )

        logoutAlertCoordinator.start()
    }
}
