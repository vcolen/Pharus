//
//  StudentProjectsRankingCoordinator.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 05/04/22.
//

import UIKit

class StudentProjectsRankingCoordinator {

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
extension StudentProjectsRankingCoordinator: Coordinator {
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

// MARK: - Student Projects Ranking Coordinating
extension StudentProjectsRankingCoordinator: StudentProjectsRankingCoordinating { }
