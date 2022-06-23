//
//  StudentHomePresenter.swift
//  Pharus
//
//  Created by Victor Colen on 16/04/22.
//

import Foundation

class StudentHomePresenter: BasePresenter<StudentHomeViewable>, StudentHomePresenting {

    // MARK: - Properties
    private let coordinator: StudentHomeCoordinating
    let student: StudentModel

    // MARK: - Initializer
    init(
        coordinator: StudentHomeCoordinating,
        student: StudentModel
    ) {
        self.coordinator = coordinator
        self.student = student
    }
}
