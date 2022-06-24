//
//  SingleButtonAlertCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 16/04/22.
//

import UIKit

class SingleButtonAlertCoordinator {

    // MARK: - Properties
    private let navigationController: UINavigationController
    private let alertMessage: String
    private let alertType: SingleButtonAlertView.AlertType

    // MARK: - Initializer
    init(
        navigationController: UINavigationController,
        alertMessage: String,
        alertType: SingleButtonAlertView.AlertType
    ) {
        self.navigationController = navigationController
        self.alertMessage = alertMessage
        self.alertType = alertType
    }
}

// MARK: - Coordinator
extension SingleButtonAlertCoordinator: Coordinator {
    func start() {
        let alertPresenter = SingleButtonAlertPresenter(
            coordinator: self,
            alertMessage: alertMessage,
            alertType: alertType
        )

        let alertViewController = SingleButtonAlertViewController(
            presenter: alertPresenter
        )

        alertViewController.modalPresentationStyle = .overFullScreen

        navigationController.present(alertViewController, animated: true)
    }
}

// MARK: - Actions
extension SingleButtonAlertCoordinator: SingleButtonAlertCoordinating {
    func closeModal() {
        navigationController.topViewController?.dismiss(animated: true)
    }
}
