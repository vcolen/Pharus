//
//  StudentProjectDetailCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 11/04/22.
//

import UIKit
import AlertFeature
import SendFileFeature
import CoreKit
import CoreApp
import InjectionKit

struct StudentProjectDetailCoordinator {

    // MARK: - Properties
    private weak var rootViewController: UINavigationController?
    private let projectId: Int
    @Injected var getProjectUseCaseProtocol: GetProjectUseCaseProtocol

    // MARK: - Initializer
    init(
        rootViewController: UINavigationController,
        project: Int
    ) {
        self.rootViewController = rootViewController
        self.projectId = project
    }
}

// MARK: - Coordinator
extension StudentProjectDetailCoordinator: Coordinator {
    func start() {
        let studentProjectDetailPresenter = StudentProjectDetailPresenter(
            coordinator: self,
            project: projectId
        )
        let studentProjectDetailViewController = StudentProjectDetailViewController(
            presenter: studentProjectDetailPresenter
        )

        studentProjectDetailViewController.title = getProjectUseCaseProtocol(id: projectId).name
        rootViewController?.pushViewController(
            studentProjectDetailViewController,
            animated: true
        )
    }
}

// MARK: - Student Project Detail Coordinating
extension StudentProjectDetailCoordinator: StudentProjectDetailCoordinating {
    func showProjectRules() {
        if let navigationController = rootViewController {
            ProjectSheetCoordinator(
                rootViewController: navigationController,
                projectId: projectId,
                projectSheetContent: .activities
            ).start()
        }
    }

    func showMentorReview() {
        if let navigationController = rootViewController {
            ProjectSheetCoordinator(
                rootViewController: navigationController,
                projectId: projectId,
                projectSheetContent: .mentorReview
            ).start()
        }
    }

    func showSendFileView() {
//                if let navigationController = rootViewController {
//                    SendFileCoordinator(
//                        rootViewController: navigationController,
//                        projectId: projectId
//                    ).start()
//                }
    }
}
