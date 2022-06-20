//
//  LogoutAlertPresenter.swift
//  Pharus
//
//  Created by Victor Colen on 20/04/22.
//

import UIKit

class LogoutAlertPresenter: LogoutAlertPresenting {

    // MARK: - Properties

    private let coordinator: LogoutAlertCoordinator

    // MARK: - Initializer

    init(coordinator: LogoutAlertCoordinator) {
        self.coordinator = coordinator
    }

    // MARK: - Actions

    func closeModal() {
        coordinator.closeModal()
    }

    func logout() {
        coordinator.logout()
    }
}
