//
//  StudentProfilePresenter.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 16/04/22.
//

import Foundation
import CoreApp
import InjectionKit
import CoreKit

class StudentProfilePresenter: BasePresenter<StudentProfileViewable> {

    // MARK: - Properties
    private let coordinator: StudentProfileCoordinating
    var student: Student?
    @Injected var getStudentUseCaseProtocol: GetStudentUseCaseProtocol

    // MARK: - Initializer
    init(coordinator: StudentProfileCoordinating) {
        self.coordinator = coordinator
    }
}

// MARK: - Actions
extension StudentProfilePresenter: StudentProfilePresenting {
    func showLogoutAlert() {
        coordinator.showLogOutAlert()
    }
}

extension StudentProfilePresenter {
    func loadData() {
        view?.updateView(with: getStudentUseCaseProtocol())
    }
}
