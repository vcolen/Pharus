//
//  SendFileCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 16/04/22.
//

import UIKit

class SendFileCoordinator: Coordinator {

    // MARK: - Properties
    private let navigationController: UINavigationController
    private let project: ProjectModel

    // MARK: - Initializer

    init(
        navigationController: UINavigationController,
        project: ProjectModel
    ) {
        self.navigationController = navigationController
        self.project = project
    }

    func start() {
        let sendFilePresenter = SendFilePresenter(coordinator: self)
        let sendFileViewController = SendFileViewController(presenter: sendFilePresenter)

        navigationController.present(sendFileViewController, animated: true)
    }
}

// MARK: - Actions

extension SendFileCoordinator: SendFileCoordinating {
    func showFileSentAlert() {
        let alertCoordinator = SingleButtonAlertCoordinator(
            navigationController: navigationController,
            alertMessage: "Arquivo enviado com sucesso!",
            alertType: .confirmation
        )

        navigationController.topViewController?.dismiss(animated: true)
        alertCoordinator.start()
    }

    func closeSheet() {
        navigationController.topViewController?.dismiss(animated: true)
    }
}
