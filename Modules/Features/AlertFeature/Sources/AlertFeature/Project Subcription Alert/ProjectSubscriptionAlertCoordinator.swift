//
//  ProjectSubscriptionAlertCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 20/04/22.
//

import UIKit
import CoreKit
import CoreApp

public struct ProjectSubscriptionAlertCoordinator {

    // MARK: - Properties
    private weak var rootViewController: UINavigationController?
    private let projectId: Int
    private let projectSubscriptionHandler: () -> Void

    // MARK: - Initializer
    public init(
        rootViewController: UINavigationController,
        projectId: Int,
        onSubscription projectSubscriptionHandler: @escaping () -> Void
    ) {
        self.rootViewController = rootViewController
        self.projectId = projectId
        self.projectSubscriptionHandler = projectSubscriptionHandler
    }
}

// MARK: - Coordinator
extension ProjectSubscriptionAlertCoordinator: Coordinator {
    public func start() {
        let alertPresenter = ProjectSubscriptionAlertPresenter(
            coordinator: self,
            projectId: projectId,
            onSubscription: projectSubscriptionHandler
        )

        let alertViewController = ProjectSubscriptionAlertViewController(
            presenter: alertPresenter
        )

        alertViewController.modalPresentationStyle = .overFullScreen

        rootViewController?.present(alertViewController, animated: true)
    }
}

// MARK: - Actions
extension ProjectSubscriptionAlertCoordinator: ProjectSubscriptionAlertCoordinating {
    func closeModal() {
        rootViewController?.dismiss(animated: true)
    }

    func subscribeToProject() {
        projectSubscriptionHandler()
        closeModal()
        if let navigationController = rootViewController {
            SingleButtonAlertCoordinator(
                rootViewController: navigationController,
                alertMessage: "Inscrição confirmada!",
                alertType: .confirmation
            ).start()
        }
    }
}
