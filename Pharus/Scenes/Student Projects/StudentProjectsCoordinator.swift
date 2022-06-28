//
//  UserProjectsCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 29/03/22.
//

import UIKit

struct StudentProjectsCoordinator {

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
extension StudentProjectsCoordinator: Coordinator {
    func start() {
        let studentProjectsPresenter = StudentProjectsPresenter(
            coordinator: self,
            student: student
        )
        let studentProjectsViewController = StudentProjectsViewController(
            presenter: studentProjectsPresenter
        )

        studentProjectsViewController.title = "Seus projetos"

        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.pushViewController(studentProjectsViewController, animated: true)
    }
}
// MARK: - Student Projects Coordinating
extension StudentProjectsCoordinator: StudentProjectsCoordinating {
    func showStudentProject(_ project: ProjectModel) {
        if let navigationController = navigationController {
            let studentProjectDetailCoordinator = StudentProjectDetailCoordinator(
                navigationController: navigationController,
                project: project
            )

            studentProjectDetailCoordinator.start()
        }
    }

    func showSubscribeAlert(of project: ProjectModel) {
        if let navigationController = navigationController {
            let projectSubcriptionAlertCoordinator = ProjectSubcriptionAlertCoordinator(
                navigationController: navigationController,
                project: project
            )

            projectSubcriptionAlertCoordinator.start()
        }
    }
}
