//
//  StudentProjectsPresenter.swift
//  Pharus
//
//  Created by Victor Colen on 29/03/22.
//

import Foundation
import CoreApp
import InjectionKit
import CoreKit

class StudentProjectsPresenter: BasePresenter<StudentProjectsViewable>, StudentProjectsPresenting {

    // MARK: - Properties
    @Injected var getStudentUseCaseProtocol: GetStudentUseCaseProtocol
    @Injected var subscribeToProjectUseCaseProtocol: SubscribeToProjectUseCaseProtocol
    private let coordinator: StudentProjectsCoordinating
    var student: Student?

    // MARK: - Initializer
    init(coordinator: StudentProjectsCoordinating) {
        self.coordinator = coordinator
    }

    // MARK: - Actions
    func loadData() {
        view?.updateView(with: getStudentUseCaseProtocol())
    }

    func showStudentProject(project: Project) {
        coordinator.showStudentProject(project)
    }

    func showSubscribeAlert(of project: Project, at index: Int) {
        coordinator.showSubscribeAlert(of: project) {
            self.subscribeToProjectUseCaseProtocol(projectId: project.id)
            self.loadData()
        }
    }
}
