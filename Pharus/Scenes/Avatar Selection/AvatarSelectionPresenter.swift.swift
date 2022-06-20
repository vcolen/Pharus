//
//  AvatarSelectionPresenter.swift.swift
//  Pharus
//
//  Created by Victor Colen on 20/06/22.
//

import UIKit

class AvatarSelectionPresenter {

    // MARK: - Properties

    let coordinator: Coordinator
    let student: StudentModel

    // MARK: - Initializer

    init(
        coordinator: Coordinator,
        student: StudentModel
    ) {
        self.coordinator = coordinator
        self.student = student
    }
}

// MARK: - Avatar Selection Presenting

extension AvatarSelectionPresenter: AvatarSelectionPresenting {
    func changeStudentAvatar(to avatar: String) {
        student.avatar = avatar
    }
}
