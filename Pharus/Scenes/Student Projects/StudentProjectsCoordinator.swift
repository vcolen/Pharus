//
//  UserProjectsCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 29/03/22.
//

import UIKit

class StudentProjectsCoordinator: Coordinator {

    // MARK: - Properties

    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    private let student: StudentModel

    // MARK: - Initializer

    init(
        navigationController: UINavigationController,
        student: StudentModel
    ) {
        self.navigationController = navigationController
        self.student = student
    }

    func start() {
        let studentProjectsPresenter = StudentProjectsPresenter(
            coordinator: self,
            student: student
        )

        let studentProjectsViewController = StudentProjectsViewController(
            presenter: studentProjectsPresenter
        )

        navigationController.setNavigationBarHidden(false, animated: true)

        navigationController.pushViewController(studentProjectsViewController, animated: true)
    }
}

// MARK: - Actions

extension StudentProjectsCoordinator: StudentProjectsCoordinating {
    func showStudentProject(_ project: ProjectModel) {
        let studentProjectDetailCoordinator = StudentProjectDetailCoordinator(
            navigationController: navigationController,
            project: project
        )

        self.coordinate(to: studentProjectDetailCoordinator)
    }

    func showSubscribeAlert(of project: ProjectModel) {
        let projectSubcriptionAlertCoordinator = ProjectSubcriptionAlertCoordinator(
            navigationController: navigationController,
            project: project
        )

        coordinate(to: projectSubcriptionAlertCoordinator)
    }
}
