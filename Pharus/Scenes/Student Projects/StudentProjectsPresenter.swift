//
//  StudentProjectsPresenter.swift
//  Pharus
//
//  Created by Victor Colen on 29/03/22.
//

import Foundation

class StudentProjectsPresenter: BasePresenter<StudentProjectsViewable>, StudentProjectsPresenting {

    // MARK: - Properties
    private let coordinator: StudentProjectsCoordinating
    var student: StudentModel

    // MARK: - Initializer
    init(
        coordinator: StudentProjectsCoordinating,
        student: StudentModel
    ) {
        self.coordinator = coordinator
        self.student = student
    }

    // MARK: - Actions

    func showStudentProject(project: ProjectModel) {
        coordinator.showStudentProject(project)
    }

    func showSubscribeAlert(of project: ProjectModel, at index: Int) {
        coordinator.showSubscribeAlert(of: project) {
            self.student.projects[index].isSubscribed = true
        }
    }
}
