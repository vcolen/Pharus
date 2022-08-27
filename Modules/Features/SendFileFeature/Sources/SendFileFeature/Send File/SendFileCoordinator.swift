//
//  SendFileCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 16/04/22.
//

import UIKit
import CoreApp
import AlertFeature

public struct SendFileCoordinator {

    // MARK: - Properties
    private weak var rootViewController: UINavigationController?
    private let project: ProjectModel

    // MARK: - Initializer
    public  init(
        rootViewController: UINavigationController,
        project: ProjectModel
    ) {
        self.rootViewController = rootViewController
        self.project = project
    }
}

// MARK: - Coordinator
extension SendFileCoordinator: Coordinator {
    public func start() {
        let sendFilePresenter = SendFilePresenter(coordinator: self)
        let sendFileViewController = SendFileViewController(presenter: sendFilePresenter)

        rootViewController?.present(sendFileViewController, animated: true)
    }
}
// MARK: - Actions
extension SendFileCoordinator: SendFileCoordinating {
    func showFileSentAlert() {
        if let navigationController = rootViewController {
            navigationController.dismiss(animated: true)
            SingleButtonAlertCoordinator(
                rootViewController: navigationController,
                alertMessage: "Arquivo enviado com sucesso!",
                alertType: .confirmation
            ).start()
        }
    }

    func closeSheet() {
        rootViewController?.dismiss(animated: true)
    }
}
