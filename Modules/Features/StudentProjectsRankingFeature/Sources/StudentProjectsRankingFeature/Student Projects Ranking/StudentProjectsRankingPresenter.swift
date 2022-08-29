//
//  StudentProjectsRankingPresenter.swift
//  Pharus
//
//  Created by Victor Colen on 20/06/22.
//

import Foundation
import CoreApp

class StudentProjectsRankingPresenter: BasePresenter<StudentProjectsRankingViewable>, StudentProjectsRankingPresenting {
    private let coordinator: StudentProjectsRankingCoordinating
    let student: Student

    init(
        coordinator: StudentProjectsRankingCoordinating,
        student: Student
    ) {
        self.coordinator = coordinator
        self.student = student
    }
}
