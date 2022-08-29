//
//  StudentHomeCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 16/04/22.
//

import UIKit
import CoreApp

public struct StudentHomeCoordinator {

    // MARK: - Properties
    weak var rootViewController: UINavigationController?
    private let student: Student

    public init(
        rootViewController: UINavigationController,
        student: Student
    ) {
        self.rootViewController = rootViewController
        self.student = student
    }
}

// MARK: - Coordinator
extension StudentHomeCoordinator: Coordinator {
    public func start() {
        let studentHomePresenter = StudentHomePresenter(
            coordinator: self,
            student: student
        )

        let studentHomeViewController = StudentHomeViewController(
            presenter: studentHomePresenter
        )

        rootViewController?.setNavigationBarHidden(true, animated: true)
        rootViewController?.tabBarController?.tabBar.isHidden = false

        rootViewController?.pushViewController(studentHomeViewController, animated: true)
    }
}
// MARK: - Student Home Coordinating
extension StudentHomeCoordinator: StudentHomeCoordinating { }
