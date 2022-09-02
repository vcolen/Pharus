//
//  UserProjectsCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 29/03/22.
//

import UIKit
import CoreApp
import AlertFeature
import CoreKit

struct StudentProjectsCoordinator {

    // MARK: - Properties
    weak var rootViewController: UINavigationController?

    // MARK: - Initializer
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
}

// MARK: - Coordinator
extension StudentProjectsCoordinator: Coordinator {
    func start() {
        let studentProjectsPresenter = StudentProjectsPresenter(coordinator: self)
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
    func showStudentProject(_ project: Project) {
        if let navigationController = rootViewController {
            StudentProjectDetailCoordinator(
                rootViewController: navigationController,
                project: project.id
            ).start()
        }
    }

    func showSubscribeAlert(
        of project: Project,
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
