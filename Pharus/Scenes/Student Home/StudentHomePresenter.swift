//
//  StudentHomePresenter.swift
//  Pharus
//
//  Created by Victor Colen on 16/04/22.
//

import Foundation

class StudentHomePresenter: StudentHomePresenting {

    // MARK: - Properties

    private var coordinator: StudentHomeCoordinator
    var student: StudentModel

    // MARK: - Initializer

    init(
        coordinator: StudentHomeCoordinator,
        student: StudentModel
    ) {
        self.coordinator = coordinator
        self.student = student
    }
}
