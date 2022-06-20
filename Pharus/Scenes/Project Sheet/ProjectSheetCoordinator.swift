//
//  ProjectSheetCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 15/04/22.
//

import UIKit

class ProjectSheetCoordinator: Coordinator {

    // MARK: - Properties

    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    private let project: ProjectModel
    private let projectSheetContent: ProjectSheetView.SheetContent

    // MARK: - Initializer

    init(
        navigationController: UINavigationController,
        project: ProjectModel,
        projectSheetContent: ProjectSheetView.SheetContent
    ) {
        self.navigationController = navigationController
        self.project = project
        self.projectSheetContent = projectSheetContent
    }

    func start() {

        let projectSheetPresenter = ProjectSheetPresenter(
            coordinator: self,
            project: project,
            projectSheetContent: projectSheetContent
        )

        let projectSheetViewController = ProjectSheetViewController(
            presenter: projectSheetPresenter
        )

        navigationController.present(projectSheetViewController, animated: true)
    }
}

// MARK: - Actions

extension ProjectSheetCoordinator: ProjectSheetCoordinating {
    func popView() {
        navigationController.dismiss(animated: true)
    }
}
