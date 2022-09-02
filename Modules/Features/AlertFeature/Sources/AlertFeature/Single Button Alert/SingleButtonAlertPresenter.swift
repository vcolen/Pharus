//
//  SingleButtonAlertPresenter.swift
//  Pharus
//
//  Created by Victor Colen on 16/04/22.
//

import UIKit
import CoreApp

class SingleButtonAlertPresenter: BasePresenter<SingleButtonAlertViewable>,
                                  SingleButtonAlertPresenting {

    // MARK: - Properties
    private let coordinator: SingleButtonAlertCoordinating
    let alertMessage: String
    let alertType: SingleButtonAlertView.AlertType

    // MARK: - Initializer
    init(
        coordinator: SingleButtonAlertCoordinating,
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
