//
//  StudentProjectDetailCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 11/04/22.
//

import UIKit

struct StudentProjectDetailCoordinator {

    // MARK: - Properties
    private weak var rootViewController: UINavigationController?
    private let project: ProjectModel

    // MARK: - Initializer
    init(
        navigationController: UINavigationController,
        project: ProjectModel
    ) {
        self.rootViewController = navigationController
        self.project = project
    }
}

// MARK: - Coordinator
extension StudentProjectDetailCoordinator: Coordinator {
    func start() {
        let studentProjectDetailPresenter = StudentProjectDetailPresenter(
            coordinator: self,
            project: project
        )
        let studentProjectDetailViewController = StudentProjectDetailViewController(
            presenter: studentProjectDetailPresenter
        )

        studentProjectDetailViewController.title = project.name
        rootViewController?.pushViewController(studentProjectDetailViewController, animated: true)
    }
}

// MARK: - Student Project Detail Coordinating
extension StudentProjectDetailCoordinator: StudentProjectDetailCoordinating {
    func showProjectRules() {

        if let navigationController = rootViewController {
            let projectSheetCoordinator = ProjectSheetCoordinator(
                navigationController: navigationController,
                project: project,
                projectSheetContent: .activities
            )

            projectSheetCoordinator.start()
        }
    }

    func showMentorReview() {

        if let navigationController = rootViewController {
            let projectSheetCoordinator = ProjectSheetCoordinator(
                navigationController: navigationController,
                project: project,
                projectSheetContent: .mentorReview
            )

            projectSheetCoordinator.start()
        }
    }

    func showSendFileView() {
        if let navigationController = rootViewController {
            let sendFileCoordinator = SendFileCoordinator(
                navigationController: navigationController,
                project: project
            )

            sendFileCoordinator.start()
        }
    }
}
