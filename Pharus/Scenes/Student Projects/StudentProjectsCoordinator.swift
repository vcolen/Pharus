//
//  UserProjectsCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 29/03/22.
//

import UIKit

struct StudentProjectsCoordinator {

    // MARK: - Properties
    weak var rootViewController: UINavigationController?
    private let student: StudentModel

    // MARK: - Initializer
    init(
        rootViewController: UINavigationController,
        student: StudentModel
    ) {
        self.rootViewController = rootViewController
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

        rootViewController?.setNavigationBarHidden(false, animated: true)
        rootViewController?.pushViewController(studentProjectsViewController, animated: true)
    }
}
// MARK: - Student Projects Coordinating
extension StudentProjectsCoordinator: StudentProjectsCoordinating {
    func showStudentProject(_ project: ProjectModel) {
        if let navigationController = rootViewController {
            StudentProjectDetailCoordinator(
                rootViewController: navigationController,
                project: project
            ).start()
        }
    }

    func showSubscribeAlert(
        of project: ProjectModel,
        onCommit commitHandler: @escaping () -> Void
    ) {
        if let navigationController = rootViewController {
            ProjectSubscriptionAlertCoordinator(
                rootViewController: navigationController,
                project: project,
                onSubscription: commitHandler
            ).start()
        }
    }
}
