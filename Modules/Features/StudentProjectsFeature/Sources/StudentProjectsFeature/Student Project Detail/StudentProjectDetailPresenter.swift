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
    var project: Project
    @Injected var toggleTaskCompletionUseCase: ToggleTaskCompletionUseCaseProtocol
    @Injected var getStudentUseCaseProtocol: GetStudentUseCaseProtocol

    // MARK: - Initializer
    init(
        coordinator: StudentProjectDetailCoordinator,
        project: Project
    ) {
        self.coordinator = coordinator
        self.project = project
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
        toggleTaskCompletionUseCase(taskId: taskId, projectId: project.id)
    }

    func loadData() {
        view?.updateView(with: getStudentUseCaseProtocol().projects[project.id - 1])
    }
}
