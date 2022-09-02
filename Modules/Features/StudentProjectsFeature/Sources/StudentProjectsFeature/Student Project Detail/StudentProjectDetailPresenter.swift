//
//  StudentProjectDetailPresenter.swift
//  Pharus
//
//  Created by Victor Colen on 11/04/22.
//

import UIKit
import CoreKit
import CoreApp
import InjectionKit

class StudentProjectDetailPresenter: BasePresenter<StudentProjectDetailViewable>, StudentProjectDetailPresenting {

    // MARK: - Properties
    private let coordinator: StudentProjectDetailCoordinator
    var projectId: Int
    @Injected var toggleTaskCompletionUseCase: ToggleTaskCompletionUseCaseProtocol
    @Injected var getProjectUseCaseProtocol: GetProjectUseCaseProtocol

    // MARK: - Initializer
    init(
        coordinator: StudentProjectDetailCoordinator,
        project: Int
    ) {
        self.coordinator = coordinator
        self.projectId = project
    }

    // MARK: - Actions
    func showProjectRules() {
        coordinator.showProjectRules()
    }

    func showMentorReview() {
        coordinator.showMentorReview()
    }

    func showUploadFileView() {
        coordinator.showSendFileView()
    }

    func toggleTaskCompletedStatus(taskId: Int) {
        toggleTaskCompletionUseCase(taskId: taskId, projectId: projectId)
    }

    func loadData() {
        view?.updateView(with: getProjectUseCaseProtocol(id: projectId))
    }
}
