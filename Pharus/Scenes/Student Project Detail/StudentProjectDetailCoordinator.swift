//
//  StudentProjectDetailCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 11/04/22.
//

import UIKit

class StudentProjectDetailCoordinator: Coordinator {

    // MARK: - Properties

    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    private let project: ProjectModel

    // MARK: - Initializer

    init(
        navigationController: UINavigationController,
        project: ProjectModel
    ) {
        self.navigationController = navigationController
        self.project = project
    }

    func start() {
        let studentProjectDetailPresenter = StudentProjectDetailPresenter(
            coordinator: self,
            project: project
        )

        let studentProjectDetailViewController = StudentProjectDetailViewController(
            presenter: studentProjectDetailPresenter
        )

        navigationController.pushViewController(studentProjectDetailViewController, animated: true)
    }
}

// MARK: - Actions

extension StudentProjectDetailCoordinator: StudentProjectDetailCoordinating {
    func showProjectRules() {
        let projectSheetView = ProjectSheetView(
            project: project,
            sheetContent: .activities
        )

        let projectSheetCoordinator = ProjectSheetCoordinator(
            navigationController: navigationController,
            projectSheetView: projectSheetView
        )

        coordinate(to: projectSheetCoordinator)
    }

    func showMentorReview() {
        let projectSheetView = ProjectSheetView(
            project: project,
            sheetContent: .mentorReview
        )

        let projectSheetCoordinator = ProjectSheetCoordinator(
            navigationController: navigationController,
            projectSheetView: projectSheetView
        )

        coordinate(to: projectSheetCoordinator)
    }

    func showSendFileView() {
        let sendFileCoordinator = SendFileCoordinator(
            navigationController: navigationController,
            project: project
        )

        coordinate(to: sendFileCoordinator)
    }
}
