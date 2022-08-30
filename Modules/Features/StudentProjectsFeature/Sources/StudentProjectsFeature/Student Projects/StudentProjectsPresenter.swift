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
    private let coordinator: StudentProjectsCoordinating
    var student: Student?
    @Injected var getStudentUseCaseProtocol: GetStudentUseCaseProtocol

    // MARK: - Initializer
    init(coordinator: StudentProjectsCoordinating) {
        self.coordinator = coordinator
    }

    // MARK: - Actions
    func getStudent() -> Student {
        getStudentUseCaseProtocol()
    }

    func showStudentProject(project: Project) {
        coordinator.showStudentProject(project)
    }

    func showSubscribeAlert(of project: Project, at index: Int) {
        coordinator.showSubscribeAlert(of: project) {
            self.student?.projects[index].isSubscribed = true
        }
    }
}
