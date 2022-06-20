//
//  SingleButtonAlertPresenter.swift
//  Pharus
//
//  Created by Victor Colen on 16/04/22.
//

import UIKit

class SingleButtonAlertPresenter: SingleButtonAlertPresenting {

    // MARK: - Properties

    private let coordinator: SingleButtonAlertCoordinator
    let alertMessage: String
    let alertType: SingleButtonAlertView.AlertType

    // MARK: - Initializer

    init(
        coordinator: SingleButtonAlertCoordinator,
        alertMessage: String,
        alertType: SingleButtonAlertView.AlertType
    ) {
        self.coordinator = coordinator
        self.alertMessage = alertMessage
        self.alertType = alertType
    }

    // MARK: - Actions

    func closeModal() {
        coordinator.closeModal()
    }
}
