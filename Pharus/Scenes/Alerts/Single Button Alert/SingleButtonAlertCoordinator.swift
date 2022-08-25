//
//  SingleButtonAlertCoordinator.swift
//  Pharus
//
//  Created by Victor Colen on 16/04/22.
//

import UIKit
import CoreApp

struct SingleButtonAlertCoordinator {

    // MARK: - Properties
    private weak var rootViewController: UINavigationController?
    private let alertMessage: String
    private let alertType: SingleButtonAlertView.AlertType

    // MARK: - Initializer
    init(
        rootViewController: UINavigationController,
        alertMessage: String,
        alertType: SingleButtonAlertView.AlertType
    ) {
        self.rootViewController = rootViewController
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

        rootViewController?.present(alertViewController, animated: true)
    }
}

// MARK: - Actions
extension SingleButtonAlertCoordinator: SingleButtonAlertCoordinating {
    func closeModal() {
        rootViewController?.dismiss(animated: true)
    }
}
