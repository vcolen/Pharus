//
//  StudentHomeCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 16/04/22.
//

import UIKit

class StudentHomeCoordinator: Coordinator {

    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    private var student: StudentModel

    init(
        navigationController: UINavigationController,
        student: StudentModel
    ) {
        self.navigationController = navigationController
        self.student = student
    }

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

extension StudentHomeCoordinator: StudentHomeCoordinating { }
