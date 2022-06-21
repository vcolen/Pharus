//
//  StudentProjectsRankingCoordinator.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 05/04/22.
//

import UIKit

class StudentProjectsRankingCoordinator: Coordinator {

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
        let studentProjectsRankingPresenter = StudentProjectsRankingPresenter(
            coordinator: self,
            student: student
        )

        let studentProjectsRankingViewController = StudentProjectsRankingViewController(
            presenter: studentProjectsRankingPresenter
        )

        navigationController.pushViewController(
            studentProjectsRankingViewController,
            animated: true
        )
    }
}
