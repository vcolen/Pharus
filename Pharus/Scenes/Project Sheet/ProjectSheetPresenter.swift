//
//  ProjectSheetPresenter.swift
//  Pharus
//
//  Created by Victor Colen on 15/04/22.
//

import UIKit

class ProjectSheetPresenter {

    // MARK: - Properties

    private let coordinator: ProjectSheetCoordinator
    let project: ProjectModel
    let projectSheetContent: ProjectSheetView.SheetContent

    // MARK: - Initializer

    init(
        coordinator: ProjectSheetCoordinator,
        project: ProjectModel,
        projectSheetContent: ProjectSheetView.SheetContent
    ) {
        self.coordinator = coordinator
        self.project = project
        self.projectSheetContent = projectSheetContent
    }
}

// MARK: - Actions

extension ProjectSheetPresenter: ProjectSheetPresenting {
    func popView() {
        coordinator.popView()
    }
}
