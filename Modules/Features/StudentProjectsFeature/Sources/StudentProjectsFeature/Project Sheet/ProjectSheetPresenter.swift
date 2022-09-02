//
//  ProjectSheetPresenter.swift
//  Pharus
//
//  Created by Victor Colen on 15/04/22.
//

import UIKit
import CoreKit
import CoreApp
import InjectionKit

class ProjectSheetPresenter: BasePresenter<ProjectSheetViewable> {

    // MARK: - Properties
    private let coordinator: ProjectSheetCoordinating
    let projectId: Int
    let projectSheetContent: ProjectSheetView.SheetContent
    @Injected var getProjectUseCaseProtocol: GetProjectUseCaseProtocol

    // MARK: - Initializer
    init(
        coordinator: ProjectSheetCoordinating,
        projectId: Int,
        projectSheetContent: ProjectSheetView.SheetContent
    ) {
        self.coordinator = coordinator
        self.projectId = projectId
        self.projectSheetContent = projectSheetContent
    }
}

// MARK: - Actions
extension ProjectSheetPresenter: ProjectSheetPresenting {
    func popView() {
        coordinator.popView()
    }

    func loadData() {
        view?.updateView(with: getProjectUseCaseProtocol(id: projectId))
    }
}
