//
//  StudentHomePresenter.swift
//  Pharus
//
//  Created by Victor Colen on 16/04/22.
//

import Foundation
import CoreApp

class StudentHomePresenter: BasePresenter<StudentHomeViewable>, StudentHomePresenting {

    // MARK: - Properties
    private let coordinator: StudentHomeCoordinating
    var student: StudentModel

    // MARK: - Initializer
    init(
        coordinator: StudentHomeCoordinating,
        student: StudentModel
    ) {
        self.coordinator = coordinator
        self.student = student
    }
}

#warning("implementar")
extension StudentHomePresenter {
    func loadData() {
        student = StudentModel.shared
    }
}
