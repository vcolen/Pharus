//
//  AvatarSelectionCoordinator.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 06/04/22.
//

import UIKit

class AvatarSelectionCoordinator {

    // MARK: - Properties
    let navigationController: UINavigationController
    private let student: StudentModel

    // MARK: - Initializer
    init(
        navigationController: UINavigationController,
        student: StudentModel
    ) {
        self.navigationController = navigationController
        self.student = student
    }
}

// MARK: - Coordinator
extension AvatarSelectionCoordinator: Coordinator {
    func start() {
        let studentAvatarSelectionPresenter = AvatarSelectionPresenter(
            coordinator: self,
            student: student
        )

        let studentAvatarViewController = AvatarSelectionViewController(
            presenter: studentAvatarSelectionPresenter
        )

        studentAvatarViewController.title = "Avatar"

        navigationController.pushViewController(studentAvatarViewController, animated: true)
    }
}
// MARK: - Avatar Selection Coordinating
extension AvatarSelectionCoordinator: AvatarSelectionCoordinating { }
