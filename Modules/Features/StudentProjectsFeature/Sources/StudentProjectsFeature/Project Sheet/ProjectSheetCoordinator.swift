//
//  ProjectSheetCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 15/04/22.
//

import UIKit
import CoreKit
import CoreApp

struct ProjectSheetCoordinator {

    // MARK: - Properties
    private weak var rootViewController: UINavigationController?
    private let projectSheetContent: ProjectSheetView.SheetContent
    private let project: Project

    // MARK: - Initializer
    init(
        rootViewController: UINavigationController,
        project: Project,
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
