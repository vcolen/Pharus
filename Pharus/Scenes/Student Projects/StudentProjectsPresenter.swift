//
//  StudentProjectsPresenter.swift
//  Pharus
//
//  Created by Victor Colen on 29/03/22.
//

import Foundation

class StudentProjectsPresenter: StudentProjectsPresenting {

    // MARK: - Properties

    private let coordinator: StudentProjectsCoordinator
    let student: StudentModel

    // MARK: - Initializer

    init(
        coordinator: StudentProjectsCoordinator,
        student: StudentModel
    ) {
        self.coordinator = coordinator
        self.student = student
    }

    // MARK: - Actions

    func showStudentProject(project: ProjectModel) {
        coordinator.showStudentProject(project)
    }

    func showSubscribeAlert(of project: ProjectModel) {
        coordinator.showSubscribeAlert(of: project)
    }
}
