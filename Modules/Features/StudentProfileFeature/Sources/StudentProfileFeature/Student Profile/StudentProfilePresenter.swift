//
//  StudentProfilePresenter.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 16/04/22.
//

import Foundation
import CoreApp

class StudentProfilePresenter: BasePresenter<StudentProfileViewable> {

    // MARK: - Properties
    private let coordinator: StudentProfileCoordinating
    var student: Student

    // MARK: - Initializer
    init(
        coordinator: StudentProfileCoordinating,
        student: Student
    ) {
        self.coordinator = coordinator
        self.student = student
    }
}

// MARK: - Actions
extension StudentProfilePresenter: StudentProfilePresenting {
    func showLogoutAlert() {
        coordinator.showLogOutAlert()
    }
}

extension StudentProfilePresenter {
    #warning("implementar")
    func loadData() {
        student = Student.shared
    }
}
