//
//  AvatarSelectionPresenter.swift.swift
//  Pharus
//
//  Created by Victor Colen on 20/06/22.
//

import UIKit
import CoreApp
import InjectionKit
import CoreKit

class AvatarSelectionPresenter: BasePresenter<AvatarSelectionViewable> {

    // MARK: - Properties
    private let coordinator: AvatarSelectionCoordinating
    var student: Student?
    @Injected var getStudentUseCaseProtocol: GetStudentUseCaseProtocol
    @Injected var updateStudentUseCaseProtocol: UpdateStudentUseCaseProtocol

    // MARK: - Initializer
    init(coordinator: AvatarSelectionCoordinating) {
        self.coordinator = coordinator
    }
}

// MARK: - Avatar Selection Presenting
extension AvatarSelectionPresenter: AvatarSelectionPresenting {
    func changeStudentAvatar(to avatar: String) {
        var student = getStudentUseCaseProtocol()
        student.avatar = avatar
        updateStudentUseCaseProtocol(student)
    }
}

extension AvatarSelectionPresenter {
    func loadData() {
        view?.updateView(with: getStudentUseCaseProtocol())
    }
}
