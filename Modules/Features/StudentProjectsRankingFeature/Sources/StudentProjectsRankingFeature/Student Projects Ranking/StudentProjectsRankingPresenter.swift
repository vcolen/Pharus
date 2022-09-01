//
//  StudentProjectsRankingPresenter.swift
//  Pharus
//
//  Created by Victor Colen on 20/06/22.
//

import Foundation
import CoreApp
import InjectionKit
import CoreKit

class StudentProjectsRankingPresenter: BasePresenter<StudentProjectsRankingViewable>, StudentProjectsRankingPresenting {
    private let coordinator: StudentProjectsRankingCoordinating
    var student: Student?
    @Injected var getStudentUseCaseProtocol: GetStudentUseCaseProtocol

    init(coordinator: StudentProjectsRankingCoordinating) {
        self.coordinator = coordinator
    }

    func loadData() {
        view?.updateView(with: getStudentUseCaseProtocol().projects)
    }
}
