//
//  UserProjectsCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 29/03/22.
//

import UIKit

class StudentProjectsCoordinator {

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
extension StudentProjectsCoordinator: Coordinator {
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
// MARK: - Student Projects Coordinating
extension StudentProjectsCoordinator: StudentProjectsCoordinating {
    func showStudentProject(_ project: ProjectModel) {
        let studentProjectDetailCoordinator = StudentProjectDetailCoordinator(
            navigationController: navigationController,
            project: project
        )

        studentProjectDetailCoordinator.start()
    }

    func showSubscribeAlert(of project: ProjectModel) {
        let projectSubcriptionAlertCoordinator = ProjectSubcriptionAlertCoordinator(
            navigationController: navigationController,
            project: project
        )

        projectSubcriptionAlertCoordinator.start()
    }
}
