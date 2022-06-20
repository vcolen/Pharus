//
//  StudentProjectsRankingPresenter.swift
//  Pharus
//
//  Created by Victor Colen on 20/06/22.
//

import Foundation

class StudentProjectsRankingPresenter {
    private let coordinator: StudentProjectsRankingCoordinator
    let student: StudentModel

    init(
        coordinator: StudentProjectsRankingCoordinator,
        student: StudentModel
    ) {
        self.coordinator = coordinator
        self.student = student
    }
}
