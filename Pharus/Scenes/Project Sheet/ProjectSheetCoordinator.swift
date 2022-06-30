//
//  ProjectSheetCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 15/04/22.
//

import UIKit

struct ProjectSheetCoordinator {

    // MARK: - Properties
    private weak var rootViewController: UINavigationController?
    private let project: ProjectModel
    private let projectSheetContent: ProjectSheetView.SheetContent

    // MARK: - Initializer
    init(
        rootViewController: UINavigationController,
        project: ProjectModel,
        projectSheetContent: ProjectSheetView.SheetContent
    ) {
        self.rootViewController = rootViewController
        self.project = project
        self.projectSheetContent = projectSheetContent
    }
}

// MARK: - Coordinator
extension ProjectSheetCoordinator: Coordinator {
    func start() {
        let projectSheetPresenter = ProjectSheetPresenter(
            coordinator: self,
            project: project,
            projectSheetContent: projectSheetContent
        )

        let projectSheetViewController = ProjectSheetViewController(
            presenter: projectSheetPresenter
        )

        rootViewController?.present(projectSheetViewController, animated: true)
    }
}
// MARK: - Actions
extension ProjectSheetCoordinator: ProjectSheetCoordinating {
    func popView() {
        rootViewController?.dismiss(animated: true)
    }
}
