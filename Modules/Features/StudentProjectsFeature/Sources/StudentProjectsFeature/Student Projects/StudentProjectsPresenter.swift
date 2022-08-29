//
//  StudentProjectsPresenter.swift
//  Pharus
//
//  Created by Victor Colen on 29/03/22.
//

import Foundation
import CoreApp

class StudentProjectsPresenter: BasePresenter<StudentProjectsViewable>, StudentProjectsPresenting {

    // MARK: - Properties
    private let coordinator: StudentProjectsCoordinating
    var student: Student

    // MARK: - Initializer
    init(
        coordinator: StudentProjectsCoordinating,
        student: Student
    ) {
        self.coordinator = coordinator
        self.student = student
    }

    // MARK: - Actions

    func showStudentProject(project: Project) {
        coordinator.showStudentProject(project)
    }

    func showSubscribeAlert(of project: Project, at index: Int) {
        coordinator.showSubscribeAlert(of: project) {
            self.student.projects[index].isSubscribed = true
        }
    }
}
