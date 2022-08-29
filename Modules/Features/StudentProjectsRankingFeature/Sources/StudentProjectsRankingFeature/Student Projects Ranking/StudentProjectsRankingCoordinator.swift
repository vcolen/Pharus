//
//  StudentProjectsRankingCoordinator.swift
//  Pharus
//
//  Created by Jéssica Serqueira on 05/04/22.
//

import UIKit
import CoreApp

struct StudentProjectsRankingCoordinator {

    // MARK: - Properties
    weak var rootViewController: UINavigationController?
    private let student: Student

    // MARK: - Initializer

    init(
        rootViewController: UINavigationController,
        student: Student
    ) {
        self.rootViewController = rootViewController
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

        studentProjectsRankingViewController.title = "Seus Rankings"

        rootViewController?.pushViewController(
            studentProjectsRankingViewController,
            animated: true
        )
    }
}

// MARK: - Student Projects Ranking Coordinating
extension StudentProjectsRankingCoordinator: StudentProjectsRankingCoordinating { }
