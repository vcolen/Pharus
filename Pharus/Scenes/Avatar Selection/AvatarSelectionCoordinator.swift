//
//  AvatarSelectionCoordinator.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 06/04/22.
//

import UIKit

struct AvatarSelectionCoordinator {

    // MARK: - Properties
    weak var rootViewController: UINavigationController?
    private let student: StudentModel

    // MARK: - Initializer
    init(
        navigationController: UINavigationController,
        student: StudentModel
    ) {
        self.rootViewController = navigationController
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

        rootViewController?.pushViewController(studentAvatarViewController, animated: true)
    }
}
// MARK: - Avatar Selection Coordinating
extension AvatarSelectionCoordinator: AvatarSelectionCoordinating { }
