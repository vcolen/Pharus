//
//  StudentProfileCoordinator.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 16/04/22.
//

import UIKit

class StudentProfileCoordinator {

    // MARK: - Properties
    weak var navigationController: UINavigationController?
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

        studentProfileViewController.title = "Perfil"

        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.pushViewController(studentProfileViewController, animated: true)
    }
}
// MARK: - Actions
extension StudentProfileCoordinator: StudentProfileCoordinating {
    func showLogOutAlert() {

        if let navigationController = navigationController {
            let logoutAlertCoordinator = LogoutAlertCoordinator(
                navigationController: navigationController
            )

            logoutAlertCoordinator.start()
        }
    }
}
