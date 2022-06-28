//
//  StudentHomeCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 16/04/22.
//

import UIKit

struct StudentHomeCoordinator {

    // MARK: - Properties
    let navigationController: UINavigationController
    private let student: StudentModel

    init(
        navigationController: UINavigationController,
        student: StudentModel
    ) {
        self.navigationController = navigationController
        self.student = student
    }
}

// MARK: - Coordinator
extension StudentHomeCoordinator: Coordinator {
    func start() {
        let studentHomePresenter = StudentHomePresenter(
            coordinator: self,
            student: student
        )

        let studentHomeViewController = StudentHomeViewController(
            presenter: studentHomePresenter
        )

        navigationController.setNavigationBarHidden(true, animated: true)
        navigationController.tabBarController?.tabBar.isHidden = false

        navigationController.pushViewController(studentHomeViewController, animated: true)
    }
}
// MARK: - Student Home Coordinating
extension StudentHomeCoordinator: StudentHomeCoordinating { }
