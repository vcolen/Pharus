//
//  StudentHomePresenter.swift
//  Pharus
//
//  Created by Victor Colen on 16/04/22.
//

import Foundation
import CoreApp
import InjectionKit
import CoreKit

class StudentHomePresenter: BasePresenter<StudentHomeViewable>, StudentHomePresenting {

    // MARK: - Properties
    private let coordinator: StudentHomeCoordinating
    var student: Student?
    @Injected var getStudentUseCaseProtocol: GetStudentUseCaseProtocol

    // MARK: - Initializer
    init(coordinator: StudentHomeCoordinating) {
        self.coordinator = coordinator
    }
}

extension StudentHomePresenter {
    func loadData() {
        view?.updateView(with: getStudentUseCaseProtocol())
    }
}
