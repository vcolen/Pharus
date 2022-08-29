//
//  AvatarSelectionPresenter.swift.swift
//  Pharus
//
//  Created by Victor Colen on 20/06/22.
//

import UIKit
import CoreApp

class AvatarSelectionPresenter: BasePresenter<AvatarSelectionViewable> {

    // MARK: - Properties
    private let coordinator: AvatarSelectionCoordinating
    var student: Student

    // MARK: - Initializer
    init(
        coordinator: AvatarSelectionCoordinating,
        student: Student
    ) {
        self.coordinator = coordinator
        self.student = student
    }
}

// MARK: - Avatar Selection Presenting
extension AvatarSelectionPresenter: AvatarSelectionPresenting {
    func changeStudentAvatar(to avatar: String) {
        student.avatar = avatar
        submit()
    }
}

extension AvatarSelectionPresenter {
    func submit() {
#warning("implementar")
        // StudentManager.shared.student = student
    }

    func loadData() {
#warning("implementar")
        // self.student = StudentManager.shared.getStudent()
    }
}
