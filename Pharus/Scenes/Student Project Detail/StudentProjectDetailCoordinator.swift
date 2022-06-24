//
//  StudentProjectDetailCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 11/04/22.
//

import UIKit

class StudentProjectDetailCoordinator {

    // MARK: - Properties
    private let navigationController: UINavigationController
    private let project: ProjectModel

    // MARK: - Initializer
    init(
        navigationController: UINavigationController,
        project: ProjectModel
    ) {
        self.navigationController = navigationController
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
        var backButtonImage = UIImage(named: Constants.assets.icons.backArrowIcon)
        backButtonImage = backButtonImage?.withTintColor(
            .white,
            renderingMode: .alwaysOriginal
        )
        studentProjectDetailViewController.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: backButtonImage,
            style: .plain,
            target: self,
            action: #selector(backButtonPressed))

        navigationController.pushViewController(studentProjectDetailViewController, animated: true)
    }

    @objc func backButtonPressed() {
        navigationController.popViewController(animated: true)
    }
}

// MARK: - Student Project Detail Coordinating
extension StudentProjectDetailCoordinator: StudentProjectDetailCoordinating {
    func showProjectRules() {
        let projectSheetCoordinator = ProjectSheetCoordinator(
            navigationController: navigationController,
            project: project,
            projectSheetContent: .activities
        )

        projectSheetCoordinator.start()
    }

    func showMentorReview() {
        let projectSheetCoordinator = ProjectSheetCoordinator(
            navigationController: navigationController,
            project: project,
            projectSheetContent: .mentorReview
        )

        projectSheetCoordinator.start()
    }

    func showSendFileView() {
        let sendFileCoordinator = SendFileCoordinator(
            navigationController: navigationController,
            project: project
        )

        sendFileCoordinator.start()
    }
}
