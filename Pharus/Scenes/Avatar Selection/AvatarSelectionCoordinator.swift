//
//  AvatarSelectionCoordinator.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 06/04/22.
//

import UIKit

class AvatarSelectionCoordinator: Coordinator {

    // MARK: - Properties

    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    private let student: StudentModel

    // MARK: - Initializer

    init(
        navigationController: UINavigationController,
        student: StudentModel
    ) {
        self.navigationController = navigationController
        self.student = student
    }

    func start() {
        let studentAvatarSelectionPresenter = AvatarSelectionPresenter(
            coordinator: self,
            student: student
        )

        let studentAvatarViewController = AvatarSelectionViewController(
            presenter: studentAvatarSelectionPresenter
        )

        navigationController.pushViewController(studentAvatarViewController, animated: true)
    }
}

extension AvatarSelectionCoordinator: AvatarSelectionCoordinating { }
