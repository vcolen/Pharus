//
//  SendFileCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 16/04/22.
//

import UIKit
import AlertFeature
import CoreKit
import CoreApp

public struct SendFileCoordinator {

    // MARK: - Properties
    private weak var rootViewController: UINavigationController?

    // MARK: - Initializer
    public  init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
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
