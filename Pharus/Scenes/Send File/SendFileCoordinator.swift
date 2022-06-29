//
//  SendFileCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 16/04/22.
//

import UIKit

struct SendFileCoordinator {

    // MARK: - Properties
    private weak var rootViewController: UINavigationController?
    private let project: ProjectModel

    // MARK: - Initializer
    init(
        navigationController: UINavigationController,
        project: ProjectModel
    ) {
        self.rootViewController = navigationController
        self.project = project
    }
}

// MARK: - Coordinator
extension SendFileCoordinator: Coordinator {
    func start() {
        let sendFilePresenter = SendFilePresenter(coordinator: self)
        let sendFileViewController = SendFileViewController(presenter: sendFilePresenter)

        rootViewController?.present(sendFileViewController, animated: true)
    }
}
// MARK: - Actions
extension SendFileCoordinator: SendFileCoordinating {
    func showFileSentAlert() {

        if let navigationController = rootViewController {
            let alertCoordinator = SingleButtonAlertCoordinator(
                navigationController: navigationController,
                alertMessage: "Arquivo enviado com sucesso!",
                alertType: .confirmation
            )

            navigationController.topViewController?.dismiss(animated: true)
            alertCoordinator.start()
        }
    }

    func closeSheet() {
        rootViewController?.topViewController?.dismiss(animated: true)
    }
}
