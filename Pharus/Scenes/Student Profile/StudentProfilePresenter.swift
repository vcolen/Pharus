//
//  StudentProfilePresenter.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 16/04/22.
//

import Foundation

class StudentProfilePresenter: BasePresenter<StudentProfileViewable> {

    // MARK: - Properties

    private let coordinator: StudentProfileCoordinating
    let student: StudentModel

    // MARK: - Initializer

    init(
        coordinator: StudentProfileCoordinating,
        student: StudentModel
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
