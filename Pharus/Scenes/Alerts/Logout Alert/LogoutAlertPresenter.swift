//
//  LogoutAlertPresenter.swift
//  Pharus
//
//  Created by Victor Colen on 20/04/22.
//

import UIKit

class LogoutAlertPresenter: BasePresenter<LogoutAlertViewable>, LogoutAlertPresenting {

    // MARK: - Properties
    private let coordinator: LogoutAlertCoordinating

    // MARK: - Initializer
    init(coordinator: LogoutAlertCoordinating) {
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
